package service.manufacturer;

import model.Manufacturer;
import model.Product;
import service.SingletonConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ManufacturerService implements IManufacturerService {

    Connection connection = SingletonConnection.getConnection();

    @Override
    public List<Manufacturer> findAll() {
        List<Manufacturer> manufacturers = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from manufacturer");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("manufacturer_id");
                String name = resultSet.getString("nameManufacturer");
                manufacturers.add(new Manufacturer(id, name));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return manufacturers;
    }

    @Override
    public Manufacturer findById(int id) {
        return null;
    }

    @Override
    public void insert(Manufacturer manufacturer) {
        String insertSQL = "insert into manufacturer (nameManufacturer) values (?)";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(insertSQL);
            preparedStatement.setString(1, manufacturer.getName());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void edit(Manufacturer manufacturer) {

    }

    @Override
    public void delete(int id) {

    }

}
