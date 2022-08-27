package com.ityuan.services;

import com.ityuan.pojo.Menu;
import com.ityuan.pojo.User;

import java.io.IOException;
import java.util.List;

public interface UserService {

    User login(String username, String password) throws IOException;

//    User loginByUsername(String username) throws  IOException;
//
//    User loginByPassword(String password) throws  IOException;


    List<Menu> getMenu(int roleID);
}
