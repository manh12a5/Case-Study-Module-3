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
        String query = "select * from account where gmail= ? and password= ?;";
        connection = SingletonConnection.getConnection();
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                return new Account(
                        resultSet.getInt("account_id"),
                        resultSet.getString("fullName"),
                        resultSet.getString("password"),
                        resultSet.getString("gmail"),
                        resultSet.getString("birthday"),
                        resultSet.getString("phoneNumber"),
                        resultSet.getString("address"),
                        resultSet.getInt("role_id")
                );
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    @Override
    public Account checkAccountExist(String email) {
        String query = "select * from account where gmail= ?;";
        connection = SingletonConnection.getConnection();
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                return new Account(
                        resultSet.getInt("account_id"),
                        resultSet.getString("fullName"),
                        resultSet.getString("password"),
                        resultSet.getString("gmail"),
                        resultSet.getString("birthday"),
                        resultSet.getString("phoneNumber"),
                        resultSet.getString("address"),
                        resultSet.getInt("role_id")
                );
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    @Override
    public void registerAccount(String name, String email, String password, String birthday, String phone_number, String address) {
        String query = "insert into account (fullName, password , gmail, birthday, phoneNumber, address)\n" +
                "values (?,?,?,?,?,?);";
        connection = SingletonConnection.getConnection();
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,name);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, birthday);
            preparedStatement.setString(5, phone_number);
            preparedStatement.setString(6, address);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

}

