package com.gd.LMS.student.Mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StudentMapper {
	
	// 학생이 수강중인 강의리스트
	List<Map<String, Object>> selectStudentLectureList(int studentCode);
	
	// 학생이 수강중인 강의 상세보기
	Map<String, Object> selectStudentLectureOne(int openedLecNo);
	
	// 학생이 수강중인 한 강의 과제리스트
	List<Map<String, Object>> selectStudentAssignmentList(int openedLecNo);
	
}
