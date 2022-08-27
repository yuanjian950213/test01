package com.ityuan.mapper;



import com.ityuan.pojo.Role;
import com.ityuan.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
public interface RoleMapper {

    List<Role> findAll();

    List<User> findUser(@Param("roleId") String roleId);

    void del(String roleId);

    void add(Role role);

    Role findRole(int roleId);

    void change(Role role);
}
