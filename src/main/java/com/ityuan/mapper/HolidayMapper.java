package com.ityuan.mapper;

import com.ityuan.pojo.Config;
import com.ityuan.pojo.Holiday;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
public interface HolidayMapper {

    List<Holiday> findallholiday();

    List<Holiday> findOne(@Param("holidayUser") String holidayUser , @Param("holidayType")String holidayType , @Param("holidayStatus")String holidayStatus);

    List<Config> findAllHolidayType();

    void addHoliday(Holiday holiday);

    String findOneHoliday(String holidayType);

    void del(String obj);

    Holiday findNewOne(String holidayNo);

    String findholidayValue(String holidayType);

    void change(Holiday holiday);

    List<Config> findAllHolidayStatus();

}
