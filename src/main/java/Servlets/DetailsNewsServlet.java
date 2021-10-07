package Servlets;

import Properties.Article;
import Utils.DBUtil;
import Utils.Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DetailsNewsServlet", value = "/details-news-servlet")
public class DetailsNewsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

            int articleID = Integer.parseInt(req.getParameter("articleID"));
            req.getSession().setAttribute("updateArticleID",articleID);
            DBUtil util = new DBUtil();
            Article article = util.singleArticleInfo(articleID);


            if(article == null){
                resp.sendRedirect(Util.homePage_url);
            }else{
                req.setAttribute("article",article);
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/moreDetailsNews.jsp");
                dispatcher.forward(req,resp);
            }


    }

}
