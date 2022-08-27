package com.ityuan.services.Impl;

import com.ityuan.mapper.EmployeeMapper;
import com.ityuan.pojo.Employee;
import com.ityuan.services.EmpLoyeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service("empLoyeeService")
public class EmpLoyeeServiceImpl implements EmpLoyeeService {

    @Autowired
    private EmployeeMapper employeeMapper;

    @Override
    public List<Employee> findAll() {
        List<Employee> employeeList = employeeMapper.findAllEmployee();
        return employeeList;
    }

    @Override
    public void addNewempLoyee(Employee employee) {
        Date now = new Date();
        SimpleDateFormat dateFormatormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createTime = dateFormatormat.format(now);
        employee.setCreateTime(createTime);
        employeeMapper.addNewempLoyee(employee);
    }

    @Override
    public List<Employee> findOne(String empName , String empDept) {
        List<Employee> employeeList = employeeMapper.findOneEmployee(empName,empDept);
        return employeeList;
    }

    @Override
    public void del(int obj) {
        employeeMapper.delemployee(obj);
    }

    @Override
    public Employee findNewOne(String empNo) {
     Employee employee = employeeMapper.findNewOne(empNo);
        return employee;
    }
}
