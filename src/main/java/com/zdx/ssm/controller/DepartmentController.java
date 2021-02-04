package com.zdx.ssm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zdx.ssm.bean.Department;
import com.zdx.ssm.bean.Msg;
import com.zdx.ssm.service.DepartmentService;

@Controller
@ResponseBody
@RequestMapping("/department")
public class DepartmentController {

	@Autowired
	private DepartmentService departmentService;

	@RequestMapping(value = "/list")
	public Msg getDepartments() {
		List<Department> list = departmentService.getDepartments(null);
		System.out.println(list);
		return Msg.success().add("departments", list);
	}

}
