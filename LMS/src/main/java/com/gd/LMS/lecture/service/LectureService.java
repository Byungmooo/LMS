package com.gd.LMS.lecture.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.lecture.mapper.LectureMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class LectureService {
@Autowired LectureMapper lectureMapper;
	
	// 학생코드
	public int getStudentCode(String memberId) {
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "memberId (service) > " + memberId);
		
		// 매퍼메서드 호출 후 리턴값 디버깅
		int memberCode = lectureMapper.selectStudentCode(memberId);
		
		return memberCode;
	}
	
	// 학생이 수강중인 강의리스트
	public List<Map<String, Object>> getStudentLectureList(int studentCode) {
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "studentCode (service) > " + studentCode);
		
		// 매퍼메서드 호출 후 리턴값 디버깅
		List<Map<String, Object>> studentLectureList = lectureMapper.selectStudentLectureList(studentCode);
		log.debug(TeamColor.LCH + "studentLectureList (service) > " + studentLectureList);
		
		return studentLectureList;
	}

	// 학생이 수강중인 강의 상세보기
	public Map<String, Object> getStudentLectureOne(int openedLecNo) {
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "openedLecNo (service) > " + openedLecNo);
		
		// 매퍼메서드 호출 후 리턴값 디버깅
		Map<String, Object> studentLectureOne = lectureMapper.selectStudentLectureOne(openedLecNo);
		log.debug(TeamColor.LCH + "studentLectureOne (service) > " + studentLectureOne);
		
		return studentLectureOne;
	}
}
