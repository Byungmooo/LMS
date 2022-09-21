package com.gd.LMS.lecture.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LectureMapper {
	// 학생코드
	int selectStudentCode(String memberId);
	
	// 학생이 수강중인 강의리스트
	List<Map<String, Object>> selectStudentLectureList(int studentCode);
	
	// 학생이 수강중인 강의 상세보기
	Map<String, Object> selectStudentLectureOne(int openedLecNo);
}
