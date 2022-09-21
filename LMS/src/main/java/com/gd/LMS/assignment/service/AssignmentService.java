package com.gd.LMS.assignment.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.LMS.assignment.mapper.AssignmentMapper;
import com.gd.LMS.commons.TeamColor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class AssignmentService {
	@Autowired AssignmentMapper assignmentMapper;
	
	// 학생이 수강중인 한 강의 과제리스트
	public List<Map<String, Object>> getOpenedAssignmentList(Map<String, Object> paramMap) {
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "paramMap (service) > " + paramMap);
		
		// 매퍼메서드 호출 후 리턴값 디버깅
		List<Map<String, Object>> openedAssignmentList = assignmentMapper.selectOpenedAssignmentList(paramMap);
		log.debug(TeamColor.LCH + "studentAssignmentList (service) > " + openedAssignmentList);
		
		return openedAssignmentList;
	}
	
	// 학생 수강중 과제 상세보기
	public Map<String, Object> getOpenedAssignmentOne(int assignmentNo) {
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "assignmentNo (service) > " + assignmentNo);
		
		// 매퍼메서드 호출 후 리턴값 디버깅
		Map<String, Object> resultMap = assignmentMapper.selectOpenedAssignmentOne(assignmentNo);
		log.debug(TeamColor.LCH + "resultMap (service) > " + resultMap);
		
		return resultMap;
	}
}
