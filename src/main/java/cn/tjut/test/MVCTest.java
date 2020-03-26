package cn.tjut.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;

import cn.tjut.beans.Employee;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations={"classpath:applicationContext.xml","classpath:spring-mvc.xml"})
public class MVCTest {
	
	@Autowired
	WebApplicationContext context;
	
	//	虚拟mvc请求 获取到结果
	MockMvc mockMvc ;
	
	@Before
	public void initMockMvc() {
		
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	@Test
	public void testPage() throws Exception {
		
		//	模拟请求 获取返回值
		MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.get("/emps").param("pageNum", "4");
		
		MvcResult result = mockMvc.perform(requestBuilder).andReturn();
		
		PageInfo<?> pageInfo = (PageInfo<?>)result.getRequest().getAttribute("pageInfo");
		
		System.out.println("PageNum "+pageInfo.getPageNum());
		
		System.out.println("NavigatePages "+pageInfo.getNavigatePages());
		
		System.out.println("PageSize "+pageInfo.getPageSize());
		
		System.out.println("Size "+pageInfo.getSize());
		
		System.out.println("Total "+pageInfo.getTotal());
		
		int[] nums = pageInfo.getNavigatepageNums();
		for (int i : nums) {
			System.out.println("--"+i);
		}
		
		@SuppressWarnings("unchecked")
		List<Employee> empList = (List<Employee>) pageInfo.getList();
		
		for (Employee employee : empList) {
			
			System.out.println(employee);
		}
	}
}
