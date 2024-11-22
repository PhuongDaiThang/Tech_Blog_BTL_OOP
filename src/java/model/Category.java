package model;

public class Category {
    private int cID;
    private String cName, cDes;

    public Category() {
    }

    public Category(int cID, String cName, String cDes) {
        this.cID = cID;
        this.cName = cName;
        this.cDes = cDes;
    }

    public Category(String cName, String cDes) {
        this.cName = cName;
        this.cDes = cDes;
    }

    public int getcID() {
        return cID;
    }

    public void setcID(int cID) {
        this.cID = cID;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getcDes() {
        return cDes;
    }

    public void setcDes(String cDes) {
        this.cDes = cDes;
    }
}
