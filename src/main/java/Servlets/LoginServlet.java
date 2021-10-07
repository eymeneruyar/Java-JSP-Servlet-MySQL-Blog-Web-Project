package Servlets;

import Utils.DBUtil;
import Utils.Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login-servlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String remember = req.getParameter("remember");

        System.out.println("Remember value: " + remember);

        DBUtil util = new DBUtil();
        boolean status = util.login(email,password,remember,req,resp);

        if(status){

            resp.sendRedirect(Util.homePage_url + "editScreen.jsp");

        }else{

            System.out.println("Hata");
            req.setAttribute("loginError","E-mail ya da Şifre hatalı!");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/loginScreen.jsp");
            dispatcher.forward(req,resp);

        }



    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        resp.sendRedirect(Util.homePage_url + "loginScreen.jsp");

    }
}
