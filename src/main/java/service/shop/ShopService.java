package service.shop;

import model.Shop;
import service.SingletonConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ShopService implements IShopService {

    Connection connection = SingletonConnection.getConnection();

    @Override
    public List<Shop> findAll() {
        List<Shop> shops = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from shop");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("shop_id");
                String name = resultSet.getString("nameShop");
                String address = resultSet.getString("address");
                String phone = resultSet.getString("phoneNumber");
                shops.add(new Shop(id, name, address, phone));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return shops;
    }

    @Override
    public Shop findById(int id) {
        return null;
    }

    @Override
    public void insert(Shop shop) {

    }

    @Override
    public void edit(Shop shop) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public List<Shop> findByName(String name) {
        return null;
    }
}
