package com.ityuan.services;

import com.ityuan.pojo.Employee;

import java.util.List;

public interface EmpLoyeeService {

    List<Employee> findAll();

    void addNewempLoyee(Employee employee);

    List<Employee> findOne(String empName,String empDept);

    void del(int obj);

    Employee findNewOne(String empNo);
}
