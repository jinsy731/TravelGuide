package jsp.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBConnection {

    //DB 연결 정보
    static String jdbc_driver = "org.mariadb.jdbc.Driver";
    static String jdbc_url = "jdbc:mariadb://localhost:3306/web?serverTimezone=UTC";

    // DB연결 메서드
    public static Connection getConnection() {
        try {
            Class.forName(jdbc_driver); // 드라이버 로딩

            return DriverManager.getConnection(jdbc_url,"web2020","web2020");
            // DB 연결
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    // DB 연결 해제 메소드
    public static void disconnect(Connection conn, PreparedStatement pstmt) {
        if(pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
