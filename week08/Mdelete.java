package bean.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Mdelete {
    private Connection conn = null;
    public boolean Mdelete(String idx, String stud_id) throws SQLException {
        boolean flag = false;
        PreparedStatement pstmt = null;
        try {
            conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/hdbwork",
                    "s20131517",
                    "gkrtod123A!");
            if(idx == "all") {
                pstmt = conn.prepareStatement("delete from badge;");
            } else {
                pstmt = conn.prepareStatement(
                        "delete from badge where stud_id=?;");
                pstmt.setString(1, stud_id);
            }
            pstmt.executeUpdate();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();;
        } finally {
            try {
                if(conn != null) conn.close();
                if(pstmt != null) pstmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return flag;
    }
}
