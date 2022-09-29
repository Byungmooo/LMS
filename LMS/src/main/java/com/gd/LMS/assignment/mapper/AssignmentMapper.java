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
		List<Assignment> selectAssignmentList(int openedLecNo);

		//과제 개수 카운트
		int selectAssignmentTotalCount();
		
				
		// 과제 출제
		int insertAssignment(Assignment assignment);
		
		// 출제한 과제 수정 form
		Assignment selectAssignmentOne(int openedLecNo);

		// 출제한 과제 수정 action
		int updateAssignment(Assignment assignment);
		
		//과제 삭제
		int deleteAssignment(int openedLecNo);
	
}
