package service.cart;

import model.Cart;
import service.SingletonConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CartService implements ICartService {

    Connection connection = SingletonConnection.getConnection();

    @Override
    public List<Cart> findAll() {
        List<Cart> carts = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from shoppingCart");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("cart_id");
                Date beginDate = resultSet.getDate("beginDate");
                Date endDate = resultSet.getDate("endDate");
                String status = resultSet.getString("status");
                carts.add(new Cart(id, beginDate, endDate, status));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return carts;
    }

    @Override
    public Cart findById(int id) {
        return null;
    }

    @Override
    public void insert(Cart cart) {
        String insertSQL = "insert into shoppingCart (beginDate, status) values (?, ?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(insertSQL);
            preparedStatement.setDate(1, cart.getBeginDate());
            preparedStatement.setString(2, cart.getStatus());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        String deleteSQL = "delete from shoppingCart where cart_id = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(deleteSQL);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void edit(Cart cart) {

    }

    @Override
    public List<Cart> findByName(String name) {
        return null;
    }
}
