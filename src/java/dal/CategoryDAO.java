package dal;

import java.sql.*;
import java.util.ArrayList;
import model.Category;

public class CategoryDAO extends DBContext {

    public ArrayList<Category> getAllCategory() {
        ArrayList<Category> list = new ArrayList<>();

        String sql = "select * from categories";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet ans = st.executeQuery();
            while (ans.next()) {
                int cID = ans.getInt("cID");
                String cName = ans.getString("cName");
                String cDes = ans.getString("cDes");
                Category c = new Category(cID, cName, cDes);
                list.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public void insertCategory(Category c) {
        String sql = "insert into categories (cName,cDes) values (?,?)";
        try {
            PreparedStatement st = conn.prepareStatement(sql);

            st.setString(1, c.getcName());
            st.setString(2, c.getcDes());

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Category findCategoryByID(int id) {
        String sql = "select * from category where cid=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet ans = st.executeQuery();
            if (ans.next()) {
                Category c = new Category(ans.getInt("cid"),
                        ans.getString("cname"), ans.getString("cdes")
                );
                return c;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Category findCategoryByName(String name) {
        String sql = "select * from categories where cName=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, name);
            ResultSet ans = st.executeQuery();
            if (ans.next()) {
                Category c = new Category(ans.getInt("cID"),
                        ans.getString("cName"),
                        ans.getString("cDes"));
                return c;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void deleleCategoryByID(int id) {
        String sql = "delete from categories where cid=?";
        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
