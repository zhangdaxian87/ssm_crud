package com.zdx.ssm.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zdx.ssm.bean.Department;
import com.zdx.ssm.bean.Employee;
import com.zdx.ssm.dao.DepartmentMapper;
import com.zdx.ssm.dao.EmployeeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class MapperTest {

	@Autowired
	private DepartmentMapper departmentMapper;
	@Autowired
	private EmployeeMapper employeeMapper;

	@Test
	public void addTest() {
		// 增加部门
		departmentMapper.insert(new Department(null, "财务部"));

//		Employee employee = new Employee(null, "jery", "jery@qq.com", "M", 3);
//		employeeMapper.insert(employee);
		/*for (int i = 0; i < 1000; i++) {
			String uid = UUID.randomUUID().toString().substring(0, 5);
			employeeMapper.insert(new Employee(null, uid, uid + "@qq.com", "M", 1));
		}*/
	}

	@Test
	public void selectWithDepartmentByIdTest() {
		Employee employee = employeeMapper.selectWithDepartmentById(4);
		System.out.println("employee" + employee.getDepartment().getDeptName());
	}

	@Test
	public void selectWithDepartmentByExampleTest() {
		List<Employee> employees = employeeMapper.selectWithDepartmentByExample(null);
		System.out.println(employees.size());
		System.out.println("部门=>" + employees.get(1).getDepartment().getDeptName());
		/*for (Employee employee : employees) {
			System.out.println("employee=>" + employee);
		}*/

	}
}
