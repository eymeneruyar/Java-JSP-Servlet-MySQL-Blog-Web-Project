package Properties;

import java.util.Date;

public class ReaderMessage {

    private String name;
    private String email;
    private String subject;
    private String message;
    private Date date;
    private int readerID;

    public ReaderMessage() {
    }

    public ReaderMessage(String name, String email, String subject, String message, Date date, int readerID) {
        this.name = name;
        this.email = email;
        this.subject = subject;
        this.message = message;
        this.date = date;
        this.readerID = readerID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getReaderID() {
        return readerID;
    }

    public void setReaderID(int readerID) {
        this.readerID = readerID;
    }
}
