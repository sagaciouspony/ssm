package cn.tjut.handler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.tjut.beans.Employee;
import cn.tjut.beans.Message;
import cn.tjut.service.EmployeeService;

@Controller
public class EmployeeController {
	
	/**
	 * 	增	POST  
	 * 	删	DELETE 
	 * 	改	PUT (必须使用HttpPutFormContentFilter过滤器,否则无法封装数据)
	 * 	查	GET
	 */

	@Autowired
	private EmployeeService employeeService;
	
	/*
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	*/
	
	//传入数组 通过id批量删除
	@RequestMapping(value="/emps/{empIdArray}",method=RequestMethod.DELETE)
	@ResponseBody
	public Message deleteByIds(@PathVariable Integer[] empIdArray) {
		
		
		for (Integer empId : empIdArray) {
			
			employeeService.deleteById(empId);
		}
		
		return Message.success();
	}
	
	//通过id删除
	@RequestMapping(value="/emp/{id}",method=RequestMethod.DELETE)
	@ResponseBody
	public Message deleteById(@PathVariable Integer id) {
		
		employeeService.deleteById(id);
		
		return Message.success();
	}
	
	//通过id修改
	@RequestMapping(value="/emp/{id}",method=RequestMethod.PUT)
	@ResponseBody
	public Message modifyEmp(Employee emp) {
		
		employeeService.modifyEmp(emp);
		//System.out.println(emp);
		
		return Message.success();
	}
	
	//通过id查询
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Message findById(@PathVariable("id")Integer id) {
		
		Employee emp = employeeService.findById(id);
		
		return Message.success().add("emp", emp);
	}
	
	//通过用户名查询
	@RequestMapping(value="/emp",method=RequestMethod.GET)
	@ResponseBody
	public Message findByPname(String pname) {
		
		String result = employeeService.findByPname(pname);
		
		return Message.success().add("isRepeated", result);
	}
	
	//添加
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	@ResponseBody
	public Message saveEmp(@Valid Employee emp ,BindingResult br) {
		
		if(br.hasErrors()) {
			
			List<FieldError> fieldErrors = br.getFieldErrors();
			
			Map<String ,Object> maps = new HashMap<String ,Object>();
			
			for (FieldError fieldError : fieldErrors) {
				
				String filedName = fieldError.getField();
				
				String message = fieldError.getDefaultMessage();
				
				maps.put(filedName ,message);
			}
			
			return Message.fail().add("errors", maps);
		}else {
			
			employeeService.saveEmp(emp);
			
			return Message.success();
		}
	}
	
	/*
	 * 返回json
	 */
	@RequestMapping(value="/emps",method=RequestMethod.GET)
	@ResponseBody
	public Message getEmpsWithJson(@RequestParam(value="pageNum",defaultValue="1")Integer pageNum) {
		
		// 	第二个参数 代表每页几个数据
		PageHelper.startPage(pageNum, 5);
		List<Employee> empList = employeeService.findAll();
		
		// 	第二个参数 	连续显示的页数
		PageInfo<?> pageInfo = new PageInfo<Employee>(empList, 7);
		
		return Message.success().add("pageInfo", pageInfo);
	}
	
	//@RequestMapping("/emps")
	public String getEmps(@RequestParam(value="pageNum",defaultValue="1")Integer pageNum,Model model) {
		
		// 		第二个参数 代表每页几个数据
		PageHelper.startPage(pageNum, 5);
		List<Employee> empList = employeeService.findAll();
		
		// 		第二个参数 	连续显示的页数
		PageInfo<?> pageInfo = new PageInfo<Employee>(empList, 5);
		model.addAttribute("pageInfo", pageInfo);
		
		return "/WEB-INF/views/list.jsp";
	}
}
