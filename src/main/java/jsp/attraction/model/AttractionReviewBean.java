package jsp.attraction.model;

public class AttractionReviewBean {
    String user_id;
    String review_subject;
    String review_content;
    String review_date;
    int attr_no;

    public void setAttr_no(int attr_no) {
        this.attr_no = attr_no;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public void setReview_content(String review_content) {
        this.review_content = review_content;
    }

    public void setReview_date(String review_date) {
        this.review_date = review_date;
    }

    public void setReview_subject(String review_subject) {
        this.review_subject = review_subject;
    }

    public int getAttr_no() {
        return attr_no;
    }

    public String getUser_id() {
        return user_id;
    }

    public String getReview_content() {
        return review_content;
    }

    public String getReview_date() {
        return review_date;
    }

    public String getReview_subject() {
        return review_subject;
    }
}
