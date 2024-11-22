package model;

import java.time.*;

public class User {
    private int uID, role;
    private String username, email, password, gender, about, profile;
    private LocalDateTime regDate;

    public User() {
    }

    public User(int uID, int role, String username, String email, String password, String gender, String about, LocalDateTime regDate) {
        this.uID = uID;
        this.role = role;
        this.username = username;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.about = about;
        this.regDate = regDate;
    }

    public User(int role, String username, String email, String password, String gender, String about) {
        this.role = role;
        this.username = username;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.about = about;
    }

    public int getuID() {
        return uID;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public LocalDateTime getRegDate() {
        return regDate;
    }

    public void setRegDate(LocalDateTime regDate) {
        this.regDate = regDate;
    }
}
