package com.ityuan.mapper;

import com.ityuan.pojo.Config;
import com.ityuan.pojo.Dispatch;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
public interface DispatchMapper {

    List<Dispatch> findallDispatch();

    List<Dispatch> findOne(@Param("dispatchType") String dispatchType , @Param("dispatchStatus")String dispatchStatus);

    List<Dispatch> findAllDispatchType(String dispatchStatus);

    List<Config> findConfigdispatchtype();

    List<Config> findConfigdispatchStatus();

    void adddispatch(Dispatch dispatch);

    void del(String obj);

    Dispatch findNewOne(String dispatch);

    Config findConfigType(String dispatchType);

    Config findConfigStatus(String dispatchStatus);

    void change(Dispatch dispatch);

}
