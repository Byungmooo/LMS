package com.gd.LMS.lecture.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.lecture.mapper.LectureMapper;
import com.gd.LMS.utils.PagingVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class LectureService {
	@Autowired
	LectureMapper lectureMapper;

	// 수강리스트
	public List<Map<String, Object>> getStudentLectureList(int studentCode) {
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "studentCode (service) > " + studentCode);

		// 매퍼메서드 호출 후 리턴값 디버깅
		List<Map<String, Object>> studentLectureList = lectureMapper.selectStudentLectureList(studentCode);
		log.debug(TeamColor.LCH + "studentLectureList (service) > " + studentLectureList);

		return studentLectureList;
	}
	
	// 진행강의리스트
	public List<Map<String, Object>> getProfessorLectureList(int professorCode) {
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "professorCode (service) > " + professorCode);

		// 매퍼메서드 호출 후 리턴값 디버깅
		List<Map<String, Object>> professorLectureList = lectureMapper.selectProfessorLectureList(professorCode);
		log.debug(TeamColor.LCH + "professorLectureList (service) > " + professorLectureList);

		return professorLectureList;
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

	

}
