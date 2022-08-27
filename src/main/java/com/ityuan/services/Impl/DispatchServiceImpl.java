package com.ityuan.services.Impl;

import com.ityuan.mapper.DispatchMapper;
import com.ityuan.pojo.Config;
import com.ityuan.pojo.Dispatch;
import com.ityuan.services.DispatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("dispatchService")
public class DispatchServiceImpl implements DispatchService {

    @Autowired
    private DispatchMapper dispatchMapper;

    @Override
    public List<Dispatch> findAll() {
        List<Dispatch> dispatchList =  dispatchMapper.findallDispatch();
        return dispatchList;
    }

    @Override
    public List<Dispatch> findOne(String dispatchType , String dispatchStatus) {
        List<Dispatch> dispatchList = dispatchMapper.findOne(dispatchType,dispatchStatus);
        return dispatchList;
    }

    @Override
    public List<Dispatch> findAllDispatchType(String dispatchStatus) {
        List<Dispatch> dispatchType = dispatchMapper.findAllDispatchType(dispatchStatus);
        return dispatchType;
    }
//
    @Override
    public void add(Dispatch dispatch) {
        dispatchMapper.adddispatch(dispatch);
    }

//    @Override
//    public String findOneHoliday(String holidayType) {
//     String newHolidayType = holidayMapper.findOneHoliday(holidayType);
//        return newHolidayType;
//    }
//
    @Override
    public void del(String obj) {
        dispatchMapper.del(obj);
    }
//
    @Override
    public Dispatch findNewOne(String dispatchNo) {
        Dispatch dispatch = dispatchMapper.findNewOne(dispatchNo);
        return dispatch;
    }

    @Override
    public List<Config> findConfigdispatchtype() {
        List<Config> configList = dispatchMapper.findConfigdispatchtype();
        return configList;
    }

    @Override
    public List<Config> findConfigdispatchStatus() {
        List<Config> configList = dispatchMapper.findConfigdispatchStatus();
        return configList;
    }

    @Override
    public Config findConfigType(String dispatchType) {
        Config config = dispatchMapper.findConfigType(dispatchType);
        return config;
    }

    @Override
    public Config findConfigStatus(String dispatchStatus) {
            Config config = dispatchMapper.findConfigStatus(dispatchStatus);
            return config;
    }
//
//    @Override
//    public String findholidayValue(String holidayType) {
//      String newHolidayType =  holidayMapper.findholidayValue(holidayType);
//        return newHolidayType;
//    }
//
    @Override
    public void change(Dispatch dispatch) {
        dispatchMapper.change(dispatch);
    }
}
