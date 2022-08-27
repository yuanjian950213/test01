package com.ityuan.services;

import com.ityuan.pojo.Role;
import com.ityuan.pojo.User;

import java.util.List;

public interface RoleService {

    List<Role> findAll();

    List<User> findUser(String roleId);

    void del(String roleId);

    void add(Role role);

    Role findRole(int roleId);

    void change(Role role);
}
