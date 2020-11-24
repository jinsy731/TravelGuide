package jsp.reserve.model;

import jsp.board.model.BoardBean;
import jsp.board.model.BoardDAO;
import jsp.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ReserveDAO {
    private static ReserveDAO instance;

    // 싱글톤 패턴
    private ReserveDAO(){}
    public static ReserveDAO getInstance(){
        if(instance==null)
            instance=new ReserveDAO();
        return instance;
    }

    Connection conn = null;
    PreparedStatement pstmt = null;

    // 예약 목록 반환
    public ArrayList<ReserveBean> getReserveList(String id) {
        conn = DBConnection.getConnection();
        // sql 문자열 , gb_id 는 자동 등록 되므로 입력하지 않는다.

        String sql = "select r.RESERVE_NUM, r.USER_ID, r.RESERVE_DATE_START, r.RESERVE_DATE_END, r.RESERVE_STATE, uc.COURSE, c.DESTINATION\n" +
                "from reserve r, course c, user_course uc\n" +
                "where r.RESERVE_NUM = uc.RESERVE_NUM and\n" +
                "      uc.COURSE = c.COURSE and " +
                "      r.USER_ID = ?; ";
        ArrayList<ReserveBean> list = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);

            ResultSet result = pstmt.executeQuery();

            while(result.next()) {
                System.out.println("item");
                ReserveBean bean = new ReserveBean();
                bean.setReserve_course_item(result.getString("uc.COURSE"));
                bean.setReserve_state(result.getString("r.RESERVE_STATE"));
                bean.setReserve_date_start(result.getString("r.RESERVE_DATE_START"));
                bean.setReserve_date_end(result.getString("r.RESERVE_DATE_END"));
                bean.setUser_id(id);
                bean.setDestination(result.getString("c.DESTINATION")   );
                bean.setReserve_num(result.getInt("r.RESERVE_NUM"));
                list.add(bean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        finally {
            DBConnection.disconnect(conn, pstmt);
        }
        return list;
    }


    // 목적지 목록 반환
    public ArrayList<DestListBean> getDestList() {
        conn = DBConnection.getConnection();
        // sql 문자열 , gb_id 는 자동 등록 되므로 입력하지 않는다.

        String sql = "select * from destination";
        ArrayList<DestListBean> list = new ArrayList<DestListBean>();

        try {
            pstmt = conn.prepareStatement(sql);

            ResultSet result = pstmt.executeQuery();

            while(result.next()) {
                DestListBean bean = new DestListBean();
                bean.setDestination(result.getString("DESTINATION"));

                list.add(bean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        finally {
            DBConnection.disconnect(conn, pstmt);
        }
        return list;
    }

    // 코스 목록 반환
    public ArrayList<String> getCourseList(String dest) {
        conn = DBConnection.getConnection();
        // sql 문자열 , gb_id 는 자동 등록 되므로 입력하지 않는다.

        String sql = "select * from course where DESTINATION = ?";
        ArrayList<String> list = new ArrayList<String>();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dest);
            ResultSet result = pstmt.executeQuery();

            while(result.next()) {
                list.add(result.getString("COURSE"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        finally {
            DBConnection.disconnect(conn, pstmt);
        }
        return list;
    }


    // 예약 목록 등록
    public boolean insertReservation(ReserveBean bean) {
        conn = DBConnection.getConnection();
        // sql 문자열 , gb_id 는 자동 등록 되므로 입력하지 않는다.

        String sql = "insert into reserve(USER_ID, RESERVE_DATE_START, RESERVE_DATE_END, RESERVE_STATE) values(?,?,?,?)";
        String sql2 = "select RESERVE_NUM from reserve where USER_ID = ? and RESERVE_DATE_START = ? and RESERVE_DATE_END = ? and RESERVE_STATE = ?";

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, bean.getUser_id());
            pstmt.setString(2, bean.getReserve_date_start());
            pstmt.setString(3, bean.getReserve_date_end());
            pstmt.setString(4, bean.getReserve_state());

            pstmt.executeUpdate();

            pstmt = conn.prepareStatement(sql2);

            pstmt.setString(1, bean.getUser_id());
            pstmt.setString(2, bean.getReserve_date_start());
            pstmt.setString(3, bean.getReserve_date_end());
            pstmt.setString(4, bean.getReserve_state());

            ResultSet result = pstmt.executeQuery();

            if(result.next()) {
                int reserve_num = result.getInt("RESERVE_NUM");
                insertUserCourse(bean, reserve_num);
                System.out.println("insert course");
            }


        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        finally {
            DBConnection.disconnect(conn, pstmt);
        }
        return true;
    }

    public boolean insertUserCourse(ReserveBean bean, int reserve_num) {
        conn = DBConnection.getConnection();
        // sql 문자열 , gb_id 는 자동 등록 되므로 입력하지 않는다.

        String sql = "insert into user_course values(?,?)";

        try {
            for(String course : bean.getReserve_course()) {
                pstmt = conn.prepareStatement(sql);

                pstmt.setInt(1, reserve_num);
                pstmt.setString(2, course);

                pstmt.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        finally {
            DBConnection.disconnect(conn, pstmt);
        }
        return true;
    }

    // 여행지 반환
    public ArrayList<TravelInfoBean> getTravelDistList() {
        conn = DBConnection.getConnection();
        // sql 문자열 , gb_id 는 자동 등록 되므로 입력하지 않는다.

        String sql = "select tdName, tdLatitude, tdLongitude from travel_info";
        ArrayList<TravelInfoBean> beanList = new ArrayList<TravelInfoBean>();

        try {
            pstmt = conn.prepareStatement(sql);
            ResultSet result = pstmt.executeQuery();

            while(result.next()) {
                TravelInfoBean bean = new TravelInfoBean();
                bean.setTdName(result.getString("tdName"));
                bean.setTdLatitude(result.getDouble("tdLatitude"));
                bean.setTdLongitude(result.getDouble("tdLongitude"));
                beanList.add(bean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        finally {
            DBConnection.disconnect(conn, pstmt);
        }
        return beanList;
    }

}
