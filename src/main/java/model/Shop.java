package model;

public class Shop {
    private int id;
    private String name;
    private String address;
    private String phoneNumber;
    private int accountId;

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public Shop() {
    }

    public Shop(String name, String address, String phoneNumber) {
        this.name = name;
        this.address = address;
        this.phoneNumber = phoneNumber;
    }

    public Shop(String name, String address, String phoneNumber, int accountId) {
        this.name = name;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.accountId = accountId;
    }

    public Shop(int id, String name, String address, String phoneNumber, int accountId) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.accountId = accountId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

}
