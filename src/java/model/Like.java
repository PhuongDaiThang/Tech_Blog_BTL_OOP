package model;

public class Like {
    private int uid, pid;

    public Like() {
    }

    public Like(int uid, int pid) {
        this.uid = uid;
        this.pid = pid;
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
}
