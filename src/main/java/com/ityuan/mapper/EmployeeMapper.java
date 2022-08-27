package com.ityuan.mapper;

import com.ityuan.pojo.Employee;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
public interface EmployeeMapper {

    List<Employee> findAllEmployee();

    void addNewempLoyee(Employee employee);

    List<Employee> findOneEmployee(@Param("empName") String empName,@Param("empDept") String empDept);

    void delemployee(int obj);

    Employee findNewOne(String empNo);

}
