package jsp.attraction.model;


import jsp.util.DBConnection;

import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;

public class
AttractionDAO {

    private static AttractionDAO instance;

    // 싱글톤 패턴
    private AttractionDAO(){}
    public static AttractionDAO getInstance(){
        if(instance==null)
            instance=new AttractionDAO();
        return instance;
    }

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs;

    // 게시글 리스트 반환
    public AttractionBean getAttrContent(String attr_no) {
        conn = DBConnection.getConnection();
        // sql 문자열 , gb_id 는 자동 등록 되므로 입력하지 않는다.

        AttractionBean bean = new AttractionBean();
        String sql = "select * from attraction where attr_no = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, attr_no);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                bean.setAttr_no(rs.getInt(1));
                bean.setAttr_type(rs.getString(2));
                bean.setAttr_name(rs.getString(3));
                bean.setAttr_desc(rs.getString(4));
                bean.setAttr_phone(rs.getString(5));
                bean.setAttr_website(rs.getString(6));
                bean.setAttr_closed(rs.getString(7));
                bean.setAttr_time(rs.getString(8));
                bean.setAttr_openday(rs.getString(9));
                bean.setAttr_price(rs.getString(10));
                bean.setAttr_addr(rs.getString(11));
                bean.setAttr_traffic(rs.getString(12));
                bean.setAttr_longitude(rs.getDouble(13));
                bean.setAttr_latitude(rs.getDouble(14));
                bean.setAttr_reserve_price(rs.getInt(15));
            }

        }
        catch (SQLException e) {
                e.printStackTrace();
        }
        finally {
            DBConnection.disconnect(conn, pstmt);
            return bean;
        }
    }

    public ArrayList<AttractionReviewBean> getAttrReview(String attr_no) {
        conn = DBConnection.getConnection();
        ArrayList<AttractionReviewBean> beanList = new ArrayList<AttractionReviewBean>();
        String sql = "select * from attraction_review where attr_no = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, attr_no);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                AttractionReviewBean bean = new AttractionReviewBean();
                bean.setAttr_no(rs.getInt(1));
                bean.setUser_id(rs.getString(2));
                bean.setReview_subject(rs.getString(3));
                bean.setReview_content(rs.getString(4));
                bean.setReview_date(rs.getString(5));
                beanList.add(bean);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBConnection.disconnect(conn, pstmt);
            return beanList;
        }
    }

    public void setAttrReview(AttractionReviewBean bean) {
        conn = DBConnection.getConnection();
        String sql = "insert into attraction_review(attr_no, user_id, review_subject, review_content, review_date) values(?,?,?,?, CURDATE())";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bean.getAttr_no());
            pstmt.setString(2, bean.getUser_id());
            pstmt.setString(3, bean.getReview_subject());
            pstmt.setString(4, bean.getReview_content());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.disconnect(conn, pstmt);
        }
    }

    public ArrayList<String> getAttrImg(String attr_no) {
        conn = DBConnection.getConnection();
        ArrayList<String> imgList = new ArrayList<String>();
        String sql = "select attr_img from attraction_img where attr_no = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, attr_no);
            rs = pstmt.executeQuery();

            while(rs.next()) {
                imgList.add(rs.getString(1));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.disconnect(conn, pstmt);
            return imgList;
        }
    }

}
