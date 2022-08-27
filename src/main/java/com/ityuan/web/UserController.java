package com.ityuan.web;


import com.ityuan.pojo.Menu;
import com.ityuan.pojo.User;
import com.ityuan.services.UserService;
import com.ityuan.utils.CheckCodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

@RequestMapping("/user")
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    //验证码
    @RequestMapping("/code")
    public void code(HttpServletRequest request , HttpServletResponse response) throws IOException {
        // 生成验证码
        ServletOutputStream os = response.getOutputStream();
        String checkCode = CheckCodeUtil.outputVerifyImage(100, 35, os, 4);
        // 存入Session
        HttpSession session = request.getSession();
        session.setAttribute("checkCodeGen",checkCode);
    }
    //登录
    @RequestMapping("/login")
    @ResponseBody
    public String login(HttpSession session,@RequestBody User user1) throws ServletException, IOException {
        String userAccount = user1.getUserAccount();
        String userPwd = user1.getUserPwd();
        // 获取用户输入的验证码
        String code = user1.getCode();

        // 程序生成的验证码，从Session获取
        String checkCodeGen = (String) session.getAttribute("checkCodeGen");
        // 比对

        if(!checkCodeGen.equalsIgnoreCase(code)){

            session.setAttribute("code_msg","验证码错误");
            return "nosuccess";

        }

        //判断是否有此用户
        User user = userService.login(userAccount,userPwd);
        session.setAttribute("users",user);

        if (user == null){
            session.setAttribute("login_msg","用户名或密码错误");
            return "nosuccess";
        }
        else {
            List<Menu> menuList = userService.getMenu(user.getRoleID());
            session.setAttribute("menuList",menuList);
            return  "success";
        }
    }

    @RequestMapping(value = "/loginByUsername")
    public void loginByUsername(HttpServletResponse response,HttpServletRequest request) throws IOException, ServletException {
        BufferedReader br = request.getReader();
        String readLine = br.readLine();
        if (readLine == null){
            response.getWriter().print(false);
        }
        else {
            response.getWriter().print(true);
        }
    }

    @RequestMapping(value = "/loginByPassword")
    public void loginByPassword(HttpServletResponse response,HttpServletRequest request) throws IOException, ServletException {
        BufferedReader br = request.getReader();
        String readLine = br.readLine();
        if (readLine == null){
            response.getWriter().print(false);
        }
        else {
            response.getWriter().print(true);
        }
    }
}

