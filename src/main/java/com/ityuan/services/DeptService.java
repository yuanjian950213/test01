package com.ityuan.services;

import com.ityuan.pojo.Dept;
import com.ityuan.pojo.Employee;

import java.util.List;

public interface DeptService {

    List<Dept> findAll();

    void del(int obj);

    Dept findOne(String deptNo);

    Dept finddetailedOne(String deptNo);

    void insertNewDept(Dept dept);

    void changeDept(Dept dept);

    Employee selectOneEmployee(String deptName);
}
