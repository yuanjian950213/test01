package com.ityuan.dao;

import com.ityuan.pojo.Menu;

import java.util.List;

public interface MenuMapper {

    List<Menu> getMenu(int parentID, int roleId);

}
