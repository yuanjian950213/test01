package com.ityuan.services.Impl;

import com.ityuan.mapper.UserRoleMapper;
import com.ityuan.pojo.Config;
import com.ityuan.pojo.Employee;
import com.ityuan.pojo.Role;
import com.ityuan.pojo.User;
import com.ityuan.services.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userRoleService")
public class UserRoleServiceImpl implements UserRoleService {

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Override
    public List<User> findAll() {
        List<User> userList = userRoleMapper.findAll();
        return userList;
    }

    @Override
    public void del(String userAccount) {
        userRoleMapper.del(userAccount);
    }

    @Override
    public User findNewOne(String userAccount) {
        User user = userRoleMapper.findNewOne(userAccount);
        return user;
    }

    @Override
    public List<Config> findUserConfig() {
        List<Config> configList = userRoleMapper.findUserConfig();
        return configList;
    }

    @Override
    public List<Role> findUserRole() {
        List<Role> roleList  =  userRoleMapper.findUserRole();
        return roleList;
    }

    @Override
    public List<User> selectUser(User user) {
        List<User> userList = userRoleMapper.selectUser(user);
        return userList;
    }

    @Override
    public Employee selectEmployee(String empNo, String empName) {
        Employee employee = userRoleMapper.selectEmployee(empNo,empName);
        return employee;
    }

    @Override
    public Role findRoleId(String role) {
        Role roleConfig = userRoleMapper.findRoleId(role);
        return roleConfig;
    }

    @Override
    public Config findstatusIDId(String status) {
        Config statusConfig = userRoleMapper.findstatusIDId(status);
        return statusConfig;
    }

    @Override
    public void add(User user) {
        userRoleMapper.add(user);
    }

    @Override
    public User checkUser(String userAccount, String userpwd) {
        User user = userRoleMapper.checkUser(userAccount,userpwd);
        return user;
    }

    @Override
    public void updatePwd(String userAccount, String checkPwd) {
        userRoleMapper.updatePwd(userAccount,checkPwd);
    }

    @Override
    public void changeUser(User user) {
        userRoleMapper.changeUser(user);
    }
}
