package com.gd.LMS.lecture.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.vo.LectureQuestion;

@Mapper
public interface LectureMapper {
	
	
	// 강의리스트
	List<Map<String, Object>> selectStudentLectureList(int studentCode);
	
	// 강의 상세보기
	Map<String, Object> selectOpenedLectureOne(int openedLecNo);
	
	// 강의 질문리스트
	List<LectureQuestion> selectLectureQuestionList(int openedLecNo);
	
	// 강의 질문 상세보기
	Map<String, Object> selectLectureQuestionOne(int lecQuestionNo);
	
}
