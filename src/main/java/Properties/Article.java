package Properties;

import java.util.Date;

public class Article {

    private int articleID;
    private String title;
    private String category;
    private String articleText;
    private Date date;

    public Article() {
    }

    public Article(int articleID, String title, String category, String articleText, Date date) {
        this.articleID = articleID;
        this.title = title;
        this.category = category;
        this.articleText = articleText;
        this.date = date;
    }

    public int getArticleID() {
        return articleID;
    }

    public void setArticleID(int articleID) {
        this.articleID = articleID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getArticleText() {
        return articleText;
    }

    public void setArticleText(String articleText) {
        this.articleText = articleText;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
