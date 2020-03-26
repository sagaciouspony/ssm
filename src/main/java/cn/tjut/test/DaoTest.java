package cn.tjut.test;

import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.github.pagehelper.PageHelper;

import cn.tjut.beans.Department;
import cn.tjut.beans.Employee;
import cn.tjut.dao.DepartmentMapper;
import cn.tjut.dao.EmployeeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:applicationContext.xml")
public class DaoTest {
	
	@Autowired
	private DepartmentMapper deptMapper;
	
	@Autowired
	private EmployeeMapper empMapper;
	
	@Autowired
	private SqlSession batchSqlSession;
	
	@Test
	public void testBatch() {
		
		EmployeeMapper mapper = batchSqlSession.getMapper(EmployeeMapper.class);
		
		int did = 1;
		
		for (int i = 0; i < 1000; i++) {
			String uid = UUID.randomUUID().toString();
			mapper.insert(new Employee(uid, "m", uid+"@qq.com", did));
		}
	}
	
	@Test
	public void testFindById() {
		
		Employee emp = empMapper.findByIdWithDept(6);
		
		System.out.println(emp);
	}
	@Test
	public void testInsert() {
		
		empMapper.insert(new Employee("xueFeng", "m", "lululu@qq.com", 1));
	}
	
	@Test
	public void testEmpFindAll() {
		
		// 使用插件
		PageHelper.startPage(1, 10);
		List<Employee> empList = empMapper.findAllWithDept();
		
		for (Employee employee : empList) {
			
			System.out.println(employee);
		}
	}
	
	@Test
	public void testDept() {
		
		//mapper.insert(new Department(3, "运维部"));
		System.out.println(deptMapper);
		
		Department dept = new Department();
		
		dept.setDname("运维部");
		
		deptMapper.insertSelective(dept);
	}
	
}
