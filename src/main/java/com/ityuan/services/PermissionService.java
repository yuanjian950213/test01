package com.ityuan.services;

import com.ityuan.pojo.Menu;
import com.ityuan.pojo.Permissions;
import com.ityuan.pojo.Role;

import java.util.List;

public interface PermissionService {

    List<Permissions> findAll();

    List<Permissions> findOne(String role,String menu);

    List<Menu> findMenu();

    Role findRoleId(String role);

    Menu findMenuId(String menu);

    Permissions findPermission(int role1Id,int menu1Id);

    Permissions findNewOne(int permissionId);

//    List<User> findUser(String roleId);
//
    void del(int permissionId);
//
    void add(Permissions permissions);

    void changePermission(Permissions permissions);
//
//    Role findRole(String roleId);
//
//    void change(Role role);
}
