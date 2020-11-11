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

    // 게시글 리스트 반환
    public ArrayList<BoardBean> getBoardList(int page) {
        conn = DBConnection.getConnection();
        // sql 문자열 , gb_id 는 자동 등록 되므로 입력하지 않는다.

        String sql = "select * from board order by board_num desc limit ?, ?";
        ArrayList<BoardBean> list = new ArrayList<BoardBean>();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, (page-1)*5);
            pstmt.setInt(2, page*5);

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
}
