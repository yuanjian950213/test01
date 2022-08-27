package com.ityuan.pojo;

public class PassWord {
    private String userpwd;
    private String newUserPwd;
    private String checkPwd;

    public String getUserpwd() {
        return userpwd;
    }

    public void setUserpwd(String userpwd) {
        this.userpwd = userpwd;
    }

    public String getNewUserPwd() {
        return newUserPwd;
    }

    public void setNewUserPwd(String newUserPwd) {
        this.newUserPwd = newUserPwd;
    }

    public String getCheckPwd() {
        return checkPwd;
    }

    public void setCheckPwd(String checkPwd) {
        this.checkPwd = checkPwd;
    }

    @Override
    public String toString() {
        return "PassWord{" +
                "userpwd='" + userpwd + '\'' +
                ", newUserPwd='" + newUserPwd + '\'' +
                ", checkPwd='" + checkPwd + '\'' +
                '}';
    }
}
