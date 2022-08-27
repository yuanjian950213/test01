package com.ityuan.mapper;


import com.ityuan.pojo.Menu;
import com.ityuan.pojo.Permissions;
import com.ityuan.pojo.Role;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
public interface PermissionMapper {

    List<Permissions> findAll();

    List<Menu> findMenu();

    Role findRoleId(String role);

    Menu findMenuId(String menu);

    Permissions findPermission(@Param("role1Id")int role1Id,@Param("menu1Id")int menu1Id);

//    List<User> findUser(@Param("roleId") String roleId);
//
    void del(@Param("permissionId")int permissionId);
//
    void add(Permissions permissions);

    List<Permissions> findOne(@Param("role")String role, @Param("menu")String menu);

    Permissions findNewOne(@Param("permissionId")int permissionId);

    void changePermission(Permissions permissions);
//
//    Role findRole(String roleId);
//
//    void change(Role role);
}
