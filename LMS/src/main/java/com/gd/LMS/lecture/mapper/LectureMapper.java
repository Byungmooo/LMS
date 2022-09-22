package com.gd.LMS.lecture.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.utils.PagingVo;
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
	
	// 학생 수강신청 (전체과목)
	List<Map<String, Object>> selectTotalLectureList(PagingVo vo);
	
	// 학생 수강신청 (장바구니)
	List<Map<String, Object>> selectStudentLectureCartList();
	
	// 학생 수강신청 (전체과목수)
	int selectTotalLectureCount();
	
	// 학생 수강신청 (수강담기)
	int studentCartInsert(Map<String, Object> map);
	
	// 학생 수강신청 (수강취소)
	int studentCartDelete(String cartNo);

}
