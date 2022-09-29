package com.gd.LMS.lecture.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.vo.LectureAnswer;
import com.gd.LMS.vo.LectureQuestion;

@Mapper
public interface LectureQnAMapper {

	// 강의 질문리스트 페이징 처리 게시글 조회
	List<LectureQuestion> selectBoard(Map<String, Object> map);

	List<LectureQuestion> selectLectureQuestionList(int openedLecNo);

	// 강의 질문 상세보기
	Map<String, Object> selectLectureQuestionOne(int lecQuestionNo);
	
	// 게시물 총 갯수
	int countBoard(Map<String, Object> map);
	
	// 강의 질문 답변여부
	int answerStatus(int lecQuestionNo);

	// 학생 질문 답변 추가 -교수-
	int addAnswer(LectureAnswer lectureAnswer);

	// 학생 질문 추가 -학생-
	int addQuestion(LectureQuestion lectureQuestion);

	// 공지사항 수정
	public int updateLecQuestion(LectureQuestion lectureQuestion);

	// 질문 삭제
	public int deleteLecQuestion(int lecQuestionNo);

	// 답변 삭제
	public int deleteLecAnswer(int lecQuestionNo);

	// 답변 상세보기
	Map<String, Object> selectLectureAnswerOne(int lecQuestionNo);

	
	
}
