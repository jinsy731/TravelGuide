package jsp.board.model;

import java.sql.Date;

public class BoardBean {
    int board_num;
    String board_owner_id;
    String board_subject;
    String board_content;
    Date board_date;

    public int getBoard_num() {
        return board_num;
    }

    public String getBoard_content() {
        return board_content;
    }

    public Date getBoard_date() {
        return board_date;
    }

    public String getBoard_owner_id() {
        return board_owner_id;
    }

    public String getBoard_subject() {
        return board_subject;
    }

    public void setBoard_content(String board_content) {
        this.board_content = board_content;
    }

    public void setBoard_num(int board_num) {
        this.board_num = board_num;
    }

    public void setBoard_date(Date board_date) {
        this.board_date = board_date;
    }

    public void setBoard_owner_id(String board_owner_id) {
        this.board_owner_id = board_owner_id;
    }

    public void setBoard_subject(String board_subject) {
        this.board_subject = board_subject;
    }

}
