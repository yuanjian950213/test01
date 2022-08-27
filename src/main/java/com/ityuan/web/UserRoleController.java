package com.ityuan.web;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ityuan.pojo.*;
import com.ityuan.services.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RequestMapping("/userRole")
@Controller
public class UserRoleController  {


    @Autowired
    private UserRoleService userRoleService;

    @RequestMapping("/findAll")
    public ModelAndView findAll(PagesUtil pagesUtil) throws ServletException, IOException {
        Integer pageNo = pagesUtil.getCurrPageNo();
        ModelAndView modelAndView = new ModelAndView();
        PageHelper.startPage(pageNo, 2);

        List<User> userList = userRoleService.findAll();

        PageInfo<User> pageInfo = new PageInfo<>(userList);


        modelAndView.addObject("userList",userList);
        modelAndView.addObject("pageInfo",pageInfo);


        List<Config> userConfigList = userRoleService.findUserConfig();
        modelAndView.addObject("userConfigList",userConfigList);


        List<Role> userRoleList = userRoleService.findUserRole();
        modelAndView.addObject("userRoleList",userRoleList);

        modelAndView.setViewName("/pages/user/user.jsp");

        return modelAndView;
    }

    @RequestMapping("/findAllPage")
    @ResponseBody
    public String findAllPage(@RequestBody int pageNo,HttpSession session) throws ServletException, IOException {

        PageHelper.startPage(pageNo, 2);

        List<User> userList = userRoleService.findAll();

        PageInfo<User> pageInfo = new PageInfo<>(userList);


        session.setAttribute("userList",userList);
        session.setAttribute("pageInfo",pageInfo);

        List<Config> userConfigList = userRoleService.findUserConfig();
        session.setAttribute("userConfigList",userConfigList);


        List<Role> userRoleList = userRoleService.findUserRole();
        session.setAttribute("userRoleList",userRoleList);


        return "success";
    }

    @RequestMapping("/saveUi")
    public ModelAndView saveUi(){
        ModelAndView modelAndView = new ModelAndView();
        List<Config> userConfigList = userRoleService.findUserConfig();
        modelAndView.addObject("userConfigList",userConfigList);


        List<Role> userRoleList = userRoleService.findUserRole();
        modelAndView.addObject("userRoleList",userRoleList);

        modelAndView.setViewName("/pages/user/userAdd.jsp");
        return modelAndView;
    }
//
    @RequestMapping("/add")
    @ResponseBody
    public String add(@RequestBody User user) throws IOException {
        System.out.println(user);
        String empNo = user.getEmpNo();
        String empName = user.getEmpName();
        Employee employee = userRoleService.selectEmployee(empNo, empName);
        if (employee == null){
            return "nosuccess";
        }
        else {
            String role = user.getRole();
            Role roleConfig = userRoleService.findRoleId(role);

            String status = user.getStatus();
            Config statusConfig = userRoleService.findstatusIDId(status);


            int roleId = roleConfig.getId();
            user.setRoleID(roleId);

            String statusId = statusConfig.getConfigKey();
            int statusIds = Integer.parseInt(statusId);

            user.setStatusID(statusIds);

            Date date = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String creatTime = dateFormat.format(date);
            user.setCreateTime(creatTime);
            userRoleService.add(user);
            return  "success";
        }
    }
//
    @RequestMapping("/selectUser")
    @ResponseBody
    public String selectUser(@RequestBody User user,HttpSession session){


       List<User> userList = userRoleService.selectUser(user);
        session.setAttribute("userList",userList);

        List<Config> userConfigList = userRoleService.findUserConfig();
        session.setAttribute("userConfigList",userConfigList);


        List<Role> userRoleList = userRoleService.findUserRole();
        session.setAttribute("userRoleList",userRoleList);

        return "success";
    }
////
    @RequestMapping("/del/{userAccount}")
    public String del(@PathVariable("userAccount")String userAccount){
        userRoleService.del(userAccount);
        return "redirect:/userRole/findAll";
    }

    @RequestMapping("/findNewOne")
    @ResponseBody
    public String findNewOne(@RequestBody User users , HttpSession session){
        String userAccount = users.getUserAccount();
        User user = userRoleService.findNewOne(userAccount);

        List<Config> userConfigList = userRoleService.findUserConfig();
        session.setAttribute("userConfigList",userConfigList);


        List<Role> userRoleList = userRoleService.findUserRole();
        session.setAttribute("userRoleList",userRoleList);

        session.setAttribute("user",user);

        return "success";
    }
//
    @RequestMapping("/change")
    @ResponseBody
    public String change(@RequestBody User user) throws IOException {
        System.out.println(user);

        String empNo = user.getEmpNo();
        String empName = user.getEmpName();

        Employee employee = userRoleService.selectEmployee(empNo, empName);
        if (employee == null){
            return "nosuccess";
        }else {
            String role = user.getRole();
            Role roleConfig = userRoleService.findRoleId(role);

            String status = user.getStatus();
            Config statusConfig = userRoleService.findstatusIDId(status);


            int roleId = roleConfig.getId();
            user.setRoleID(roleId);

            String statusId = statusConfig.getConfigKey();
            int statusIds = Integer.parseInt(statusId);

            user.setStatusID(statusIds);

            userRoleService.changeUser(user);
            return  "success";
        }
    }

    @RequestMapping("/finddetailedOne")
    @ResponseBody
    public String finddetailedOne(@RequestBody User users , HttpSession session){
        String userAccount = users.getUserAccount();

        User user = userRoleService.findNewOne(userAccount);
        session.setAttribute("user",user);

        return "success";
    }

    @RequestMapping("/changePassword")
    @ResponseBody
    public String changePassword(@RequestBody PassWord passWord, HttpSession session) throws IOException {
        String userpwd = passWord.getUserpwd();
        String checkPwd = passWord.getCheckPwd();
        String newUserPwd = passWord.getNewUserPwd();

        User users = (User) session.getAttribute("users");

        String userAccount = users.getUserAccount();
        User user = userRoleService.checkUser(userAccount,userpwd);

        if (user == null){
            return "nouser";
        }
        else {
            if(checkPwd.equals(newUserPwd)){
                userRoleService.updatePwd(userAccount,checkPwd);
                session.invalidate();
                return "success";
            }
            else {
                System.out.println("git");
                System.out.println("git1");
                System.out.println("dev01 test1");
                return "nosuccess";
            }
        }
    }
}
