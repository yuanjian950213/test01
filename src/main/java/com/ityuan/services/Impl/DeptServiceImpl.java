package com.ityuan.services.Impl;

import com.ityuan.mapper.DeptMapper;
import com.ityuan.pojo.Dept;
import com.ityuan.pojo.Employee;
import com.ityuan.services.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service("deptService")
public class DeptServiceImpl implements DeptService {

    @Autowired
    private DeptMapper deptMapper;

    @Override
    public List<Dept> findAll() {
        List<Dept> deptList = deptMapper.findAllDept();
        return deptList;
    }

    @Override
    public void del(int obj) {
        deptMapper.delDept(obj);
    }

    @Override
    public Dept findOne(String deptNo) {
       Dept dept = deptMapper.findOneDept(deptNo);
       return dept;
    }

    @Override
    public Dept finddetailedOne(String deptNo) {
        Dept dept = deptMapper.finddetailedOneDept(deptNo);
        return dept;
    }

    @Override
    public void insertNewDept(Dept dept) {
        deptMapper.insertNewDept(dept);
    }

    @Override
    public void changeDept(Dept dept) {
        Date now = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createTime = dateFormat.format(now);
        dept.setCreateTime(createTime);
        deptMapper.changeDept(dept);
    }

    @Override
    public Employee selectOneEmployee(String deptName) {
        Employee employee = deptMapper.selectOneEmployee(deptName);
        return employee;
    }
}
