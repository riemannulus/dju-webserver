package bean.user;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Mselect {
    private Connection conn = null;
    public List<bean.user.Userinfo> mselect(String idx, String stud_id) throws SQLException{
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<bean.user.Userinfo> userlists = null;
        try {
            userlists = new ArrayList<bean.user.Userinfo>();
            conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/hdbwork",
                    "hstud",
                    "gkrtod123A!"
            );

            if(idx == "all") {
                pstmt = conn.prepareStatement("select * from s20131517;");
            } else {
                pstmt = conn.prepareStatement("select * from s20131517 where stud_id=?;");
                pstmt.setString(1, stud_id);
            }
            rs = pstmt.executeQuery();
            while(rs.next()){
                bean.user.Userinfo userlist = new bean.user.Userinfo();
                userlist.setStud_id(rs.getString("stud_id"));
                userlist.setStud_passwd(rs.getString("stud_passwd"));
                userlist.setStud_name(rs.getString("stud_name"));
                userlist.setStud_email(rs.getString("stud_email"));
                userlist.setStud_gender(rs.getString("stud_gender"));
                userlists.add(userlist);
            }
        } catch (Exception e) { e.printStackTrace(); }
        finally {
            try{
                if(conn!=null) conn.close();
                if(pstmt!=null) pstmt.close();
            } catch (Exception e) { e.printStackTrace(); }
        }
        return userlists;
    }
}
