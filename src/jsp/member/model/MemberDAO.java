package jsp.member.model;

import jsp.util.DBConnection;

import java.sql.*;

public class MemberDAO {

    private static MemberDAO instance;

    // 싱글톤 패턴
    private MemberDAO(){}
    public static MemberDAO getInstance(){
        if(instance==null)
            instance=new MemberDAO();
        return instance;
    }

    Connection conn = null;
    PreparedStatement pstmt = null;

    // 가입 정보 저장
    public boolean insertMember(MemberBean member) {
        conn = DBConnection.getConnection();
        // sql 문자열 , gb_id 는 자동 등록 되므로 입력하지 않는다.

        String sql = "insert into user_info values(?,?,?,?,?,?,?,?,?)";

        try {
            String d = member.getUSER_BIRTH_YY() + "-"
                    + member.getUSER_BIRTH_MM() + "-"
                    + member.getUSER_BIRTH_DD();
            Date date = Date.valueOf(d);
            java.sql.Date date1 = new java.sql.Date(date.getTime());

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,member.getUSER_ID());
            pstmt.setString(2,member.getUSER_PASSWORD());
            pstmt.setString(3, member.getUSER_NAME());
            pstmt.setString(4, member.getUSER_EMAIL());
            pstmt.setString(5, member.getUSER_ADDR());
            pstmt.setString(6, member.getUSER_PHONE());
            pstmt.setString(7, member.getUSER_GENDER());
            pstmt.setDate(8, date1);
            pstmt.setString(9, member.getUSER_HINT());

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

    public int loginCheck(String id, String pw) {
        conn = DBConnection.getConnection();
        // sql 문자열 , gb_id 는 자동 등록 되므로 입력하지 않는다.

        String sql ="select * from user_info where user_id = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery();

            if(rs.next()) {
                if(rs.getString("USER_PW").equals(pw)) {
                    return 1;  // pw가 일치할 때 1
                }
                else return 0; // pw가 일치하지 않을 때 0

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBConnection.disconnect(conn, pstmt);
        }
        return -1;
    }

    public MemberBean getMemberInfo(String id) {
        conn = DBConnection.getConnection();
        // sql 문자열 , gb_id 는 자동 등록 되므로 입력하지 않는다.

        String sql ="select * from user_info where USER_ID = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery();
            MemberBean member = new MemberBean();

            if(rs.next()) {
                member.setUSER_ID(id);
                member.setUSER_PASSWORD(rs.getString("USER_PW"));
                member.setUSER_EMAIL(rs.getString("USER_EMAIL"));
                member.setUSER_ADDR(rs.getString("USER_ADDR"));
                member.setUSER_NAME(rs.getString("USER_NAME"));
                member.setUSER_PHONE(rs.getString("USER_PHONE"));
                member.setUSER_GENDER(rs.getString("USER_GENDER"));
                member.setUSER_HINT(rs.getString("USER_HINT"));

                String[] substr_date = rs.getString("USER_DATE").split("/");
                member.setUSER_BIRTH_YY(substr_date[0]);
                member.setUSER_BIRTH_MM(substr_date[1]);
                member.setUSER_BIRTH_DD(substr_date[2]);

                return member;

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBConnection.disconnect(conn, pstmt);
        }
        return null;
    }

    public boolean updateMember(MemberBean member) {
        conn = DBConnection.getConnection();
        // sql 문자열 , gb_id 는 자동 등록 되므로 입력하지 않는다.

        String sql ="update user_info set USER_ID = ?, USER_PW = ?, USER_NAME = ?, USER_EMAIL = ?, USER_ADDR = ?, " +
                "USER_PHONE = ?, USER_GENDER = ?, USER_BIRTH = ?, USER_HINT = ? where USER_ID = ?";

        try {
            Date date = Date.valueOf(member.getUSER_BIRTH_YY()+"/"+member.getUSER_BIRTH_MM()+"/"+member.getUSER_BIRTH_DD());

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member.getUSER_ID());
            pstmt.setString(1, member.getUSER_PASSWORD());
            pstmt.setString(1, member.getUSER_NAME());
            pstmt.setString(1, member.getUSER_EMAIL());
            pstmt.setString(1, member.getUSER_ADDR());
            pstmt.setString(1, member.getUSER_PHONE());
            pstmt.setString(1, member.getUSER_GENDER());
            pstmt.setDate(1, date);
            pstmt.setString(1, member.getUSER_HINT());

            return true;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBConnection.disconnect(conn, pstmt);
        }
        return false;
    }

    public int deleteMember(String id) {
        conn = DBConnection.getConnection();
        // sql 문자열 , gb_id 는 자동 등록 되므로 입력하지 않는다.

        String sql ="delete from user_info where user_id = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            int check = pstmt.executeUpdate();

            return check;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBConnection.disconnect(conn, pstmt);
        }
        return -1;
    }
}
