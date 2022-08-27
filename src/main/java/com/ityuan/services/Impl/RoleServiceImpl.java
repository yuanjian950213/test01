package com.ityuan.services.Impl;

import com.ityuan.mapper.RoleMapper;
import com.ityuan.pojo.Role;
import com.ityuan.pojo.User;
import com.ityuan.services.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("roleService")
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<Role> findAll() {
        List<Role> roleList = roleMapper.findAll();
        return roleList;
    }

    @Override
    public List<User> findUser(String roleId) {
        List<User> user = roleMapper.findUser(roleId);
        return user;
    }

    @Override
    public void del(String roleId) {
        roleMapper.del(roleId);
    }

    @Override
    public void add(Role role) {
        roleMapper.add(role);
    }

    @Override
    public Role findRole(int roleId) {
        Role role = roleMapper.findRole(roleId);
        return role;
    }

    @Override
    public void change(Role role) {
        roleMapper.change(role);
    }
}
