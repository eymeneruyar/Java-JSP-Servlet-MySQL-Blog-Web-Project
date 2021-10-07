package Servlets;

import Properties.ReaderMessage;
import Utils.DBUtil;
import Utils.Util;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "readerServlet", value = "/reader-servlet")
public class ReaderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        ReaderMessage reader = new ReaderMessage();

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String subject = req.getParameter("subject");
        String message = req.getParameter("message");

        reader.setName(name);
        reader.setEmail(email);
        reader.setSubject(subject);
        reader.setMessage(message);

        DBUtil util = new DBUtil();
        int status = util.readerMessageInsert(reader);

        if(status > 0){
            resp.sendRedirect(Util.homePage_url+"#contact");
        }
        else{
            String errorMessage = "";
            if( status == 0){
                errorMessage = "Mesaj gönderilirken bir hata oluştu.";
            }
            req.setAttribute("messageInsertError",errorMessage);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
            dispatcher.forward(req,resp);
        }

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int readerID = Integer.parseInt(req.getParameter("readerID"));

        try {

            DBUtil util = new DBUtil();

            int status = util.messageDelete(readerID);
            if(status > 0){}



        }catch (Exception e){
            System.err.println("Delete Item Error: " + e);
        }
        resp.sendRedirect(Util.homePage_url + "messageBoxScreen.jsp");

    }
}
