package jsp.board.model;

import jsp.member.model.MemberBean;
import jsp.member.model.MemberDAO;
import jsp.util.DBConnection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class
BoardDAO {

    private static BoardDAO instance;

    // 싱글톤 패턴
    private BoardDAO(){}
    public static BoardDAO getInstance(){
        if(instance==null)
            instance=new BoardDAO();
        return instance;
    }

    Connection conn = null;
    PreparedStatement pstmt = null;

    // 게시글 리스트 반환
    public ArrayList<BoardBean> getBoardList(int page) {
        conn = DBConnection.getConnection();
        // sql 문자열 , gb_id 는 자동 등록 되므로 입력하지 않는다.

        String sql = "select * from board order by board_num desc limit ?, ?";
        ArrayList<BoardBean> list = new ArrayList<BoardBean>();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, (page-1)*10);
            pstmt.setInt(2, 10);

            ResultSet result = pstmt.executeQuery();

            while(result.next()) {
                BoardBean bean = new BoardBean();
                bean.setBoard_num(result.getInt("BOARD_NUM"));
                bean.setBoard_subject(result.getString("BOARD_SUBJECT"));
                bean.setBoard_content(result.getString("BOARD_CONTENT"));
                bean.setBoard_owner_id(result.getString("BOARD_OWNER_ID"));
                bean.setBoard_date(result.getDate("BOARD_DATE"));
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

    public BoardBean getContent(int num) {
        conn = DBConnection.getConnection();
        // sql 문자열 , gb_id 는 자동 등록 되므로 입력하지 않는다.

        String sql = "select * from board where BOARD_NUM = ?";
        String sql2 = "select * from board_comment where BOARD_NUM = ?";
        BoardBean bean = new BoardBean();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);

            ResultSet result = pstmt.executeQuery();

            if(result.next()) {
                bean.setBoard_num(result.getInt("BOARD_NUM"));
                bean.setBoard_subject(result.getString("BOARD_SUBJECT"));
                bean.setBoard_content(result.getString("BOARD_CONTENT"));
                bean.setBoard_owner_id(result.getString("BOARD_OWNER_ID"));
                bean.setBoard_date(result.getDate("BOARD_DATE"));
            }

            else {
                return null;
            }

            pstmt = conn.prepareStatement(sql2);
            pstmt.setInt(1, num);

            result = pstmt.executeQuery();

            ArrayList<CommentBean> commentList = new ArrayList<>();

            while(result.next()) {
                CommentBean comment = new CommentBean();
                comment.setWrite_date(result.getString("COMMENT_DATE"));
                comment.setUser_id(result.getString("COMMENT_USER_ID"));
                comment.setContent(result.getString("COMMENT_CONTENT"));
                commentList.add(comment);
            }

            bean.setCommentList(commentList);


        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        finally {
            DBConnection.disconnect(conn, pstmt);
        }
        return bean;
    }

    public boolean insertBoard(BoardBean bean) {
        conn = DBConnection.getConnection();
        // sql 문자열 , gb_id 는 자동 등록 되므로 입력하지 않는다.

        String sql = "insert into board(BOARD_OWNER_ID,BOARD_SUBJECT,BOARD_CONTENT,BOARD_DATE) values(?,?,?,?)";


        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, bean.getBoard_owner_id());
            pstmt.setString(2, bean.getBoard_subject());
            pstmt.setString(3, bean.getBoard_content());
            pstmt.setDate(4, bean.getBoard_date());

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

    public boolean insertComment(CommentBean bean, int board_num) {
        conn = DBConnection.getConnection();
        // sql 문자열 , gb_id 는 자동 등록 되므로 입력하지 않는다.

        String sql = "insert into board_comment(BOARD_NUM,COMMENT_USER_ID,COMMENT_DATE,COMMENT_CONTENT) values(?,?,?,?)";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, board_num);
            pstmt.setString(2, bean.getUser_id());
            pstmt.setString(3, bean.getWrite_date());
            pstmt.setString(4, bean.getContent());

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

    public int getRowCount() {
        conn = DBConnection.getConnection();

        String sql = "select count(*) from board";
        int count = 0;

        try {
            pstmt = conn.prepareStatement(sql);
            ResultSet result = pstmt.executeQuery();

            if(result.next()) {
                count = result.getInt("count(*)");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
            DBConnection.disconnect(conn, pstmt);
        }

        return count;
    }


    public void DeleteBoard(int board_no) {
        conn = DBConnection.getConnection();
        String sql = "Delete from board where BOARD_NUM = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, board_no);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void ModifyBoard(String subject, String content, int board_no) {
        conn = DBConnection.getConnection();
        String sql = "update board set board_subject = ? where BOARD_NUM = ?";
        String sql2 = "update board set board_content = ? where BOARD_NUM = ?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, subject);
            pstmt.setInt(2, board_no);
            pstmt.executeUpdate();

            pstmt = conn.prepareStatement(sql2);
            pstmt.setString(1, content);
            pstmt.setInt(2, board_no);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();;
        }
    }



}
