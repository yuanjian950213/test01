package com.ityuan.mapper;

import com.ityuan.pojo.Config;
import com.ityuan.pojo.Employee;
import com.ityuan.pojo.Role;
import com.ityuan.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
public interface UserRoleMapper {

    List<User> findAll();

    void del(String userAccount);

    User findNewOne(String userAccount);

    List<Config> findUserConfig();

    List<Role> findUserRole();

    List<User> selectUser(User user);

    Employee selectEmployee(@Param("empNo") String empNo, @Param("empName")String empName);

    Role findRoleId(@Param("role")String role);

    Config findstatusIDId(@Param("status")String status);

    void add(User user);

    User checkUser(@Param("userAccount")String userAccount, @Param("userpwd")String userpwd);

    void updatePwd(@Param("userAccount")String userAccount,@Param("checkPwd")String checkPwd);

    void changeUser(User user);
}
