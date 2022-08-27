package com.ityuan.web;


import com.ityuan.pojo.Role;
import com.ityuan.pojo.User;
import com.ityuan.services.RoleService;
import com.ityuan.services.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RequestMapping("/role")
@Controller
public class RoleController {
    @Autowired
    private RoleService roleService;

    @Autowired
    private UserRoleService userRoleService;

    @RequestMapping("/findAll")
    public ModelAndView findAll() throws ServletException, IOException {
        ModelAndView modelAndView = new ModelAndView();

        List<Role> roleList = roleService.findAll();
        modelAndView.addObject("roleList",roleList);

        modelAndView.setViewName("/pages/role/role.jsp");
        return modelAndView;
    }

    @RequestMapping("/findUser/{roleId}")
    public void findUser(HttpServletResponse response,@PathVariable("roleId")String roleId) throws IOException {
        List<User> user = roleService.findUser(roleId);
        System.out.println(user);
        if (user.size() == 0){
            response.getWriter().print(false);
        }
        else {
            response.getWriter().print(true);
        }
    }

    @RequestMapping("/del/{roleId}")
    public String del(@PathVariable("roleId")String roleId) throws IOException {
        roleService.del(roleId);
        return "redirect:/role/findAll";
    }

    @RequestMapping("/add")
    @ResponseBody
    public String add(@RequestBody Role role){
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String creatTime = dateFormat.format(date);
        role.setT_create_time(creatTime);

        roleService.add(role);
        return "success";
    }

    @RequestMapping("/saveUi")
    @ResponseBody
    public String saveUi(@RequestBody Role roles, HttpSession session){
        int rolesId = roles.getId();

        Role role = roleService.findRole(rolesId);
        session.setAttribute("role",role);

        List<Role> userRole = userRoleService.findUserRole();
        session.setAttribute("userRole",userRole);


        return "success";
    }

    @RequestMapping("/change")
    @ResponseBody
    public String change(@RequestBody Role role){
        roleService.change(role);
        return  "success";
    }
}
