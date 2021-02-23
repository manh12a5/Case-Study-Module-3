package service.shop;
import model.Shop;
import service.SingletonConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ShopService implements IShopService {

    Connection connection = SingletonConnection.getConnection();

    @Override
    public List<Shop> findAll() {
        List<Shop> shops = new ArrayList<>();
        ResultSet resultSet = null;
        try (PreparedStatement preparedStatement = connection.prepareStatement("select * from shop")){
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("shop_id");
                String name = resultSet.getString("nameShop");
                String address = resultSet.getString("address");
                String phone = resultSet.getString("phoneNumber");
                int accountId = resultSet.getInt("account_id");
                shops.add(new Shop(id, name, address, phone, accountId));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
            } catch (SQLException e){
                e.printStackTrace();
            }
        }
        return shops;
    }

    @Override
    public Shop findById(int id) {
        Shop shop = null;
        ResultSet resultSet = null;
        try (PreparedStatement p = connection.prepareStatement("select * from shop where id=?")) {
            p.setInt(1, id);
            resultSet = p.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("nameShop");
                String address = resultSet.getString("address");
                String phone = resultSet.getString("phoneNumber");
                int accountId = resultSet.getInt("account_id");
                shop = new Shop(id, name, address, phone, accountId);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                if (resultSet != null) resultSet.close();
            } catch (SQLException e){
                e.printStackTrace();
            }
        }
        return shop;
    }

    @Override
    public void insert(Shop shop) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "insert into shop (nameshop, address, phonenumber, account_id) values (?, ?, ?, ?)")) {

            preparedStatement.setString(1, shop.getName());
            preparedStatement.setString(2, shop.getAddress());
            preparedStatement.setString(3, shop.getPhoneNumber());
            preparedStatement.setInt(4, shop.getAccountId());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("delete from shop where shop_id = ?");
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public int getAccountId(String name) {
        int id = 0;
        ResultSet resultSet = null;
        try(PreparedStatement preparedStatement = connection.prepareStatement("select account_id from account where fullName = ?")){
            preparedStatement.setString(1, name);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                id = resultSet.getInt("account_id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
            } catch (SQLException e){
                e.printStackTrace();
            }
        }
        return id;
    }

    @Override
    public List<String> getNameAccount() {
        List<String> nameAccount = new ArrayList();
        ResultSet resultSet = null;
        try (PreparedStatement preparedStatement = connection.prepareStatement("select fullName from account")) {
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("fullName");
                nameAccount.add(name);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null)
                    resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return nameAccount;
    }

    @Override
    public void update(Shop shop) {
        try (PreparedStatement p = connection.prepareStatement("update shop set nameShop = ?, address= ?, phoneNumber = ?, account_id = ? where shop_id =?")){
            p.setInt(5, shop.getId());
            p.setString(1, shop.getName());
            p.setString(2, shop.getAddress());
            p.setString(3, shop.getPhoneNumber());
            p.setInt(4, shop.getAccountId());
            p.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<Shop> findByName(String name) {
        return null;
    }
}
