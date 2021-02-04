package com.zdx.ssm.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;
import com.zdx.ssm.bean.Employee;

/**
  *  使用Srping提供的单无测试
 * @author Administrator
 *
 */

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = { "classpath:applicationContext.xml", "classpath:springMVC.xml" })
public class ControllerTest {

	@Autowired
	WebApplicationContext context;
	// 虚拟MVC请求， 获取处理结果
	MockMvc mockMvc;

	@Before
	public void initMockMvc() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}

	@Test
	public void employeeControllerTest() throws Exception {
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/employee/emps").param("pn", "1")).andReturn();
		System.out.println(result);
		MockHttpServletRequest request = result.getRequest();
		PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");

		System.out.println("当前页码：" + pageInfo.getPageNum());
		System.out.println("总页数：" + pageInfo.getPages());
		System.out.println("总记录数：" + pageInfo.getTotal());
		System.out.print("页面要显示的连续页码：");
		int[] nums = pageInfo.getNavigatepageNums();
		for (int i : nums) {
			System.out.print(" " + i);
		}

		System.out.println();
		// 员工数据
		List<Employee> list = pageInfo.getList();
		for (Employee employee : list) {
			System.out.println("ID:" + employee.getId());
		}

	}

}
