package controller;

import model.Account;
import service.user.IUserService;
import service.user.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet(name="UserServlet", value ="/user")
public class UserServlet extends HttpServlet {
    private IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher =req.getRequestDispatcher("user/user.jsp");
        List<Account> accountList = userService.findAll();
        req.setAttribute("user",accountList);
        requestDispatcher.forward(req,resp);
    }
}
