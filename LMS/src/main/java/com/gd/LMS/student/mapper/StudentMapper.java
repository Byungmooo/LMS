package com.gd.LMS.student.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StudentMapper {
	
	// 학생코드
	int selectStudentCode(String memberId);
	
	// 학생이 수강중인 강의리스트
	List<Map<String, Object>> selectStudentLectureList(int studentCode);
	
	// 학생이 수강중인 강의 상세보기
	Map<String, Object> selectStudentLectureOne(int openedLecNo);
	
	// 학생이 수강중인 한 강의 과제리스트
	List<Map<String, Object>> selectStudentAssignmentList(Map<String, Object> paramMap);
	
	Map<String, Object> selectStudentAssignmentOne(int assignmentNo);
}