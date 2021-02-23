package service.user;

import model.Account;
import model.Product;
import service.SingletonConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserService implements IUserService{
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    @Override
    public List<Account> findAll() {
        connection = SingletonConnection.getConnection();
        String query = "select * from account;";
        List<Account> list = new ArrayList<>();
        try {
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String fullName = resultSet.getString("fullName");
                String gmail = resultSet.getString("gmail");
                String password = resultSet.getString("password");
                String birth_day = resultSet.getString("birth_day");
                String phoneNumber = resultSet.getString("phoneNumber");
                String address = resultSet.getString("address");
                int role_id = resultSet.getInt("role_id");
                list.add(new Account(fullName,gmail,password,birth_day,phoneNumber,address,role_id));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    @Override
    public Account findById(int id) {
        return null;
    }

    @Override
    public void insert(Account account) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public void edit(Account account) {

    }

    @Override
    public List<Account> findByName(String name) {
        return null;
    }
}
