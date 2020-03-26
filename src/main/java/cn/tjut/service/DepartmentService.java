package cn.tjut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.tjut.beans.Department;
import cn.tjut.dao.DepartmentMapper;

@Service
public class DepartmentService {

	@Autowired
	private DepartmentMapper mapper;
	
	public List<Department> findAll() {
		
		return mapper.selectByExample(null);
	}
}
