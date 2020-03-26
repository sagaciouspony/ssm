package cn.tjut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tjut.beans.Employee;
import cn.tjut.dao.EmployeeMapper;

@Service
public class EmployeeService {
	
	@Autowired
	private EmployeeMapper employeeMapper;
	
	/*
	public void setEmpMapper(EmployeeMapper employeeMapper) {
		this.employeeMapper = employeeMapper;
	}
	*/
	
	public void deleteById(Integer id) {
		
		employeeMapper.deleteByPrimaryKey(id);
	}
	
	public void modifyEmp(Employee emp) {
		
		employeeMapper.updateByPrimaryKeySelective(emp);
	}
	
	public Employee findById(Integer id) {
		
		return employeeMapper.selectByPrimaryKey(id);
	}
	
	public String findByPname(String pname) {
		
		Employee emp = employeeMapper.findByPname(pname);
		
		if(emp != null) {
			
			return "true";
		}else {
			
			return "false";
		}
	}
	
	public void saveEmp(Employee emp) {
		
		employeeMapper.insertSelective(emp);
	}
	
	public List<Employee> findAll() {
		
		return employeeMapper.findAllWithDept();
	}

}
