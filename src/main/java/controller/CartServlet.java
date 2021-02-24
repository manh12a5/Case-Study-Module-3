package controller;

import model.Cart;
import model.Product;
import service.cart.CartService;
import service.cart.ICartService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CartServlet", value = "/cart")
public class CartServlet extends HttpServlet {

    ICartService cartService = new CartService();

    //Các phương thức Get
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "":
                showAllCart(request, response);
                break;
            case "create":
                showCreateCart(request, response);
            case "delete":
                deleteCart(request, response);
                break;
        }
    }

    private void showAllCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("cart/view.jsp");
        List<Cart> cartList = cartService.findAll();
        request.setAttribute("cart", cartList);
        requestDispatcher.forward(request, response);
    }

    private void showCreateCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void deleteCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        cartService.delete(id);
        List<Cart> cartList = cartService.findAll();
        request.setAttribute("cart", cartList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("cart/view.jsp");
        requestDispatcher.forward(request, response);
    }

    //Các phương thức Post
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                break;
            case "delete":
                break;
        }
    }

}