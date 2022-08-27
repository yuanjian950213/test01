package com.ityuan.services;

import com.ityuan.pojo.Config;
import com.ityuan.pojo.Holiday;

import java.util.List;

public interface HolidayService {

    List<Holiday> findAll();

    List<Holiday> findOne(String holidayUser , String holidayType , String holidayStatus);

    List<Config> findAllHolidayType();

    List<Config> findAllHolidayStatus();

    void add(Holiday holiday);

    String findOneHoliday(String holidayType);

    void del(String obj);

    Holiday findNewOne(String holidayNo);

    String findholidayValue(String holidayType);

    void change(Holiday holiday);


}
