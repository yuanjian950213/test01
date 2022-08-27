package com.ityuan.services.Impl;

import com.ityuan.dao.MenuMapper;
import com.ityuan.mapper.UserMapper;
import com.ityuan.pojo.Menu;
import com.ityuan.pojo.User;
import com.ityuan.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private MenuMapper menuMapper;

    @Override
    public User login(String userName, String password){
        try {
            User user = userMapper.login(userName, password);
            return user;
        } catch (EmptyResultDataAccessException r) {
            return null;
        }
    }

    @Override
    public List<Menu> getMenu(int roleID) {
        List<Menu> menuList = null;
            menuList=menuMapper.getMenu(0, roleID);
            for (Menu menu : menuList) {
                List<Menu> sonList=menuMapper.getMenu(menu.getId(), roleID);
                menu.setSonList(sonList);
            }
        return menuList;
    }
}
