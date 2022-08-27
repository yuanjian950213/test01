package com.ityuan.web;


import com.alibaba.fastjson.JSON;
import com.ityuan.pojo.Dept;
import com.ityuan.pojo.Employee;
import com.ityuan.services.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RequestMapping("/dept")
@Controller
public class DeptController {

    @Autowired
    private DeptService deptService;

    @RequestMapping("/findAll")
    public void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      List<Dept> deptList  = deptService.findAll();
      request.setAttribute("deptList",deptList);
      request.getRequestDispatcher("/pages/dept/dept.jsp").forward(request,response);
    }

    @RequestMapping("/del/{deptNo}")
    public String del(@PathVariable("deptNo")int deptNo){
        deptService.del(deptNo);
        return "redirect:/dept/findAll";
    }

    @RequestMapping("/findOne")
    public void findOne(HttpServletRequest request, HttpServletResponse response ,HttpSession session) throws IOException {
        BufferedReader br = request.getReader();
        String readLine = br.readLine();
        Dept dept1 = JSON.parseObject(readLine, Dept.class);
        String deptNo = dept1.getDeptNo();
        System.out.println(deptNo);

        Dept dept = deptService.findOne(deptNo);
        session.setAttribute("dept",dept);

        response.getWriter().print("success");
    }

    @RequestMapping("/finddetailedOne")
    public void finddetailedOne(HttpServletRequest request, HttpServletResponse response ,HttpSession session) throws IOException {
        BufferedReader br = request.getReader();
        String readLine = br.readLine();
        Dept dept1 = JSON.parseObject(readLine, Dept.class);
        String deptNo = dept1.getDeptNo();

        Dept dept = deptService.finddetailedOne(deptNo);
        session.setAttribute("dept",dept);

        response.getWriter().print("success");

    }

    @RequestMapping("/insert")
    public void insert(HttpServletRequest request, HttpServletResponse response) throws IOException {
        BufferedReader br = request.getReader();
        String readLine = br.readLine();
        Dept dept = JSON.parseObject(readLine, Dept.class);

        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createTime = dateFormat.format(now);
        dept.setCreateTime(createTime);

        System.out.println(dept);
        deptService.insertNewDept(dept);
        response.getWriter().print("success");
    }

    @RequestMapping("/change")
    public String change(Dept dept){
        deptService.changeDept(dept);
        return  "redirect:/dept/findAll";
    }

    @RequestMapping(value = "/selectOneEmployee/{deptName}")
    public void selectOneEmployee(@PathVariable("deptName")String deptName,HttpServletResponse response) throws IOException {
      Employee employee = deptService.selectOneEmployee(deptName);
      if (employee == null){
          response.getWriter().print(false);
      }
      else {
          response.getWriter().print(true);
      }
    }
}
