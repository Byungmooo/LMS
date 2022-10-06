package com.gd.LMS.assignment.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

import com.gd.LMS.vo.Assignment;
import com.gd.LMS.vo.AssignmentReg;
import com.gd.LMS.vo.AssignmentRegImg;
import com.gd.LMS.vo.OpenedLecture;
import com.gd.LMS.vo.TotalLecture;

@Mapper
public interface AssignmentMapper {
	

	// 전체 과제 리스트  
	List<Map<String, Object>>  selectAssignmentList(Map<String,Object> map);

	//과제 개수 카운트
	int selectAssignmentCount(Map<String, Object> map);
	
	//과제 상세보기
	Map<String, Object> selectAssignmentOne(int assignmentNo);
	
	// 과제 출제
	int insertAssignment(Assignment assignment);
	
	// 출제한 과제 수정 
	int updateAssignment(Assignment assignment);
	
	//과제 삭제
	int deleteAssignment(int openedLecNo);
	
	

}
