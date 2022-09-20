package com.gd.LMS.student.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.student.mapper.StudentMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class StudentService {
	@Autowired StudentMapper studentMapper;
	
	// 학생코드
	public int getStudentCode(String memberId) {
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "memberId (service) > " + memberId);
		
		// 매퍼메서드 호출 후 리턴값 디버깅
		int memberCode = studentMapper.selectStudentCode(memberId);
		
		return memberCode;
	}
	
	// 학생이 수강중인 강의리스트
	public List<Map<String, Object>> getStudentLectureList(int studentCode) {
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "studentCode (service) > " + studentCode);
		
		// 매퍼메서드 호출 후 리턴값 디버깅
		List<Map<String, Object>> studentLectureList = studentMapper.selectStudentLectureList(studentCode);
		log.debug(TeamColor.LCH + "studentLectureList (service) > " + studentLectureList);
		
		return studentLectureList;
	}

	// 학생이 수강중인 강의 상세보기
	public Map<String, Object> getStudentLectureOne(int openedLecNo) {
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "openedLecNo (service) > " + openedLecNo);
		
		// 매퍼메서드 호출 후 리턴값 디버깅
		Map<String, Object> studentLectureOne = studentMapper.selectStudentLectureOne(openedLecNo);
		log.debug(TeamColor.LCH + "studentLectureOne (service) > " + studentLectureOne);
		
		return studentLectureOne;
	}
	
	// 학생이 수강중인 한 강의 과제리스트
	public List<Map<String, Object>> getStudentAssignmentList(Map<String, Object> paramMap) {
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "paramMap (service) > " + paramMap);
		
		// 매퍼메서드 호출 후 리턴값 디버깅
		List<Map<String, Object>> studentAssignmentList = studentMapper.selectStudentAssignmentList(paramMap);
		log.debug(TeamColor.LCH + "studentAssignmentList (service) > " + studentAssignmentList);
		
		return studentAssignmentList;
	}
	
	// 학생 수강중 과제 상세보기
	public Map<String, Object> getStudentAssignmentOne(int assignmentNo) {
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "assignmentNo (service) > " + assignmentNo);
		
		// 매퍼메서드 호출 후 리턴값 디버깅
		Map<String, Object> resultMap = studentMapper.selectStudentAssignmentOne(assignmentNo);
		log.debug(TeamColor.LCH + "resultMap (service) > " + resultMap);
		
		return resultMap;
	}
	
}
