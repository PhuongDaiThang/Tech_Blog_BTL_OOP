package model;

import java.time.LocalDateTime;

public class Post {
    private int pID, catID, userID;
    private String pTitle, pContent, pCode, pImg;
    private LocalDateTime pDate;

    public Post() {
    }

    public Post(int pID, int catID, int userID, String pTitle, String pContent, String pCode, String pImg, LocalDateTime pDate) {
        this.pID = pID;
        this.catID = catID;
        this.userID = userID;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pImg = pImg;
        this.pDate = pDate;
    }

    public Post(int catID, int userID, String pTitle, String pContent, String pCode, String pImg, LocalDateTime pDate) {
        this.catID = catID;
        this.userID = userID;
        this.pTitle = pTitle;
        this.pContent = pContent;
        this.pCode = pCode;
        this.pImg = pImg;
        this.pDate = pDate;
    }

    public int getpID() {
        return pID;
    }

    public void setpID(int pID) {
        this.pID = pID;
    }

    public int getCatID() {
        return catID;
    }

    public void setCatID(int catID) {
        this.catID = catID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent;
    }

    public String getpCode() {
        return pCode;
    }

    public void setpCode(String pCode) {
        this.pCode = pCode;
    }

    public String getpImg() {
        return pImg;
    }

    public void setpImg(String pImg) {
        this.pImg = pImg;
    }

    public LocalDateTime getpDate() {
        return pDate;
    }

    public void setpDate(LocalDateTime pDate) {
        this.pDate = pDate;
    }
}
