package service.shop;

import model.Shop;
import service.IService;

import java.util.List;

public interface IShopService extends IService<Shop> {
    int getAccountId(String name);
    List<String> getNameAccount();
    void update(Shop shop);
}
