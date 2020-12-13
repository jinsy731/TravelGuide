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

    public int auth(String id, String pw) {
        conn = DBConnection.getConnection();
        // sql 문자열 , gb_id 는 자동 등록 되므로 입력하지 않는다.

        String sql ="select * from user_info where USER_ID = ?";
        String sql2 = "select * from user_info where USER_ID = ? and USER_PW = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery();

            /*
                id를 조건으로 select하고, id가 있으면 id와 pw를 조건으로 select해서 있으면 login
             */
            if (rs.next()) {
                pstmt = conn.prepareStatement(sql2);
                pstmt.setString(1, id);
                pstmt.setString(2, pw);
                ResultSet rs2 = pstmt.executeQuery();

                if(rs2.next()) {
                    return 1;  // pw가 일치할 때 1
                } else return 0; // pw가 일치하지 않을 때 0
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

                member.setUSER_BIRTH(rs.getString("USER_BIRTH"));

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

    public String changePassword(String id, String pw, String new_pw) {
        conn = DBConnection.getConnection();
        String sql = "select * from user_info where USER_ID = ? and USER_PW = ?";
        String sql2 = "update user_info set USER_PW = ? where USER_ID = ?";
        String result = "";

        try{
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pw);
            ResultSet rs = pstmt.executeQuery();

            /*
                id와 password로 select해서 해당하는 row가 있으면 update,
                없으면 비밀번호가 틀린 것 -> result를 invalid pw
             */
            if (rs.next()) {
                pstmt = conn.prepareStatement(sql2);
                pstmt.setString(1, new_pw);
                pstmt.setString(2, id);
                pstmt.executeUpdate();
            } else {
                result = "invalid pw";
            }

        }catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.disconnect(conn, pstmt);
            return result;
        }
    }

    public String deleteMember(String id, String pw) {
        conn = DBConnection.getConnection();
        // sql 문자열 , gb_id 는 자동 등록 되므로 입력하지 않는다.
        String sql = "select * from user_info where USER_ID = ? and USER_PW = ?";
        String sql2 ="delete from user_info where USER_ID = ? and USER_PW = ?";
        String result = "";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pw);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                pstmt = conn.prepareStatement(sql2);
                pstmt.setString(1, id);
                pstmt.setString(2, pw);
                pstmt.executeUpdate();
            } else {
                result = "invalid pw";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBConnection.disconnect(conn, pstmt);
        }
        return result;
    }

    // 요청을 하는 유저와 게시글 등의 작성자가 같은지 확인
    public boolean verifyUser(String id, int no) {
        boolean check = false;
        conn = DBConnection.getConnection();
        String sql = "select BOARD_OWNER_ID from board where BOARD_NUM = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, no);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                System.out.println("boardownerid : " + rs.getString("BOARD_OWNER_ID"));
                if(rs.getString("BOARD_OWNER_ID").equals(id)) {
                   check = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBConnection.disconnect(conn, pstmt);
            return check;
        }
    }

    public boolean dupCheck(String id) {
        conn = DBConnection.getConnection();
        String sql = "select * from user_info where USER_ID = ?";
        boolean check = false;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);

            ResultSet rs = pstmt.executeQuery();
            if(rs.next()) {
                check = false;
            } else {
                check = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.disconnect(conn,pstmt);
        }
        return check;
    }

    public boolean forgotPassword(String id, String email, String hint){
        conn = DBConnection.getConnection();
        ResultSet rs;
        boolean check = false;
        String sql = "select * from user_info where USER_ID = ? and USER_EMAIL = ? and USER_HINT = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, email);
            pstmt.setString(3, hint);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                check = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBConnection.disconnect(conn, pstmt);
            return check;
        }
    }

    public void resetPassword(String id, String pw) {
        conn = DBConnection.getConnection();
        String sql = "update user_info set USER_PW = ? where USER_ID = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, pw);
            pstmt.setString(2, id);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}




































