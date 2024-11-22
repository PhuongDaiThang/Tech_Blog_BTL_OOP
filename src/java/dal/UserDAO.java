package dal;

import model.User;
import java.sql.*;
import java.time.LocalDateTime;

public class UserDAO extends DBContext{
    
    public void insertUser(User u){
        String sql = "insert into users (role, username,email,password,gender,about) values (?,?,?,?,?,?)";
        try{
            PreparedStatement st = conn.prepareStatement(sql);
            
            st.setInt(1, u.getRole());
            st.setString(2, u.getUsername());
            st.setString(3, u.getEmail());
            st.setString(4, u.getPassword());
            st.setString(5, u.getGender());
            st.setString(6, u.getAbout());
            
            st.executeUpdate();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }
    
    public User findUserByID(int uID){
        String sql = "select * from users where uid=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            
            st.setInt(1, uID);
            
            ResultSet ans = st.executeQuery();
            
            if (ans.next()) {
                int role = ans.getInt("role");
                String username = ans.getString("username");
                String email = ans.getString("email");
                String password = ans.getString("password");
                String gender = ans.getString("gender");
                String about = ans.getString("about");
                LocalDateTime regDate = ans.getObject("regdate", LocalDateTime.class);
                User u = new User(uID,role,username,email,password,gender,about,regDate);
                return u;
            }
        } catch (SQLException e) {
                e.printStackTrace();
        }
        return null;
    }
    
    public User findUserByUsername(String username) {
        String sql = "select * from users where username=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, username);

            ResultSet ans = st.executeQuery();

            if (ans.next()) {
                int uID = ans.getInt("uid");
                int role = ans.getInt("role");
                String email = ans.getString("email");
                String password = ans.getString("password");
                String gender = ans.getString("gender");
                String about = ans.getString("about");
                LocalDateTime regDate = ans.getObject("regdate", LocalDateTime.class);

                User u = new User(uID, role, username, email, password, gender, about, regDate);
                return u;
            }
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public User findUserByEmail(String email) {
        String sql = "select * from users where email=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, email);

            ResultSet ans = st.executeQuery();

            if (ans.next()) {
                int uID = ans.getInt("uid");
                int role = ans.getInt("role");
                String username = ans.getString("username");
                String password = ans.getString("password");
                String gender = ans.getString("gender");
                String about = ans.getString("about");
                LocalDateTime regDate = ans.getObject("regdate", LocalDateTime.class);

                User u = new User(uID, role, username, email, password, gender, about, regDate);
                return u;
            }
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    
    public User findUserByUsernameAndPassword(String username, String password){
        String sql = "select * from users where username=? and password=?";
        try{
            PreparedStatement st = conn.prepareStatement(sql);
            
            st.setString(1, username);
            st.setString(2, password);
            
            ResultSet ans = st.executeQuery();
            
            if(ans.next()){
                int uID = ans.getInt("uid");
                int role = ans.getInt("role");
                String email = ans.getString("email");
                String gender = ans.getString("gender");
                String about = ans.getString("about");
                LocalDateTime regDate = ans.getObject("regdate", LocalDateTime.class);
                User u = new User(uID,role,username,email,password,gender,about,regDate);
                return u;
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return null;
    }
    
    public void updateUser(User u){
        String sql = "update users set role=?, username=?, email=?, password=?, gender=?, about=?, profile=? where uid=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);

            st.setInt(1, u.getRole());
            st.setString(2, u.getUsername());
            st.setString(3, u.getEmail());
            st.setString(4, u.getPassword());
            st.setString(5, u.getGender());
            st.setString(6, u.getAbout());
            st.setString(7, u.getProfile());  
            st.setInt(8, u.getuID());

            st.executeUpdate();
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
