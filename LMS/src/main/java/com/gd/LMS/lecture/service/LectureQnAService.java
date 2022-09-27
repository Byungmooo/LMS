package com.gd.LMS.lecture.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.LMS.lecture.mapper.LectureQnAMapper;
import com.gd.LMS.vo.LectureAnswer;
import com.gd.LMS.vo.LectureQuestion;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class LectureQnAService {
	@Autowired LectureQnAMapper lectureQnAMapper;
	
	// 강의 질문리스트
	public List<LectureQuestion> selectBoard(Map<String, Object> map) {
		return lectureQnAMapper.selectBoard(map);
	}

	// 페이징 , 검색
	public int countBoard(Map<String, Object> map) {
		return lectureQnAMapper.countBoard(map);
	}

	// 강의 질문 상세보기
	public Map<String, Object> getLectureQuestionOne(int lecQuestionNo) {

		Map<String, Object> lectureQuestion = lectureQnAMapper.selectLectureQuestionOne(lecQuestionNo);

		return lectureQuestion;
	}

	// 답변 추가,답변여부 변경
	public int getAddAnswer(LectureAnswer lectureAnswer) {
		lectureQnAMapper.addAnswer(lectureAnswer);

		return lectureQnAMapper.answerStatus(lectureAnswer.getLecQuestionNo());
	}

	// 학생 질문 추가
	public int getAddQuestion(LectureQuestion lectureQuestion) {
		return lectureQnAMapper.addQuestion(lectureQuestion);
	}

	// 학생 질문 수정
	public int updateQuestion(LectureQuestion lectureQuestion) {
		return lectureQnAMapper.updateLecQuestion(lectureQuestion);
	}

	// 학생 질문삭제
	public int deleteQuestion(int lecQuestionNo) {
		lectureQnAMapper.deleteLecAnswer(lecQuestionNo);
		return lectureQnAMapper.deleteLecQuestion(lecQuestionNo);
	}

	// 강의 질문 답변 상세보기
	public Map<String, Object> getLectureAnswerOne(int lecQuestionNo) {
		Map<String, Object> lectureAnswer = lectureQnAMapper.selectLectureAnswerOne(lecQuestionNo);
		return lectureAnswer;
	}
}
