package bean.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

public class Dbmain_Temp {
    public static void main(String[] args){
        boolean flag = false;
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        PreparedStatement pstmt = null;
        String stud_id, stud_passwd, stud_name, stud_email, stud_gender;
        try {
            System.out.println("입력 결과 보기.");
            bean.user.Mselect mselect = new bean.user.Mselect();
            List<bean.user.Userinfo> userlists = new ArrayList<bean.user.Userinfo>();
            userlists = mselect.mselect("all", "");
            for(int i = 0; i < userlists.size(); i++){
                System.out.println(
                        userlists.get(i).getStud_id()+ ", " +
                        userlists.get(i).getStud_name());
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(conn != null) conn.close();
                if(pstmt != null) pstmt.close();
            } catch (Exception e) { e.printStackTrace(); }
        }
    }
}
