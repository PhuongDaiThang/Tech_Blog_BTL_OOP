package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Report;

public class ReportDAO extends DBContext {

    public void addReport(Report report) {
        String sql = "insert into reports (rtpye, rcontent, rstatus) values (?, ?, ?)";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, report.getrType());
            st.setString(2, report.getrContent());
            st.setString(3, report.getrStatus());

            st.executeUpdate();
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateReport(int rID, String newStatus) {
        String sql = "update reports set rstatus = ? where rid = ?";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setString(1, newStatus);
            st.setInt(2, rID);

            st.executeUpdate();
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteReport(int rID) {
        String sql = "delete from reports where rid = ?";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            st.setInt(1, rID);

            st.executeUpdate();
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Report> getAllReport() {
        List<Report> reports = new ArrayList<>();
        String sql = "select * from reports";

        try {
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                Report report = new Report();
                report.setRID(rs.getInt("rid"));
                report.setrType(rs.getString("rtpye"));
                report.setrContent(rs.getString("rcontent"));
                report.setrStatus(rs.getString("rstatus"));

                reports.add(report);
            }
        } 
        catch (SQLException e) {
            e.printStackTrace();
        }

        return reports;
    }
}
