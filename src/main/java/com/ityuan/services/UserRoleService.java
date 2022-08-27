package com.ityuan.services;

import com.ityuan.pojo.Config;
import com.ityuan.pojo.Employee;
import com.ityuan.pojo.Role;
import com.ityuan.pojo.User;

import java.util.List;

public interface UserRoleService {

    List<User> findAll();

    void del(String userAccount);

    User findNewOne(String userAccount);

    List<Config> findUserConfig();

    List<Role> findUserRole();

    List<User> selectUser(User user);

    Employee selectEmployee(String empNo, String empName);

    Role findRoleId(String role);

    Config findstatusIDId(String status);

    void add(User user);

    User checkUser(String userAccount,String userpwd);

    void updatePwd(String userAccount,String checkPwd);

    void changeUser(User user);

}
