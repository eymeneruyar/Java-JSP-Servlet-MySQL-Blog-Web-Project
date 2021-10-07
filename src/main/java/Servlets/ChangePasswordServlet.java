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

@WebServlet(name = "ChangePasswordServlet",value = "/change-password-servlet")
public class ChangePasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //int aid = Integer.parseInt(req.getParameter("aid"));
        int aid = (int) req.getSession().getAttribute("aid");
        req.getSession().setAttribute("updateAid",aid);

        resp.sendRedirect(Util.homePage_url + "changePasswordScreen.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        String newPassword = req.getParameter("newPassword");
        String reNewPassword = req.getParameter("reNewPassword");

        if(!newPassword.equals(reNewPassword)){

            req.setAttribute("changePasswordError","Şifreler uyuşmuyor!");
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/changePasswordScreen.jsp");
            dispatcher.forward(req,resp);

        }else{
            boolean aidStatus = req.getSession().getAttribute("updateAid") != null;
            if(aidStatus){

                int aid = (int) req.getSession().getAttribute("updateAid");
                DBUtil util = new DBUtil();
                int status = util.passwordUpdate(aid,newPassword);
                req.getSession().removeAttribute("updateAid");

            }

            resp.sendRedirect(Util.homePage_url + "editScreen.jsp");
        }



    }

}
