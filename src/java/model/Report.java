package model;

public class Report {
    private int rID;
    private String rType, rContent, rStatus;

    public Report() {
    }

    public Report(int rID, String rType, String rContent, String rStatus) {
        this.rID = rID;
        this.rType = rType;
        this.rContent = rContent;
        this.rStatus = rStatus;
    }

    public Report(String rType, String rContent, String rStatus) {
        this.rType = rType;
        this.rContent = rContent;
        this.rStatus = rStatus;
    }

    public int getRID() {
        return rID;
    }

    public void setRID(int rID) {
        this.rID = rID;
    }

    public String getrType() {
        return rType;
    }

    public void setrType(String rType) {
        this.rType = rType;
    }

    public String getrContent() {
        return rContent;
    }

    public void setrContent(String rContent) {
        this.rContent = rContent;
    }

    public String getrStatus() {
        return rStatus;
    }

    public void setrStatus(String rStatus) {
        this.rStatus = rStatus;
    }
}
