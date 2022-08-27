package com.ityuan.mapper;


import com.ityuan.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Component;

@Mapper
public interface UserMapper {
    //登录
    User login(@Param("userName") String userName, @Param("password") String password) throws EmptyResultDataAccessException;
//    //根据用户名查用户
//    User loginByUsername(@Param("userName") String userName)throws EmptyResultDataAccessException;
//    //根据用户密码查用户
//    User loginByPassword(@Param("password") String password)throws EmptyResultDataAccessException;


}
