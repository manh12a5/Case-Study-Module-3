package controller;

import model.Product;
import model.Shop;
import service.shop.IShopService;
import service.shop.ShopService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShopServlet", urlPatterns = "/shop")
public class ShopServletController extends HttpServlet {
    IShopService shopService = new ShopService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createNewShop(request, response);
                break;
            case "delete":
                deleteShop(request, response);
                break;
            case "edit":
                editProduct(request, response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "":
                showAllShop(request, response);
                break;

        }
    }

    private void showAllShop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("shop/view.jsp");
        List<Shop> shopList = shopService.findAll();
        List<String> nameAccount = shopService.getNameAccount();
        request.setAttribute("nameAccount", nameAccount);
        request.setAttribute("shop", shopList);
        requestDispatcher.forward(request, response);
    }

    private void deleteShop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        shopService.delete(id);
        List<Shop> shopList = shopService.findAll();
        request.setAttribute("shop", shopList);
        response.sendRedirect("/shop");
    }



    private void createNewShop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("nameShop");
        String address = request.getParameter("addressShop");
        String phone = request.getParameter("phoneNumberShop");
        String nameAccount = request.getParameter("nameAccount");
        int accountId = shopService.getAccountId(nameAccount);
        Shop shop = new Shop(name, address, phone, accountId);
        shopService.insert(shop);
        response.sendRedirect("/shop");
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idS"));
        String name = request.getParameter("nameS");
        String address = request.getParameter("addressS");
        String phone = request.getParameter("phoneNumberS");
        int id2 = Integer.parseInt(request.getParameter("account_id"));
        Shop shop = new Shop(id, name, address, phone,id2);
        shopService.update(shop);
        response.sendRedirect("/shop");
    }

}
