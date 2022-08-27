package com.ityuan.web;


import com.ityuan.pojo.Config;
import com.ityuan.pojo.Holiday;
import com.ityuan.pojo.User;
import com.ityuan.services.HolidayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

@RequestMapping("/holiday")
@Controller
public class holidayController {

    @Autowired
    private HolidayService holidayService;

    @RequestMapping("/findAll")
    public void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Holiday> holidayList  = holidayService.findAll();
        List<Config> allHolidayType = holidayService.findAllHolidayType();
        List<Config> allHolidayStatus = holidayService.findAllHolidayStatus();
        request.setAttribute("holidayList",holidayList);
        request.setAttribute("allHolidayType",allHolidayType);
        request.setAttribute("allHolidayStatus",allHolidayStatus);
        request.getRequestDispatcher("/pages/holiday/holiday.jsp").forward(request,response);
    }

    @RequestMapping("/saveUi")
    public ModelAndView saveUi(){
        ModelAndView modelAndView = new ModelAndView();
        List<Config> holidayTypeList = holidayService.findAllHolidayType();
        modelAndView.addObject("holidayTypeList",holidayTypeList);
        modelAndView.setViewName("/pages/holiday/holidayAdd.jsp");
        return modelAndView;
    }

    @RequestMapping("/add")
    @ResponseBody
    public String add(@RequestBody Holiday holiday,HttpSession session){
        System.out.println(holiday);
        User users = (User) session.getAttribute("users");
        String userAccount = users.getUserAccount();
        holiday.setHolidayUser(userAccount);

        Random random = new Random();
        int nextInt = random.nextInt(999999);
        String holidayNo = String.valueOf(nextInt);
        holiday.setHolidayNo(holidayNo);

        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String creatTime = dateFormat.format(date);
        holiday.setCreateTime(creatTime);

        String holidayType = holiday.getHolidayType();
        String newHolidayType = holidayService.findOneHoliday(holidayType);
        holiday.setHolidayType(newHolidayType);

        holidayService.add(holiday);
        return  "success";
    }

    @RequestMapping("/select")
    @ResponseBody
    public String select(@RequestBody Holiday holiday,HttpSession session){
        System.out.println(holiday);
        String holidayUser = holiday.getHolidayUser();
        String holidayType = holiday.getHolidayType();
        String holidayStatus = holiday.getHolidayStatus();

        List<Holiday> holidayList = holidayService.findOne(holidayUser,holidayType,holidayStatus);
        session.setAttribute("holidayList",holidayList);

        List<Config> allHolidayType = holidayService.findAllHolidayType();
        session.setAttribute("allHolidayType",allHolidayType);

        List<Config> allHolidayStatus = holidayService.findAllHolidayStatus();
        session.setAttribute("allHolidayStatus",allHolidayStatus);

        return  "success";
    }

    @RequestMapping("/del/{obj}")
    public String del(@PathVariable("obj")String obj){
        holidayService.del(obj);
        return "redirect:/holiday/findAll";
    }

    @RequestMapping("/findNewOne")
    @ResponseBody
    public String findNewOne(@RequestBody Holiday holiday,HttpSession session){
        String holidayNo = holiday.getHolidayNo();
        Holiday holiday1 = holidayService.findNewOne(holidayNo);
        List<Config> holidayTypeList = holidayService.findAllHolidayType();
        session.setAttribute("holidayTypeList",holidayTypeList);
        session.setAttribute("holiday",holiday1);
        return "success";
    }

    @RequestMapping("/change")
    @ResponseBody
    public String change(@RequestBody Holiday holiday){
        String holidayType = holiday.getHolidayType();
        String newHolidayType = holidayService.findholidayValue(holidayType);
        holiday.setHolidayType(newHolidayType);
        holidayService.change(holiday);
        return  "success";
    }

    @RequestMapping("/finddetailedOne")
    @ResponseBody
    public String finddetailedOne(@RequestBody Holiday holiday,HttpSession session){
        String holidayNo = holiday.getHolidayNo();
        Holiday holiday1 = holidayService.findNewOne(holidayNo);
        session.setAttribute("holiday",holiday1);
        return "success";
    }
}
