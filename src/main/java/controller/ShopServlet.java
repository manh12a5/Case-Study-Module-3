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
public class ShopServlet extends HttpServlet {
    IShopService shopService = new ShopService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
            case "create":
//                showCreateShop(request, response);
                break;
            case "edit":
                break;
            case "delete":
                deleteShop(request, response);
                break;
        }
    }

    private void showAllShop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("shop/view.jsp");
        List<Shop> shopList = shopService.findAll();
        request.setAttribute("shop", shopList);
        requestDispatcher.forward(request, response);
    }

    private void deleteShop(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        shopService.delete(id);
        List<Shop> shopList = shopService.findAll();
        request.setAttribute("shop", shopList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("shop/view.jsp");
        requestDispatcher.forward(request, response);
    }
}
