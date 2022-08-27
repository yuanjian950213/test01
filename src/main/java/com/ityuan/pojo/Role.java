package com.ityuan.pojo;

public class Role {
    private int id;
    private String t_role_name;
    private String t_create_time;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getT_role_name() {
        return t_role_name;
    }

    public void setT_role_name(String t_role_name) {
        this.t_role_name = t_role_name;
    }

    public String getT_create_time() {
        return t_create_time;
    }

    public void setT_create_time(String t_create_time) {
        this.t_create_time = t_create_time;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", t_role_name='" + t_role_name + '\'' +
                ", t_create_time='" + t_create_time + '\'' +
                '}';
    }
}
