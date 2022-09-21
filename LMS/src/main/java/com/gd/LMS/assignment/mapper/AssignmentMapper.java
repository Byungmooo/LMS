package com.gd.LMS.assignment.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AssignmentMapper {
	// 학생이 수강중인 한 강의 과제리스트
	List<Map<String, Object>> selectStudentAssignmentList(Map<String, Object> paramMap);
	
	Map<String, Object> selectStudentAssignmentOne(int assignmentNo);
}
