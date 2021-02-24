package model;

public class orderDetail {
    private int id;
    private int product_id;
    private int card_id;

    public orderDetail() {
    }

    public orderDetail(int id) {
        this.id = id;
    }

    public orderDetail(int id, int product_id, int card_id) {
        this.id = id;
        this.product_id = product_id;
        this.card_id = card_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getCard_id() {
        return card_id;
    }

    public void setCard_id(int card_id) {
        this.card_id = card_id;
    }

}
