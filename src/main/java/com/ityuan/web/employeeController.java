package com.ityuan.web;


import com.ityuan.pojo.Dept;
import com.ityuan.pojo.Employee;
import com.ityuan.services.DeptService;
import com.ityuan.services.EmpLoyeeService;
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
import java.util.List;

@RequestMapping("/employee")
@Controller
public class employeeController {

    @Autowired
    private DeptService deptService;

    @Autowired
    private EmpLoyeeService empLoyeeService;

    @RequestMapping("/findAll")
    public void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Employee> employeeList  = empLoyeeService.findAll();
        List<Dept> deptList = deptService.findAll();
        request.setAttribute("employeeList",employeeList);
        request.setAttribute("deptList",deptList);
        request.getRequestDispatcher("/pages/employee/employee.jsp").forward(request,response);
    }

    @RequestMapping("/saveUi")
    public ModelAndView saveUi(){
        ModelAndView modelAndView = new ModelAndView();
        List<Dept> deptList = deptService.findAll();
        modelAndView.addObject("deptList",deptList);
        modelAndView.setViewName("/pages/employee/employeeAdd.jsp");
        return modelAndView;
    }

    @RequestMapping("/add")
    @ResponseBody
    public String add(@RequestBody Employee employee){
        System.out.println(employee);

        empLoyeeService.addNewempLoyee(employee);

        return  "success";
    }

    @RequestMapping("/findOne")
    @ResponseBody
    public String findOne(@RequestBody Employee employee , HttpSession session){

        String empName = employee.getEmpName();
        String empDept = employee.getEmpDept();

        List<Employee> employeeList = empLoyeeService.findOne(empName,empDept);
        session.setAttribute("employeeList",employeeList);

        List<Dept> deptList = deptService.findAll();
        session.setAttribute("deptList",deptList);

        return "success";
    }

    @RequestMapping("/del/{obj}")
    public String del(@PathVariable("obj")int obj){
        empLoyeeService.del(obj);
        return "redirect:/employee/findAll";
    }

    @RequestMapping("/findNewOne")
    @ResponseBody
    public String findNewOne(@RequestBody Employee employee , HttpSession session) throws IOException {
        String empNo = employee.getEmpNo();
        Employee employee1 = empLoyeeService.findNewOne(empNo);
        System.out.println(employee);
        session.setAttribute("emp",employee1);

        return "success";
    }

    @RequestMapping("/finddetailedOne")
    @ResponseBody
    public String finddetailedOne(@RequestBody Employee employee , HttpSession session) throws IOException {
        String empNo = employee.getEmpNo();
        Employee employee1 = empLoyeeService.findNewOne(empNo);
        System.out.println(employee);
        session.setAttribute("emp",employee1);

        return "success";
    }
}
