package com.gd.LMS.assignment.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.http.ResponseEntity;

import com.gd.LMS.vo.AssignmentReg;
import com.gd.LMS.vo.AssignmentRegImg;


@Mapper
public interface AssignmentRegMapper {
	
	
	// 제출한 과제 전체 리스트
	List<Map<String,Object>> selectAssignmentRegList(int openedLecNo);
	
	// 상세보기
	Map<String,Object> selectAssignmentRegOne(int assignmentNo);

	// 과제 제출 
	int insertAssignmentReg(AssignmentReg assignmentReg);
	
	// 과제 수정 
	int updateAssignmentReg(AssignmentReg assignmentReg);
		
	// 제출한 과제 점수 수정 
	int updateAssignmentRegScore(int assignmentNo);

	// 제출한 과제 삭제 (assignmentReg에서 삭제)
	int deleteAssignmentReg(int assignmentNo);
	
	//과제 파일 다운로드
	ResponseEntity<Object> douwnloadFile(String fileName, String realPatth);

	
	
	
}
