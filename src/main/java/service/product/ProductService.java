package service.product;

import model.Product;
import service.SingletonConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductService implements IProductService {

    SingletonConnection singletonConnection = new SingletonConnection();

    @Override
    public List<Product> findAll() {
        List<Product> products = new ArrayList<>();
        Connection connection = singletonConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(
                    "select * from product;");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("product_id");
                String name = resultSet.getString("nameProduct");
                int price = resultSet.getInt("price");
                int amount = resultSet.getInt("amountProduct");
                String color = resultSet.getString("colorProduct");
                String description = resultSet.getString("description");
                products.add(new Product(id, name, price, amount, color, description));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public void insert(Product product) {
        Connection connection = singletonConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(
                    "insert into product (nameProduct, price, amountProduct, colorProduct, description) values (?, ?, ?, ?, ?)");
            preparedStatement.setString(1, product.getName());
            preparedStatement.setInt(2, product.getPrice());
            preparedStatement.setInt(3, product.getAmount());
            preparedStatement.setString(4, product.getColor());
            preparedStatement.setString(5, product.getDescription());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Product findById(int id) {
        return null;
    }

}

