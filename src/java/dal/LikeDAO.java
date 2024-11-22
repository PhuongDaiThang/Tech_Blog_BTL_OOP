package dal;

import java.sql.*;
import java.util.*;
import model.Like;

public class LikeDAO extends DBContext{
    public boolean isLikeByUser(int pid, int uid){
        String sql = "Select * from likes where pid=? and uid=?";
        
        try{
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1,pid);
            st.setInt(2, uid);
            
            ResultSet ans = st.executeQuery();
            
            if(ans.next()){
                return true;
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        
        return false;
    }
    
    public void addLike(int pid, int uid){
        String sql = "insert into likes (pid,uid) values(?,?)";
        
        try{
            PreparedStatement st = conn.prepareStatement(sql);
            
            st.setInt(1, pid);
            st.setInt(2, uid);
            st.executeUpdate();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }
    
//    public int countLike(int pid){
//        int cnt = 0;
//        String sql = "select * from likes where pid=?";
//        
//        try{
//            PreparedStatement st = conn.prepareStatement(sql);
//            
//            st.setInt(1, pid);
//            ResultSet ans = st.executeQuery();
//            
//            while(ans.next()){
////                cnt = ans.getInt("count(*");
//                int postID = ans.getInt("pid");
//                int userID = ans.getInt("uid");
//                cnt++;
//            }
//        }
//        catch(SQLException e){
//            e.printStackTrace();
//        }
//        return cnt;
//    }
    
    public int countLike(int pid){
        int cnt = 0;
        String sql = "select count(*) as likeCount from likes where pid=?";
        
        try{
            PreparedStatement st = conn.prepareStatement(sql);
            
            st.setInt(1, pid);
            ResultSet ans = st.executeQuery();
            
            if(ans.next()){
                cnt = ans.getInt("likeCount");
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return cnt;
    }
    
    public void deleteLike(int pid, int uid){
        String sql = "delete from likes where pid=? and uid=?";
        
        try{
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, pid);
            st.setInt(2, uid);
            
            st.executeUpdate();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }
}
