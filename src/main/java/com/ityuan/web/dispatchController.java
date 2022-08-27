package com.ityuan.web;


import com.ityuan.pojo.Config;
import com.ityuan.pojo.Dispatch;
import com.ityuan.pojo.User;
import com.ityuan.services.DispatchService;
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

@RequestMapping("/dispatch")
@Controller
public class dispatchController {

    @Autowired
    private DispatchService dispatchService;

    @RequestMapping("/findAll")
    public void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Dispatch> dispatchList  = dispatchService.findAll();
        for (Dispatch dispatch : dispatchList) {
            String dispatchStatus = dispatch.getDispatchStatus();
            List<Dispatch> dispatchListType = dispatchService.findAllDispatchType(dispatchStatus);
            for (Dispatch dispatch1 : dispatchListType) {
                dispatch.setDispatchStatus(dispatch1.getDispatchStatus());
            }
        }
        request.setAttribute("dispatchList",dispatchList);
        List<Config> configdispatchtypeList = dispatchService.findConfigdispatchtype();
        request.setAttribute("configdispatchtypeList",configdispatchtypeList);
        List<Config> configdispatchStatusList = dispatchService.findConfigdispatchStatus();
        request.setAttribute("configdispatchStatusList",configdispatchStatusList);
        request.getRequestDispatcher("/pages/dispatch/dispatch.jsp").forward(request,response);
    }

    @RequestMapping("/saveUi")
    public ModelAndView saveUi(){
        ModelAndView modelAndView = new ModelAndView();
        List<Config> configdispatchtypeList = dispatchService.findConfigdispatchtype();
        modelAndView.addObject("configdispatchtypeList",configdispatchtypeList);
        modelAndView.setViewName("/pages/dispatch/dispatchAdd.jsp");
        return modelAndView;
    }
//
    @RequestMapping("/add")
    @ResponseBody
    public String add(@RequestBody Dispatch dispatch,HttpSession session){
        Random random = new Random();
        int nextInt = random.nextInt(999);
        String dispatchNo = String.valueOf(nextInt);
        dispatch.setDispatchNo(dispatchNo);

        User users = (User) session.getAttribute("users");
        String userAccount = users.getUserAccount();
        dispatch.setDispatchUser(userAccount);

        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String creatTime = dateFormat.format(date);
        dispatch.setDispatchStime(creatTime);
        dispatch.setDispatchCtime(creatTime);

        String dispatchType = dispatch.getDispatchType();
        Config configdispatchtype = dispatchService.findConfigType(dispatchType);
        String configValue = configdispatchtype.getConfigValue();
        dispatch.setDispatchType(configValue);


        String dispatchStatus = dispatch.getDispatchStatus();
        Config configdispatchStatus = dispatchService.findConfigStatus(dispatchStatus);
        String configValue1 = configdispatchStatus.getConfigValue();
        dispatch.setDispatchStatus(configValue1);
        dispatchService.add(dispatch);
        return  "success";
    }
