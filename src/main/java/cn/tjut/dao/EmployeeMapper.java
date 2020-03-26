package cn.tjut.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import cn.tjut.beans.Employee;
import cn.tjut.beans.EmployeeExample;

public interface EmployeeMapper {
    long countByExample(EmployeeExample example);

    int deleteByExample(EmployeeExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Employee record);

    int insertSelective(Employee record);

    List<Employee> selectByExample(EmployeeExample example);

    Employee selectByPrimaryKey(Integer id);
    
    List<Employee> findAllWithDept();
    
    Employee findByIdWithDept(Integer id);
    
    Employee findByPname(String pname);

    int updateByExampleSelective(@Param("record") Employee record, @Param("example") EmployeeExample example);

    int updateByExample(@Param("record") Employee record, @Param("example") EmployeeExample example);

    int updateByPrimaryKeySelective(Employee record);

    int updateByPrimaryKey(Employee record);
}