package com.zdx.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zdx.ssm.bean.Employee;
import com.zdx.ssm.bean.EmployeeExample;
import com.zdx.ssm.bean.EmployeeExample.Criteria;
import com.zdx.ssm.dao.EmployeeMapper;

@Service
public class EmployeeService {

	@Autowired
	private EmployeeMapper employeeMapper;

	public List<Employee> getEmployees(EmployeeExample employee) {
		return employeeMapper.selectWithDepartmentByExample(employee);
	}

	public Employee getEmployeeWithDepartmentById(Integer id) {
		return employeeMapper.selectWithDepartmentById(id);
	}

	public boolean save(Employee employee) {
		return employeeMapper.insertSelective(employee) > 0 ? true : false;
	}

	public boolean checkLastName(String lastName) {
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andLastNameEqualTo(lastName);
		long count = employeeMapper.countByExample(example);
		return count == 0;
	}

	public boolean update(Employee employee) {
		return employeeMapper.updateByPrimaryKeySelective(employee) == 1;
	}

	public boolean deleteById(Integer id) {
		return employeeMapper.deleteByPrimaryKey(id) == 1;
	}

	public boolean deleteBatchById(List<Integer> idList) {
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdIn(idList);
		return employeeMapper.deleteByExample(example) == 1;
	}
}
