package service.account;

import model.Account;

public interface IAccountService {
    Account login(String email, String password);

    Account checkAccountExist(String email);

    void registerAccount(String name, String email, String password, String birthday, String phone_number, String address);
}