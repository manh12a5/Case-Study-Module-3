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
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AccountServlet", value = "/login")
public class AccountServlet extends HttpServlet {
    private final IAccountService accountService = new AccountService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "register":
                registerAccount(request,response);
                break;
            default:
                loginAccount(request,response);

        }

    }

    private void registerAccount(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String fullName = request.getParameter("fullname");
        String birthday = request.getParameter("birthday");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String re_password = request.getParameter("re-password");
        String phone_number = request.getParameter("phone-number");
        String address = request.getParameter("address");
        if(!password.equals(re_password)){
            request.setAttribute("mess","Password does not match");
            request.getRequestDispatcher("product/login.jsp").forward(request,response);
        } else{
            Account account = accountService.checkAccountExist(email);
            if( account== null){ // chua co => duoc dang ky
                accountService.registerAccount(fullName,email,password,birthday,phone_number,address);
                response.sendRedirect("/login");
            } else {
                request.setAttribute("mess","This email has already been registered");
                request.getRequestDispatcher("product/login.jsp").forward(request,response);
            }
        }

    }

    private void loginAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("username");
        String password = request.getParameter("password");
        Account account = accountService.login(email, password);
        if (account == null) {
            request.setAttribute("mess", "Wrong user or password!");
            request.getRequestDispatcher("product/login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("acc",account);
            response.sendRedirect("/index.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "register":
                showRegisterForm(request,response);
                break;
            case "logout":
                logoutAccount(request,response);
                break;
            default:
                showLoginForm(request,response);
                break;
        }

    }

    private void logoutAccount(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("acc");
        response.sendRedirect("/index.jsp");
    }

    private void showRegisterForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/register.jsp");
        requestDispatcher.forward(request,response);
    }

    private void showLoginForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("product/login.jsp");
        requestDispatcher.forward(request, response);
    }
}