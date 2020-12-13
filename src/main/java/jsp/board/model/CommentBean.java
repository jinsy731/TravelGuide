package jsp.board.model;

public class CommentBean {
    String user_id;
    String write_date;
    String content;

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setWrite_date(String write_date) {
        this.write_date = write_date;
    }

    public String getUser_id() {
        return user_id;
    }

    public String getContent() {
        return content;
    }

    public String getWrite_date() {
        return write_date;
    }

}
