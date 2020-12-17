package jsp.reserve.model;

import java.sql.Array;
import java.sql.Date;
import java.util.ArrayList;

public class ReserveBean {
    int reserve_num;
    String user_id;
    String destination;
    String reserve_date_start, reserve_date_end;
    String reserve_state;
    String reserve_course_item;
    int reserve_price;
    ArrayList<String> reserve_course = new ArrayList<String>();

    public int getReserve_price() {
        return reserve_price;
    }

    public void setReserve_price(int reserve_price) {
        this.reserve_price = reserve_price;
    }


    public void setReserve_course(ArrayList<String> reserve_course) {
        this.reserve_course = reserve_course;
    }

    public void setReserve_date_end(String reserve_date_end) {
        this.reserve_date_end = reserve_date_end;
    }

    public void setReserve_date_start(String reserve_date_start) {
        this.reserve_date_start = reserve_date_start;
    }

    public void setReserve_state(String reserve_state) {
        this.reserve_state = reserve_state;
    }

    public void setReserve_num(int reserve_num) {
        this.reserve_num = reserve_num;
    }

    public void setReserve_course_item(String reserve_course_item) {
        this.reserve_course_item = reserve_course_item;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getReserve_date_end() {
        return reserve_date_end;
    }

    public String getReserve_date_start() {
        return reserve_date_start;
    }

    public String getDestination() {
        return destination;
    }

    public int getReserve_num() {
        return reserve_num;
    }

    public String getReserve_course_item() {
        return reserve_course_item;
    }

    public ArrayList<String> getReserve_course() {
        return reserve_course;
    }

    public String getReserve_state() {
        return reserve_state;
    }

    public String getUser_id() {
        return user_id;
    }

}
