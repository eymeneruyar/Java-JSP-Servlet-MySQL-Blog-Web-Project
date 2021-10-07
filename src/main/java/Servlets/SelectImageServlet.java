package Servlets;

import Properties.Images;
import Utils.DBUtil;
import Utils.Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SelectImageServlet",value = "/select-image-servlet")
public class SelectImageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String category = "Teknoloji";
        DBUtil util = new DBUtil();
        Images img = util.imageSelect(category);

        System.out.println("İmage dir: " + img.getImage_dir());

        resp.sendRedirect(Util.homePage_url);

    }
}
