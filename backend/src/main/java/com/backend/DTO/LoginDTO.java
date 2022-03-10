package com.backend.DTO;

public class LoginDTO {
    private String email;
    private String passwd;
    private boolean cookie;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPasswd() {
        return passwd;
    }

    public void setPasswd(String passwd) {
        this.passwd = passwd;
    }

    public boolean isCookie() {
        return cookie;
    }

    public void setCookie(boolean cookie) {
        this.cookie = cookie;
    }
    @Override public String toString() {
        return "LoginDTO{" +
                "email='" + email + '\'' +
                ", " + "passwd='" + passwd + '\'' +
                "," + " cookie=" + cookie +
                '}'; }

}
