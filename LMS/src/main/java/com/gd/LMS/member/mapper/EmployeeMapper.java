package com.gd.LMS.member.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.vo.Employee;
import com.gd.LMS.vo.Student;

@Mapper
public interface EmployeeMapper {
			
		// 직원 목록
		List<Map<String,Object>> selectEmployeeList();
		
		//직원 상세보기
		Map<String, Object> selectEmployeeOne(int employeeCode);
	
		
		
		

}
