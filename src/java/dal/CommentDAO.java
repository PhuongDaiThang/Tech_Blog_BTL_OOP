package dal;

import java.sql.*;
import java.util.*;
import model.Comment;

public class CommentDAO extends DBContext{
    public void addComment(Comment c){
        String sql = "insert into comments (uid, pid, cmtContent) values (?, ?, ?)";
    
        try {
            PreparedStatement st = conn.prepareStatement(sql);

            st.setInt(1, c.getUid());
            st.setInt(2, c.getPid());
            st.setString(3, c.getCmtContent());

            st.executeUpdate();
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void deleteComment(int cmtID) {
        String sql = "delete comments where cmtid = ?";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            
            st.setInt(1, cmtID);
            
            st.executeUpdate();
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void editComment(int cmtID, String newContent) {
        String sql = "update comments set cmtcontent = ? where cmtID = ?";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            
            st.setString(1, newContent);
            st.setInt(2, cmtID);
            
            st.executeUpdate();
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public int countComment(int pid) {
        int count = 0;
        String sql = "select count(*) from comments where pid = ?";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            
            st.setInt(1, pid);
            ResultSet ans = st.executeQuery();

            if (ans.next()) {
                count = ans.getInt(1);
            }
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
    
    public boolean isCommentOfUser(int cmtID, int uid) {
        String sql = "select 1 from comments where cmtid = ? and uid = ?";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, cmtID);
            st.setInt(2, uid);
            ResultSet ans = st.executeQuery();

            if (ans.next()) {
                return true;
            }
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
