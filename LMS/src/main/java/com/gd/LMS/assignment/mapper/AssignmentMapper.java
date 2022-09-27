package com.gd.LMS.assignment.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.vo.Assignment;
import com.gd.LMS.vo.AssignmentReg;
import com.gd.LMS.vo.AssignmentRegImg;

@Mapper
public interface AssignmentMapper {
	// 학생이 수강중인 한 강의 과제리스트
	List<Map<String, Object>> selectStudentAssignmentList(Map<String, Object> paramMap);
	// 학생이 수강중인 과제 상세보기
	Map<String, Object> selectStudentAssignmentOne(int assignmentNo);

	//학생 과제 제출(추가)
	int insertStudentAssignment(Assignment assignment);
	
	//과제 수정 폼
	Map<String, Object> updateStudentAssignment(int assignmentNo);
	//과제 수정 액션
	int updateStudentAssignment(Map<String, Object> map);
	
	//과제 삭제
	int deleteStudentAssignmentReg(int assignmentNo);
	
}
