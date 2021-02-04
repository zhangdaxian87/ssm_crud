package com.zdx.ssm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zdx.ssm.bean.Department;
import com.zdx.ssm.bean.DepartmentExample;
import com.zdx.ssm.dao.DepartmentMapper;

@Service
public class DepartmentService {

	@Autowired
	private DepartmentMapper departmentMapper;

	public List<Department> getDepartments(DepartmentExample example) {
		return departmentMapper.selectByExample(example);
	}
}
