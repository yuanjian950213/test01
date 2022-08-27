package com.ityuan.web;


import com.ityuan.pojo.Menu;
import com.ityuan.pojo.Permissions;
import com.ityuan.pojo.Role;
import com.ityuan.services.PermissionService;
import com.ityuan.services.RoleService;
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

@RequestMapping("/permission")
@Controller
public class permissionsController {
    @Autowired
    private PermissionService permissionService;

    @Autowired
    private RoleService roleService;




    @RequestMapping("/findAll")
    public ModelAndView findAll() throws ServletException, IOException {
        ModelAndView modelAndView = new ModelAndView();

        List<Permissions> permissionList = permissionService.findAll();
        modelAndView.addObject("permissionList",permissionList);

        List<Role> roleList = roleService.findAll();
        modelAndView.addObject("roleList",roleList);

        List<Menu> menusList = permissionService.findMenu();
        modelAndView.addObject("menusList",menusList);


        modelAndView.setViewName("/pages/permission/permission.jsp");
        return modelAndView;
    }

    @RequestMapping("/findOne")
    @ResponseBody
    public String findOne(@RequestBody Permissions permissions,HttpSession session){
        String role = permissions.getRole();
        String menu = permissions.getMenu();

        List<Permissions> permissionList = permissionService.findOne(role,menu);
        session.setAttribute("permissionList",permissionList);


        List<Role> roleList = roleService.findAll();
        session.setAttribute("roleList",roleList);

        List<Menu> menusList = permissionService.findMenu();
        session.setAttribute("menusList",menusList);

        return "success";
    }

    @RequestMapping("/findNewOne")
    @ResponseBody
    public String findNewOne(@RequestBody Permissions permissionss, HttpSession session) throws IOException {
        int permissionssId = permissionss.getId();

        Permissions permissions = permissionService.findNewOne(permissionssId);
        session.setAttribute("permissions",permissions);

        List<Role> roleList = roleService.findAll();
        session.setAttribute("roleList",roleList);

        List<Menu> menusList = permissionService.findMenu();
        session.setAttribute("menusList",menusList);

        return "success";
    }

    @RequestMapping("/del/{permissionId}")
    public String del(@PathVariable("permissionId")int permissionId) throws IOException {
        permissionService.del(permissionId);
        return "redirect:/permission/findAll";
    }
//
    @RequestMapping("/add")
    @ResponseBody
    public String add(@RequestBody Permissions permissions){
        System.out.println(permissions);
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String creatTime = dateFormat.format(date);
        permissions.setCreateTime(creatTime);

        String role = permissions.getRole();
        Role role1 = permissionService.findRoleId(role);
        int role1Id = role1.getId();
        permissions.setRoleID(role1Id);


        String menu = permissions.getMenu();
        Menu menu1 = permissionService.findMenuId(menu);
        int menu1Id = menu1.getId();
        permissions.setMenuID(menu1Id);

        Permissions permissions1 = permissionService.findPermission(role1Id,menu1Id);
        if (permissions1 == null){
            permissionService.add(permissions);
        }
        return "success";
    }
//
    @RequestMapping("/saveUi")
    public ModelAndView saveUi(){
        ModelAndView modelAndView = new ModelAndView();

        List<Role> roleList = roleService.findAll();
        modelAndView.addObject("roleList",roleList);

        List<Menu> menusList = permissionService.findMenu();
        modelAndView.addObject("menusList",menusList);

        modelAndView.setViewName("/pages/permission/permissionAdd.jsp");
        return modelAndView;
    }

    @RequestMapping("/change")
    @ResponseBody
    public String change(@RequestBody Permissions permissions){
//        permissionService.changePermission(permissions);
        return  "success";
    }
}
