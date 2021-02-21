package service.account;

import model.Account;
import service.SingletonConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountService implements IAccountService {
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    @Override
    public Account login(String email, String password) {
        String query = "select * from account where email= ? and password= ?;";
        connection = SingletonConnection.getConnection();
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                return new Account(
                        resultSet.getInt(1),
                        resultSet.getString(2),
                        resultSet.getString(3),
                        resultSet.getString(4),
                        resultSet.getString(5),
                        resultSet.getString(6),
                        resultSet.getString(7),
                        resultSet.getInt(8)
                );
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }
}
