package dal;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.*;
import model.Post;

public class PostDAO extends DBContext{
    
    public ArrayList<Post> getAllPost(){
        ArrayList<Post> list = new ArrayList<>();
        
        String sql = "select * from posts order by pid desc";

        try{
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet ans = st.executeQuery();
            
            while(ans.next()){
                int pID = ans.getInt("pid");
                String pTitle = ans.getString("ptitle");
                String pContent = ans.getString("pcontent");
                String pCode = ans.getString("pcode");
                String pImg = ans.getString("pimg");
                LocalDateTime pDate = ans.getObject("pdate", LocalDateTime.class);
                int catID = ans.getInt("catid");
                int userID = ans.getInt("userid");
                Post p = new Post(pID, catID, userID, pTitle, pContent, pCode, pImg, pDate);
                list.add(p);
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        
        return list;
    }
    
    public void insertPost(Post p){
        String sql = "insert into posts (ptitle, pcontent,pcode, pimg, catid, userid) values (?,?,?,?,?,?)";
        
        try{
            PreparedStatement st = conn.prepareStatement(sql);
            
            st.setString(1, p.getpTitle());
            st.setString(2, p.getpContent());
            st.setString(3, p.getpCode());
            st.setString(4, p.getpImg());
            st.setInt(5, p.getCatID());
            st.setInt(6,p.getUserID());
            st.executeUpdate();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public Post getPostByID(int postID) {
        String sql = "select * from posts where pid = ?";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, postID);

            ResultSet ans = st.executeQuery();

            if (ans.next()) {
                int pID = ans.getInt("pid");
                String pTitle = ans.getString("ptitle");
                String pContent = ans.getString("pcontent");
                String pCode = ans.getString("pcode");
                String pImg = ans.getString("pimg");
                LocalDateTime pDate = ans.getObject("pdate", LocalDateTime.class);
                int catID = ans.getInt("catid");
                int userID = ans.getInt("userid");

                Post p = new Post(pID, catID, userID, pTitle, pContent, pCode, pImg, pDate);
                return p;
            }
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }
    
    public ArrayList<Post> getPostByCatID(int catID) {
        ArrayList<Post> list = new ArrayList<>();
        String sql = "select * from posts where catid = ? order by pid desc";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, catID);

            ResultSet ans = st.executeQuery();

            while (ans.next()) {
                int pID = ans.getInt("pid");
                String pTitle = ans.getString("ptitle");
                String pContent = ans.getString("pcontent");
                String pCode = ans.getString("pcode");
                String pImg = ans.getString("pimg");
                LocalDateTime pDate = ans.getObject("pdate", LocalDateTime.class);
                int userID = ans.getInt("userid");

                Post p = new Post(pID, catID, userID, pTitle, pContent, pCode, pImg, pDate);
                list.add(p);
            }
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public ArrayList<Post> getPostByUserID(int userID) {
        ArrayList<Post> list = new ArrayList<>();
        String sql = "select * from posts where userid = ? order by pid desc";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, userID);

            ResultSet ans = st.executeQuery();

            while (ans.next()) {
                int pID = ans.getInt("pid");
                String pTitle = ans.getString("ptitle");
                String pContent = ans.getString("pcontent");
                String pCode = ans.getString("pcode");
                String pImg = ans.getString("pimg");
                LocalDateTime pDate = ans.getObject("pdate", LocalDateTime.class);
                int catID = ans.getInt("catid");

                Post p = new Post(pID, catID, userID, pTitle, pContent, pCode, pImg, pDate);
                list.add(p);
            }
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public void updatePost(Post p) {
        String sql = "update posts set ptitle = ?, pcontent = ?, catid = ? where pid = ?";

        try {
            PreparedStatement st = conn.prepareStatement(sql);

            st.setString(1, p.getpTitle());
            st.setString(2, p.getpContent());
            st.setInt(3, p.getCatID());
            st.setInt(4, p.getpID());

            st.executeUpdate();
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void deletePost(int pid) {
        String sql = "delete from posts where pid = ?";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, pid); // Gán pid của bài viết cần xóa

            st.executeUpdate();
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
