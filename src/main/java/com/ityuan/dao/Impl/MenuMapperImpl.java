package com.ityuan.dao.Impl;

import com.ityuan.dao.MenuMapper;
import com.ityuan.pojo.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
public class MenuMapperImpl implements MenuMapper {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public List<Menu> getMenu(int parentID, int roleId) {
        String sql="select id,t_menu_name,t_href_url,t_parent_id from t_menu tm " +
                "where tm.id in (select t_menu_id from t_permissions where t_role_id = ?)" +
                " and t_parent_id=";

        List<Menu> menuList;
        if(parentID>0){
            sql+="?";
            menuList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Menu>(Menu.class), roleId, parentID);
        }else{
            sql+="0";
            menuList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Menu>(Menu.class), roleId);
        }

        return menuList;
    }
}
