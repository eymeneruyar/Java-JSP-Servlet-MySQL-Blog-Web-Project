package Servlets;

import Properties.Article;
import Utils.DB;
import Utils.DBUtil;
import Utils.Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ArticleServlet",value = "/article-servlet")
public class ArticleServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        Article article = new Article();

        String category = req.getParameter("category");
        String title = req.getParameter("title");
        String articleText = req.getParameter("articleText");

        article.setCategory(category);
        article.setTitle(title);
        article.setArticleText(articleText);
        int aid = (int) req.getSession().getAttribute("aid");

        DBUtil util = new DBUtil();
        int status = util.articleInsert(article,aid);

        if(status > 0){
            resp.sendRedirect(Util.homePage_url + "editScreen.jsp");
        }
        else{
            String errorMessage = "";
            if( status == 0){
                errorMessage = "Ekleme sırasında bir hata oluştu.";
            }
            if( status == -1){
                errorMessage = "Bu metin başlığı daha önce kullanılmış.";
            }
            req.setAttribute("ArticleInsertError",errorMessage);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/editScreen.jsp");
            dispatcher.forward(req,resp);
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int articleID = Integer.parseInt(req.getParameter("articleID"));

        try {

            DBUtil util = new DBUtil();
            int aid = (int) req.getSession().getAttribute("aid");

            if( util.isArticleValid(articleID,aid)){
                int status = util.articleDelete(articleID);
                if(status > 0){}
            }


        }catch (Exception e){
            System.err.println("Delete Item Error: " + e);
        }
        resp.sendRedirect(Util.homePage_url + "editScreen.jsp");

    }

}
