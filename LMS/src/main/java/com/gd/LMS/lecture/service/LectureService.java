package com.gd.LMS.lecture.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.lecture.mapper.LectureMapper;
import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.LectureQuestion;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class LectureService {
@Autowired LectureMapper lectureMapper;
	
	
	
	// 진행강의리스트
	public List<Map<String, Object>> getStudentLectureList(int studentCode) {
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "studentCode (service) > " + studentCode);
		
		// 매퍼메서드 호출 후 리턴값 디버깅
		List<Map<String, Object>> studentLectureList = lectureMapper.selectStudentLectureList(studentCode);
		log.debug(TeamColor.LCH + "studentLectureList (service) > " + studentLectureList);
		
		return studentLectureList;
	}

	// 강의 상세보기
	public Map<String, Object> getOpenedLectureOne(int openedLecNo) {
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "openedLecNo (service) > " + openedLecNo);
		
		// 매퍼메서드 호출 후 리턴값 디버깅
		Map<String, Object> openedLectureOne = lectureMapper.selectOpenedLectureOne(openedLecNo);
		log.debug(TeamColor.LCH + "studentLectureOne (service) > " + openedLectureOne);
		
		return openedLectureOne;
	}
	
	// 강의 질문리스트
	public List<LectureQuestion> getLectureQuestionList(int openedLecNo) {
		log.debug(TeamColor.LCH + openedLecNo + this.getClass());
		
		List<LectureQuestion> lectureQuestionOne = lectureMapper.selectLectureQuestionList(openedLecNo);
		
		log.debug(TeamColor.LCH + this.getClass() + lectureQuestionOne);
		
		return lectureQuestionOne;
	}
	
	// 강의 질문 상세보기
	public Map<String, Object> getLectureQuestionOne(int lecQuestionNo) {
		
		Map<String, Object> lectureQuestion = lectureMapper.selectLectureQuestionOne(lecQuestionNo);
		
		return lectureQuestion;
	}
	
	// 학생 수강신청 (전체 과목 리스트)
	public List<Map<String, Object>> getTotalLectureList(PagingVo vo) {
		
		List<Map<String, Object>> totalLectureList = lectureMapper.selectTotalLectureList(vo);
		
		return totalLectureList;
	}
	
	// 학생 수강신청 (장바구니)
	public List<Map<String, Object>> getStudentLectureCartList() {
		
		List<Map<String, Object>> studentLectureCartList = lectureMapper.selectStudentLectureCartList();
		
		return studentLectureCartList;
	}
	
	// 학생 수강신청 (전체과목개수)
	public int getTotalLectureCount() {
		return lectureMapper.selectTotalLectureCount();
	}
	
	// 학생 수강신청 (수강담기)
	public int studentCartAdd(Map<String, Object> map) {
		return lectureMapper.studentCartInsert(map);
	}
	
	// 학생 수강신청 (수강취소)
	public int studentCartRemove(String cartNo) {
		return lectureMapper.studentCartDelete(cartNo);
	}
	
}
