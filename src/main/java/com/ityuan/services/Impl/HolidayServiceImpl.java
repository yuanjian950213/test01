package com.ityuan.services.Impl;

import com.ityuan.mapper.HolidayMapper;
import com.ityuan.pojo.Config;
import com.ityuan.pojo.Holiday;
import com.ityuan.services.HolidayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("holidayService")
public class HolidayServiceImpl implements HolidayService {

    @Autowired
    private HolidayMapper holidayMapper;

    @Override
    public List<Holiday> findAll() {
        List<Holiday> holidayList =  holidayMapper.findallholiday();
        return holidayList;
    }

    @Override
    public List<Holiday> findOne(String holidayUser, String holidayType, String holidayStatus) {
        List<Holiday> holidayList =  holidayMapper.findOne(holidayUser,holidayType,holidayStatus);
        return holidayList;
    }

    @Override
    public List<Config> findAllHolidayType() {
        List<Config> configList = holidayMapper.findAllHolidayType();
        return configList;
    }

    @Override
    public List<Config> findAllHolidayStatus() {
        List<Config> configStatusList = holidayMapper.findAllHolidayStatus();
        return configStatusList;
    }

    @Override
    public void add(Holiday holiday) {
        holidayMapper.addHoliday(holiday);
    }

    @Override
    public String findOneHoliday(String holidayType) {
     String newHolidayType = holidayMapper.findOneHoliday(holidayType);
        return newHolidayType;
    }

    @Override
    public void del(String obj) {
        holidayMapper.del(obj);
    }

    @Override
    public Holiday findNewOne(String holidayNo) {
        Holiday holiday = holidayMapper.findNewOne(holidayNo);
        return holiday;
    }

    @Override
    public String findholidayValue(String holidayType) {
      String newHolidayType =  holidayMapper.findholidayValue(holidayType);
        return newHolidayType;
    }

    @Override
    public void change(Holiday holiday) {
        holidayMapper.change(holiday);
    }
}
