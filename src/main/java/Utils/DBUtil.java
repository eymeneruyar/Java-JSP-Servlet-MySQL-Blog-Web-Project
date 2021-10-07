package Utils;

import Properties.Article;
import Properties.Images;
import Properties.ReaderMessage;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DBUtil {

    public boolean login(String email, String password, String remember, HttpServletRequest req, HttpServletResponse resp){

        boolean status = false;

        DB db = new DB();


        try {

            String sql = "select * from myblog.author where email = ? and password = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1,email);
            pre.setString(2,Util.MD5(password));
            ResultSet rs = pre.executeQuery();
            status = rs.next();

            if(status){
                //session create
                int aid = rs.getInt("aid");
                String name = rs.getString("name");
                String surname = rs.getString("surname");
                req.getSession().setAttribute("aid",aid);
                req.getSession().setAttribute("name",name);
                req.getSession().setAttribute("surname",surname);

                //cookies create
                if(remember != null && remember.equals("on")){
                    name = name.replaceAll(" ","_");
                    String val = aid + "_" + name + "_" + surname;
                    Cookie cookie = new Cookie("user",val);
                    cookie.setMaxAge(60*60*3);
                    resp.addCookie(cookie);
                }
            }

        } catch (Exception e) {
            System.err.println("Login Error: " + e );
        } finally {
            db.close();
        }

        return status;

    }

    public int articleInsert(Article article, int aid){

        int status = 0;

        DB db = new DB();

        try {

            String sql = "insert into myblog.article values (null,?,?,?,now(),?)";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1,article.getTitle());
            pre.setString(2,article.getCategory());
            pre.setString(3,article.getArticleText());
            pre.setInt(4,aid);
            status = pre.executeUpdate();

        } catch (Exception e) {
            if( e.toString().contains("SQLIntegrityConstraintViolationException")){
                status = -1;
            }
            System.err.println("Article Insert Error: " + e);
        } finally {
            db.close();
        }

        return status;

    }

    //Giriş yapan kişiye göre sıralanan haberler
    public List<Article> authorArticles(int aid){

        List<Article> ls = new ArrayList<>();
        DB db = new DB();

        try {

            String sql = "select * from myblog.article where aid = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1,aid);
            ResultSet rs = pre.executeQuery();

            while(rs.next()){
                int articleID = rs.getInt("articleID");
                String title = rs.getString("title");
                String category = rs.getString("category");
                String articleText = rs.getString("articleText");
                Date date = rs.getDate("date");

                Article article = new Article(articleID,title,category,articleText,date);
                ls.add(article);

            }

        } catch (Exception e) {
            System.err.println("Author Articles Error: " + e);
        } finally {
            db.close();
        }

        return ls;

    }

    public int articleDelete(int articleID){

        int status = 0;

        DB db = new DB();

        try {

            String sql = "delete from myblog.article where articleID = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1,articleID);
            status = pre.executeUpdate();

        } catch (Exception e) {
            System.err.println("Article Delete Error: " + e);
        } finally {
            db.close();
        }

        return status;

    }

    public boolean isArticleValid(int articleID,int aid){

        boolean status = false;
        DB db = new DB();

        try {

            String sql = "select * from myblog.article where articleID = ? and aid = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1,articleID);
            pre.setInt(2,aid);
            ResultSet rs = pre.executeQuery();
            status = rs.next();

        } catch (Exception e) {
            System.err.println("Is Article Valid Error: " + e);
        } finally {
            db.close();
        }

        return status;

    }

    public Images imageSelect( String category ){

        Images img = new Images();
        DB db = new DB();

        try {

            String sql = "select * from myblog.images where category = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1,category);
            ResultSet rs = pre.executeQuery();
            if(rs.next()){
                int imageID = rs.getInt("imageID");
                String name = rs.getString("name");
                String img_dir = rs.getString("img_dir");

                img.setImageID(imageID);
                img.setImage_dir(img_dir);
                img.setImageName(name);
                return img;
            }

        } catch (Exception e) {
            System.err.println("Image Select Error: " + e);
        } finally {
            db.close();
        }

        return img;

    }

    public List<Article> allArticles(){

        List<Article> ls = new ArrayList<>();
        DB db = new DB();

        try {

            String sql = "select * from myblog.article ";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();

            while(rs.next()){
                int articleID = rs.getInt("articleID");
                String title = rs.getString("title");
                String category = rs.getString("category");
                String articleText = rs.getString("articleText");
                Date date = rs.getDate("date");

                Article article = new Article(articleID,title,category,articleText,date);
                ls.add(article);

            }

        } catch (Exception e) {
            System.err.println("All Articles Error: " + e);
        } finally {
            db.close();
        }

        return ls;

    }

    public Article singleArticleInfo(int articleID){

        Article article = new Article();
        DB db = new DB();

        try {

            String sql = "select * from myblog.article where articleID = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1,articleID);
            ResultSet rs = pre.executeQuery();

            if (rs.next()){
                int articleIDX = rs.getInt("articleID");
                String title = rs.getString("title");
                String category = rs.getString("category");
                String articleText = rs.getString("articleText");
                Date date = rs.getDate("date");
                article = new Article(articleIDX,title,category,articleText,date);
                return article;
            }

        } catch (Exception e) {
            System.err.println("Single Article Information Error: " + e);
        } finally {
            db.close();
        }

        return  article;

    }

    public int articleUpdate(int articleID,String title,String articleText,String category){

        int status = 0;
        DB db  = new DB();

        try {

            String sql = "update myblog.article set title = ?, articleText = ?, category = ? where articleID = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1,title);
            pre.setString(2,articleText);
            pre.setString(3,category);
            pre.setInt(4,articleID);
            status = pre.executeUpdate();

        } catch (Exception e) {
            System.err.println("Article Update Error: " + e);
        } finally {
            db.close();
        }

        return status;

    }

    //Update password
    public int passwordUpdate(int aid,String password){

        int status = 0;
        DB db = new DB();

        try {

            String sql = "update myblog.author set password = ? where aid = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1,Util.MD5(password));
            pre.setInt(2,aid);
            status = pre.executeUpdate();

        } catch (Exception e) {
            System.err.println("Password Update Error: " + e);
        } finally {
            db.close();
        }

        return status;

    }

    //Insert Message Data
    public int readerMessageInsert(ReaderMessage reader){

        int status = 0;

        DB db = new DB();

        try {

            String sql = "insert into myblog.reader values (null,?,?,?,?,now())";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setString(1,reader.getName());
            pre.setString(2,reader.getEmail());
            pre.setString(3,reader.getSubject());
            pre.setString(4,reader.getMessage());
            status = pre.executeUpdate();

        } catch (Exception e) {
            if( e.toString().contains("SQLIntegrityConstraintViolationException")){
                status = -1;
            }
            System.err.println("Article Insert Error: " + e);
        } finally {
            db.close();
        }

        return status;

    }

    //All messages
    public List<ReaderMessage> allMessages(){

        List<ReaderMessage> ls = new ArrayList<>();

        DB db = new DB();

        try {

            String sql = "select * from myblog.reader";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while(rs.next()){
                int readerID = rs.getInt("readerID");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String subject = rs.getString("subject");
                String message = rs.getString("message");
                Date date = rs.getDate("date");
                ReaderMessage reader = new ReaderMessage(name,email,subject,message,date,readerID);
                ls.add(reader);
            }

        } catch (Exception e) {
            System.err.println("All Messages Error: " + e);
        } finally {
            db.close();
        }
        return ls;
    }

    //Delete message
    public int messageDelete(int readerID){

        int status = 0;

        DB db = new DB();

        try {

            String sql = "delete from myblog.reader where readerID = ?";
            PreparedStatement pre = db.conn.prepareStatement(sql);
            pre.setInt(1,readerID);
            status = pre.executeUpdate();

        } catch (Exception e) {
            System.err.println("Message Delete Error: " + e);
        } finally {
            db.close();
        }

        return status;

    }

}
