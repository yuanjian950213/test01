package com.ityuan.services;

import com.ityuan.pojo.Config;
import com.ityuan.pojo.Dispatch;

import java.util.List;

public interface DispatchService {

    List<Dispatch> findAll();

    List<Dispatch> findOne(String dispatchType , String dispatchStatus);

    List<Dispatch> findAllDispatchType(String dispatchStatus);

    void add(Dispatch dispatch);

    void del(String obj);

    Dispatch findNewOne(String dispatchNo);

    void change(Dispatch dispatch);

    List<Config> findConfigdispatchtype();

    List<Config> findConfigdispatchStatus();

    Config findConfigType(String dispatchType);

    Config findConfigStatus(String dispatchStatus) throws NullPointerException;
}
