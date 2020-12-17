package jsp.reserve.model;

import jsp.board.model.BoardBean;
import jsp.board.model.BoardDAO;
import jsp.util.DBConnection;

import java.sql.*;
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
    public ArrayList<ReserveBean> getReserveList(String id, int page) {
        conn = DBConnection.getConnection();
        // sql 문자열 , gb_id 는 자동 등록 되므로 입력하지 않는다.

        String sql = "select * from reserve where USER_ID = ? and RESERVE_STATE = ? limit ?, ?";
        ArrayList<ReserveBean> list = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, "접수중");
            pstmt.setInt(3, (page-1)*5);
            pstmt.setInt(4, page*5);

            ResultSet result = pstmt.executeQuery();

            while(result.next()) {
                System.out.println("item");
                ReserveBean bean = new ReserveBean();
                bean.setUser_id(id);
                bean.setDestination(result.getString("RESERVE_DEST"));
                bean.setReserve_num(result.getInt("RESERVE_NUM"));
                bean.setReserve_date_start(result.getString("RESERVE_DATE_START"));
                bean.setReserve_date_end(result.getString("RESERVE_DATE_END"));
                bean.setReserve_state(result.getString("RESERVE_STATE"));
                bean.setReserve_price(result.getInt("RESERVE_PRICE"));

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

    // 예약 목록 반환
    public ArrayList<ReserveBean> getReserveCompleteList(String id, int page) {
        conn = DBConnection.getConnection();
        // sql 문자열 , gb_id 는 자동 등록 되므로 입력하지 않는다.

        String sql = "select * from reserve where USER_ID = ? and RESERVE_STATE = ? limit ?, ?";
        ArrayList<ReserveBean> list = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, "접수완료");
            pstmt.setInt(3, (page-1)*5);
            pstmt.setInt(4, page*5);

            ResultSet result = pstmt.executeQuery();

            while(result.next()) {
                System.out.println("item");
                ReserveBean bean = new ReserveBean();
                bean.setUser_id(id);
                bean.setDestination(result.getString("RESERVE_DEST"));
                bean.setReserve_num(result.getInt("RESERVE_NUM"));
                bean.setReserve_date_start(result.getString("RESERVE_DATE_START"));
                bean.setReserve_date_end(result.getString("RESERVE_DATE_END"));
                bean.setReserve_state(result.getString("RESERVE_STATE"));
                bean.setReserve_price(result.getInt("RESERVE_PRICE"));

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

    public String getImg(String attr_name) {
        conn = DBConnection.getConnection();
        String sql = "select attr_img from attraction a, attraction_img i where a.attr_no = i.attr_no and attr_name = ?";
        String imgsrc = null;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, attr_name);

            ResultSet rs = pstmt.executeQuery();

            if(rs.next()) {
                imgsrc = rs.getString(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.disconnect(conn, pstmt);
            return imgsrc;
        }
    }

    public void deleteReserve(String reserve_num, String id) {
        conn = DBConnection.getConnection();
        String sql = "delete from reserve where reserve_num = ? and USER_ID = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, reserve_num);
            pstmt.setString(2, id);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.disconnect(conn, pstmt);
        }
    }

    public int getRowCount(String id) {
        conn = DBConnection.getConnection();
        int count = 0;
        String sql = "select count(*) from reserve where USER_ID = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            ResultSet result = pstmt.executeQuery();

            if(result.next()) {
                count = result.getInt("count(*)");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.disconnect(conn, pstmt);
            return count;
        }
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

        String sql = "insert into reserve(USER_ID, RESERVE_DATE_START, RESERVE_DATE_END, RESERVE_STATE, RESERVE_DEST, RESERVE_PRICE) values(?,?,?,?,?,?)";
        //String sql2 = "select RESERVE_NUM from reserve where USER_ID = ? and RESERVE_DATE_START = ? and RESERVE_DATE_END = ? and RESERVE_STATE = ?";

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, bean.getUser_id());
            pstmt.setString(2, bean.getReserve_date_start());
            pstmt.setString(3, bean.getReserve_date_end());
            pstmt.setString(4, bean.getReserve_state());
            pstmt.setString(5, bean.getDestination());
            pstmt.setInt(6, bean.getReserve_price());

            pstmt.executeUpdate();


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

        String sql = "select * from travel_info";
        ArrayList<TravelInfoBean> beanList = new ArrayList<TravelInfoBean>();

        try {
            pstmt = conn.prepareStatement(sql);
            ResultSet result = pstmt.executeQuery();

            while(result.next()) {
                TravelInfoBean bean = new TravelInfoBean();
                bean.setTdName(result.getString("tdName"));
                bean.setTdLatitude(result.getDouble("tdLatitude"));
                bean.setTdLongitude(result.getDouble("tdLongitude"));
                bean.setTdNAddr(result.getString("tdNAddr"));
                bean.setTdRAddr(result.getString("tdRAddr"));
                bean.setTdDescription(result.getString("tdDescription"));
                bean.setTdsuprtFclty(result.getString("tdsuprtFclty"));
                bean.setTdRcrFclty(result.getString("tdRcrFclty"));
                bean.setTdExFclty(result.getString("tdExFclty"));
                bean.setTdStayInfo(result.getString("tdStayInfo"));
                bean.setTdCnvFclty(result.getString("tdCnvFclty"));
                bean.setTdDist(result.getString("tdDist"));
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

    public void reservePay(ArrayList<ReserveBean> beanList){
        conn = DBConnection.getConnection();
        String sql = "update reserve set RESERVE_STATE = ? where RESERVE_NUM = ? and USER_ID = ?";
        try {
            pstmt = conn.prepareStatement(sql);

            for (ReserveBean bean : beanList) {
                pstmt.setString(1, "접수완료");
                pstmt.setInt(2, bean.getReserve_num());
                pstmt.setString(3, bean.getUser_id());

                pstmt.executeUpdate();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.disconnect(conn, pstmt);
        }
    }

}
