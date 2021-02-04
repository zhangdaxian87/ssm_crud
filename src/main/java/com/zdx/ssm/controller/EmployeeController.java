package com.zdx.ssm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zdx.ssm.bean.Employee;
import com.zdx.ssm.bean.Msg;
import com.zdx.ssm.service.EmployeeService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;

	@RequestMapping(value = "/index")
	public String Index() {

		return "/employee/list";
	}

	/**
	 * 查询所有员工 以Json字符串形式返回到页面，需要导入Jaskson Databind
	 * @Title: getEmployeesWithJson
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param pn
	 * @return    參數描述
	 * @return Msg  返回类型
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value = "/list")
	public Msg getEmployeesWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		// 引入分页PageHelper插件，在查询前只需要调用，传入页码和每页大小
		PageHelper.startPage(pn, 5);
		List<Employee> employees = employeeService.getEmployees(null);
		// 使用PageInfo进行封装查询结果，封装了详细的分面信息，包括查询出来的数据，8表示传入的连续显示的页数等
		PageInfo<Employee> pageInfo = new PageInfo<>(employees, 8);

		return Msg.success().add("pageInfo", pageInfo);
	}

	/**
	  * 原始模式的查询列表返回形式
	 * @param pn
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/emps")
	public String getEmployees(@RequestParam(value = "pn", defaultValue = "1") Integer pn, Model model) {

		PageHelper.startPage(pn, 5);
		List<Employee> employees = employeeService.getEmployees(null);
		PageInfo<Employee> pageInfo = new PageInfo<>(employees);
		model.addAttribute("pageInfo", pageInfo);

		return "/employee/list";
	}

	/**
	 * 检查员工姓名唯一
	 * @Title: checkLastName
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param lastName
	 * @return    參數描述
	 * @return Msg  返回类型
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value = "/checkLastName", method = RequestMethod.GET)
	public Msg checkLastName(@RequestParam("lastName") String lastName) {
		String regLastName = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
		if (!lastName.matches(regLastName)) {
			return Msg.fail().add("msg", "用户名必需由2-5位中文或者6-16位英文和数字的组合1");
		}

		boolean b = employeeService.checkLastName(lastName);
		if (!b) {
			return Msg.fail().add("msg", "用户名不可用");
		} else {
			return Msg.success().add("msg", "用户名可用");
		}
	}

	/**
	 * 保存员工
	 * @Title: save
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param employee
	 * @param result
	 * @return    參數描述
	 * @return Msg  返回类型
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value = "/employee", method = RequestMethod.POST)
	public Msg save(@Validated Employee employee, BindingResult result) {
		if (result.hasErrors()) {
			Map<String, Object> map = new HashMap<>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError error : errors) {
				System.out.println("Field=>" + error.getField());
				System.out.println("msg==>" + error.getDefaultMessage());
				map.put(error.getField(), error.getDefaultMessage());
			}
			return Msg.fail().add("fieldErrors", map);
		} else {
			employeeService.save(employee);
			return Msg.success();
		}
	}

	/**
	 * 按ID查询员工
	 * @Title: getEmployeeById
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param id
	 * @return    參數描述
	 * @return Msg  返回类型
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value = "/employee/{id}", method = RequestMethod.GET)
	public Msg getEmployeeById(@PathVariable("id") Integer id) {
		Employee employee = employeeService.getEmployeeWithDepartmentById(id);
		return Msg.success().add("employee", employee);
	}

	/**
	 * 更新员工
	 * @Title: update
	 * @Description: TODO(这里用一句话描述这个方法的作用)
	 * @param employee
	 * @return    參數描述
	 * @return Msg  返回类型
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value = "/employee/{id}", method = RequestMethod.PUT)
	public Msg update(@PathVariable("id") Integer id, Employee employee) {
		System.out.println("employee==>" + employee);
		employeeService.update(employee);
		return Msg.success();
	}

	@ResponseBody
	@RequestMapping(value = "/employee/{ids}", method = RequestMethod.DELETE)
	public Msg deleteById(@PathVariable("ids") String ids) {
		if (ids.contains(",")) {
			List<Integer> idList = new ArrayList<>();
			String[] idArr = ids.split(",");
			for (String id : idArr) {
				idList.add(Integer.parseInt(id));
				employeeService.deleteBatchById(idList);
			}
		} else {
			employeeService.deleteById(Integer.parseInt(ids));
		}

		return Msg.success();
	}
}
