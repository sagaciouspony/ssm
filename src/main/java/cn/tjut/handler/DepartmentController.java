package cn.tjut.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tjut.beans.Message;
import cn.tjut.service.DepartmentService;

@Controller
public class DepartmentController {

	@Autowired
	private DepartmentService service;
	
	@RequestMapping(value="/depts",method=RequestMethod.GET)
	@ResponseBody
	public Message findAll() {
		
		return Message.success().add("deptList", service.findAll());
	}
}
