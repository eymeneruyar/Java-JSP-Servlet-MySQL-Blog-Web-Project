package Utils;

import Properties.Author;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Util {

    public static final String homePage_url = "http://localhost:8080/MyBlog_war_exploded/";

    public static String MD5(String md5) {
        try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
            byte[] array = md.digest(md5.getBytes());
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < array.length; ++i) {
                sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1,3));
            }
            return sb.toString();
        } catch (java.security.NoSuchAlgorithmException e) {
        }
        return null;
    }

    public Author isLogin(HttpServletRequest req, HttpServletResponse resp){

        if(req.getSession() != null){
            Cookie[] cookies = req.getCookies();
            for (Cookie cookie: cookies ) {
                if(cookie.getName().equals("user")){
                    String values = cookie.getValue();
                    try {
                        String[] arr = values.split("_");
                        req.getSession().setAttribute("aid",Integer.parseInt(arr[0]));
                        req.getSession().setAttribute("name",arr[1] );
                        req.getSession().setAttribute("surname",arr[2]);
                    }catch (Exception e){
                        Cookie cookie1 = new Cookie("user","");
                        cookie1.setMaxAge(0);
                        resp.addCookie(cookie1);
                        System.err.println("Is Login Error Cookie: " + e);
                    }
                    break;
                }
            }
        }

        Object sessionObj = req.getSession().getAttribute("aid");
        Author author = new Author();
        if(sessionObj == null){
            try {
                resp.sendRedirect(homePage_url);
            }catch (Exception e){
                System.err.println("Is Login Error Session: " + e);
            }
        }
        else{
            int aid = (int) req.getSession().getAttribute("aid");
            String name = (String) req.getSession().getAttribute("name");
            String surname = (String) req.getSession().getAttribute("surname");
            author.setAid(aid);
            author.setName(name);
            author.setSurname(surname);
        }

        return author;

    }



}
