package model;

public class Comment {
    private int cmtID, uid, pid;
    private String cmtContent;

    public Comment() {
    }

    public Comment(int cmtID, int uid, int pid, String cmtContent) {
        this.cmtID = cmtID;
        this.uid = uid;
        this.pid = pid;
        this.cmtContent = cmtContent;
    }

    public Comment(int uid, int pid, String cmtContent) {
        this.uid = uid;
        this.pid = pid;
        this.cmtContent = cmtContent;
    }

    public int getCmtID() {
        return cmtID;
    }

    public void setCmtID(int cmtID) {
        this.cmtID = cmtID;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getCmtContent() {
        return cmtContent;
    }

    public void setCmtContent(String cmtContent) {
        this.cmtContent = cmtContent;
    }
}
