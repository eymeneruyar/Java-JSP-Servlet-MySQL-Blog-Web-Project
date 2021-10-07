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

@WebServlet(name = "ArticleUpdateServlet",value = "/article-update-servlet")
public class ArticleUpdateServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int articleID = Integer.parseInt(req.getParameter("articleID"));
        int aid = (int) req.getSession().getAttribute("aid");

        req.getSession().setAttribute("updateArticleID",articleID);

        DBUtil util = new DBUtil();
        Article article = util.singleArticleInfo(articleID);

        if( util.isArticleValid(articleID,aid)){
            req.setAttribute("article",article);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/articleUpdateScreen.jsp");
            dispatcher.forward(req,resp);
        }else{
            resp.sendRedirect(Util.homePage_url + "editScreen.jsp");
        }



    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        boolean articleStatus = req.getSession().getAttribute("updateArticleID") != null;
        if(articleStatus){

            String title = req.getParameter("title");
            String articleText = req.getParameter("articleText");
            String category = req.getParameter("category");
            int articleID = (int) req.getSession().getAttribute("updateArticleID");

            DBUtil util = new DBUtil();

            int status = util.articleUpdate(articleID,title,articleText,category);
            req.getSession().removeAttribute("updateArticleID");

        }

        resp.sendRedirect(Util.homePage_url + "editScreen.jsp");

    }
}