//
    @RequestMapping("/findOne")
    @ResponseBody
    public String findOne(@RequestBody Dispatch dispatchs,HttpSession session){
        System.out.println(dispatchs);
        String dispatchStatus = dispatchs.getDispatchStatus();
        String dispatchType = dispatchs.getDispatchType();

        if ("请选择状态".equals(dispatchStatus)){
            List<Dispatch> dispatchList = dispatchService.findOne(dispatchType,dispatchStatus);
            for (Dispatch dispatch : dispatchList) {
                String dispatchStatus1 = dispatch.getDispatchStatus();
                List<Dispatch> dispatchListType = dispatchService.findAllDispatchType(dispatchStatus1);
                for (Dispatch dispatch1 : dispatchListType) {
                    dispatch.setDispatchStatus(dispatch1.getDispatchStatus());
                }
            }
            session.setAttribute("dispatchList",dispatchList);

            List<Config> configdispatchtypeList = dispatchService.findConfigdispatchtype();
            session.setAttribute("configdispatchtypeList",configdispatchtypeList);

            List<Config> configdispatchStatusList = dispatchService.findConfigdispatchStatus();
            session.setAttribute("configdispatchStatusList",configdispatchStatusList);

            return "success";
        }
        else {
            Config configStatus = dispatchService.findConfigStatus(dispatchStatus);
            dispatchStatus = configStatus.getConfigValue();

            List<Dispatch> dispatchList = dispatchService.findOne(dispatchType,dispatchStatus);
            for (Dispatch dispatch : dispatchList) {
                String dispatchStatus1 = dispatch.getDispatchStatus();
                List<Dispatch> dispatchListType = dispatchService.findAllDispatchType(dispatchStatus1);
                for (Dispatch dispatch1 : dispatchListType) {
                    dispatch.setDispatchStatus(dispatch1.getDispatchStatus());
                }
            }
            session.setAttribute("dispatchList",dispatchList);

            List<Config> configdispatchtypeList = dispatchService.findConfigdispatchtype();
            session.setAttribute("configdispatchtypeList",configdispatchtypeList);

            List<Config> configdispatchStatusList = dispatchService.findConfigdispatchStatus();
            session.setAttribute("configdispatchStatusList",configdispatchStatusList);


            return "success";
        }
    }
//
    @RequestMapping("/del/{obj}")
    public String del(@PathVariable("obj")String obj){
        dispatchService.del(obj);
        return "redirect:/dispatch/findAll";
    }
//
    @RequestMapping("/findNewOne")
    @ResponseBody
    public String findNewOne(@RequestBody Dispatch dispatchs,HttpSession session){
        String dispatchNo = dispatchs.getDispatchNo();
        Dispatch dispatch = dispatchService.findNewOne(dispatchNo);

        String dispatchStatus = dispatch.getDispatchStatus();
        List<Dispatch> dispatchListType = dispatchService.findAllDispatchType(dispatchStatus);
        for (Dispatch dispatch1 : dispatchListType) {
            dispatch.setDispatchStatus(dispatch1.getDispatchStatus());
        }
        session.setAttribute("dispatch",dispatch);

        List<Config> configdispatchtypeList = dispatchService.findConfigdispatchtype();
        session.setAttribute("configdispatchtypeList",configdispatchtypeList);

        List<Config> configdispatchStatusList = dispatchService.findConfigdispatchStatus();
        session.setAttribute("configdispatchStatusList",configdispatchStatusList);

        return "success";
    }

    @RequestMapping("/change")
    @ResponseBody
    public String change(@RequestBody Dispatch dispatch){
        String dispatchType = dispatch.getDispatchType();
        Config configdispatchtype = dispatchService.findConfigType(dispatchType);
        String configValue = configdispatchtype.getConfigValue();
        dispatch.setDispatchType(configValue);


        String dispatchStatus = dispatch.getDispatchStatus();
        Config configdispatchStatus = dispatchService.findConfigStatus(dispatchStatus);
        String configValue1 = configdispatchStatus.getConfigValue();
        dispatch.setDispatchStatus(configValue1);

        dispatchService.change(dispatch);
        return  "success";
    }

    @RequestMapping("/finddetailedOne")
    @ResponseBody
    public String finddetailedOne(@RequestBody Dispatch dispatchs, HttpSession session){
        String dispatchNo = dispatchs.getDispatchNo();
        Dispatch dispatch = dispatchService.findNewOne(dispatchNo);

        String dispatchStatus = dispatch.getDispatchStatus();
        List<Dispatch> dispatchListType = dispatchService.findAllDispatchType(dispatchStatus);

        for (Dispatch dispatch1 : dispatchListType) {
            dispatch.setDispatchStatus(dispatch1.getDispatchStatus());
        }

        session.setAttribute("dispatch",dispatch);
        return "success";
    }
}
