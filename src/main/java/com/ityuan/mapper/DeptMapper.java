package com.ityuan.mapper;

import com.ityuan.pojo.Dept;
import com.ityuan.pojo.Employee;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface DeptMapper {

    List<Dept> findAllDept();

    void delDept(int obj);

    Dept findOneDept(String deptNo);

    Dept finddetailedOneDept(String deptNo);

    void insertNewDept(Dept dept);

    void changeDept(Dept dept);

    Employee selectOneEmployee(String deptName);
}
