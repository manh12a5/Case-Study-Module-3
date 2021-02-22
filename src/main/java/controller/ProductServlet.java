package controller;

import model.Manufacturer;
import model.Product;
import model.Shop;
import service.manufacturer.IManufacturerService;
import service.manufacturer.ManufacturerService;
import service.product.IProductService;
import service.product.ProductService;
import service.shop.IShopService;
import service.shop.ShopService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/products")
public class ProductServlet extends HttpServlet {

    //Tạo đối tượng
    IProductService productService = new ProductService();
    IManufacturerService manufacturerService = new ManufacturerService();
    IShopService shopService = new ShopService();

    //Các phương thức Get
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "":
                showAllProducts(request, response);
                break;
            case "create":
                showCreateProduct(request, response);
                break;
            case "edit":
                showEditProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "search":
                searchNameProduct(request, response);
        }
    }

    private void showAllProducts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/view.jsp");
        List<Product> productList = productService.findAll();
        request.setAttribute("product", productList);
        requestDispatcher.forward(request, response);
    }

    private void showCreateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Product product = new Product();
        List<Manufacturer> manufacturers = manufacturerService.findAll();
        List<Shop> shops = shopService.findAll();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/create.jsp");
        request.setAttribute("product", product);
        request.setAttribute("manufacturer", manufacturers);
        request.setAttribute("shop", shops);
        requestDispatcher.forward(request, response);
    }

    private void showEditProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        List<Manufacturer> manufacturers = manufacturerService.findAll();
        List<Shop> shops = shopService.findAll();
        Product product = productService.findById(id);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/edit.jsp");
        request.setAttribute("product", product);
        request.setAttribute("manufacturer", manufacturers);
        request.setAttribute("shop", shops);
        requestDispatcher.forward(request, response);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.delete(id);
        List<Product> products = productService.findAll();
        request.setAttribute("product", products);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/view.jsp");
        requestDispatcher.forward(request, response);
    }

    private void searchNameProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        List<Product> products = productService.findByName(name);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/view.jsp");
        request.setAttribute("product", products);
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
                createNewProduct(request, response);
                break;
            case "edit":
                editProduct(request, response);
                break;
        }
    }

    private void createNewProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        String color = request.getParameter("color");
        String description = request.getParameter("description");
        int manufacturer = Integer.parseInt(request.getParameter("manufacturer"));
        int shop = Integer.parseInt(request.getParameter("shop"));
        String image = request.getParameter("image");
        Product product = new Product(name, price, amount, color, description, manufacturer, shop, image);
        productService.insert(product);
        try {
            response.sendRedirect("/products");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        int amount = Integer.parseInt(request.getParameter("amount"));
        String color = request.getParameter("color");
        String description = request.getParameter("description");
        int manufacturer = Integer.parseInt(request.getParameter("manufacturer"));
        int shop = Integer.parseInt(request.getParameter("shop"));
        String image = request.getParameter("image");
        Product product = new Product(id, name, price, amount, color, description, manufacturer, shop, image);
        productService.edit(product);
        try {
            response.sendRedirect("/products");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
