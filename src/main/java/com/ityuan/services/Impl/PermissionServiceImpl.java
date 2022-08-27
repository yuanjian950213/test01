package com.ityuan.services.Impl;

import com.ityuan.mapper.PermissionMapper;
import com.ityuan.pojo.Menu;
import com.ityuan.pojo.Permissions;
import com.ityuan.pojo.Role;
import com.ityuan.services.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("permissionService")
public class PermissionServiceImpl implements PermissionService {

    @Autowired
    private PermissionMapper permissionMapper;

    @Override
    public List<Permissions> findAll() {
        List<Permissions> permissionsList = permissionMapper.findAll();
        return permissionsList;
    }

    @Override
    public List<Permissions> findOne(String role, String menu) {
        List<Permissions> permissionList = permissionMapper.findOne(role,menu);
        return permissionList;
    }

    @Override
    public List<Menu> findMenu() {
        List<Menu> menusList = permissionMapper.findMenu();
        return menusList;
    }

    @Override
    public Role findRoleId(String role) {
        Role role1 = permissionMapper.findRoleId(role);
        return role1;
    }

    @Override
    public Menu findMenuId(String menu) {
        Menu menu1 = permissionMapper.findMenuId(menu);
        return menu1;
    }

    @Override
    public Permissions findPermission(int role1Id, int menu1Id) {
        Permissions permissions1 = permissionMapper.findPermission(role1Id,menu1Id);
        return permissions1;
    }

    @Override
    public Permissions findNewOne(int permissionId) {
        Permissions permissions = permissionMapper.findNewOne(permissionId);
        return permissions;
    }

    @Override
    public void add(Permissions permissions) {
        permissionMapper.add(permissions);
    }

    @Override
    public void changePermission(Permissions permissions) {
        permissionMapper.changePermission(permissions);
    }

    //    @Override
//    public List<User> findUser(String roleId) {
//        List<User> user = roleMapper.findUser(roleId);
//        return user;
//    }
//
    @Override
    public void del(int permissionId) {
        permissionMapper.del(permissionId);
    }
//

//
//    @Override
//    public Role findRole(String roleId) {
//        Role role = roleMapper.findRole(roleId);
//        return role;
//    }
//
//    @Override
//    public void change(Role role) {
//        roleMapper.change(role);
//    }
}
