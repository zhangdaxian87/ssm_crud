package com.zdx.ssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zdx.ssm.bean.Employee;
import com.zdx.ssm.bean.EmployeeExample;

public interface EmployeeMapper {
	long countByExample(EmployeeExample example);

	int deleteByExample(EmployeeExample example);

	int deleteByPrimaryKey(Integer id);

	int insert(Employee record);

	int insertSelective(Employee record);

	List<Employee> selectByExample(EmployeeExample example);

	Employee selectByPrimaryKey(Integer empId);

	List<Employee> selectWithDepartmentByExample(EmployeeExample example);

	Employee selectWithDepartmentById(Integer id);

	int updateByExampleSelective(@Param("record") Employee record, @Param("example") EmployeeExample example);

	int updateByExample(@Param("record") Employee record, @Param("example") EmployeeExample example);

	int updateByPrimaryKeySelective(Employee record);

	int updateByPrimaryKey(Employee record);
}