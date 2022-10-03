package com.gd.LMS.department.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.Assignment;
import com.gd.LMS.vo.Department;
import com.gd.LMS.vo.TotalNotice;

@Mapper
public interface DepartmentMapper {

	
	//학부 총 갯수
	int countDepartment(Map<String, Object> map);

	// 페이징 처리 게시글 조회
	List<Department> selectDepartment(Map<String, Object> map);
	
	
	//학부상세보기
	Department selectDepartMentOne(String departmentCode);
	
	
	//학부추가
	int insertDepartment(Department department);

	
	//수정 action
	int updateDepartment(Department department);

		
	//학부삭제
	int deleteDepartment(int departmentCode);
	
	
 
}
