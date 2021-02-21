package controller;

import model.Account;
import service.account.AccountService;
import service.account.IAccountService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AccountServlet", value = "/login")
public class AccountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        IAccountService accountService = new AccountService();
        String email = request.getParameter("username");
        String password = request.getParameter("password");
        Account account = accountService.login(email, password);
        if (account == null) {
            request.setAttribute("mess","Wrong user or password!");
            request.getRequestDispatcher("product/login.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("product/view.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/login.jsp");
        requestDispatcher.forward(request,response);
    }
}
