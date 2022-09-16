package com.gd.LMS.student.Mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StudentMapper {
	
	List<Map<String, Object>> selectStudentLectureList(int studentCode);
	
	Map<String, Object> selectStudentLectureOne(int openedLecNo);
	
	List<Map<String, Object>> selectAssignmentList(int openedLecNo);
	
}
