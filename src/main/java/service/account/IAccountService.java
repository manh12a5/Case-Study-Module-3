package service.account;

import model.Account;

public interface IAccountService {
    public Account login(String email, String password);
}
