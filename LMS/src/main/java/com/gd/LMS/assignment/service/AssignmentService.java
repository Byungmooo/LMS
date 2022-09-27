package com.gd.LMS.assignment.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.gd.LMS.assignment.mapper.AssignmentMapper;
import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.lecture.mapper.LectureMapper;
import com.gd.LMS.vo.Assignment;
import com.gd.LMS.vo.AssignmentReg;
import com.gd.LMS.vo.AssignmentRegImg;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class AssignmentService {
	@Autowired AssignmentMapper assignmentMapper;
	@Autowired LectureMapper lectureMapper;
	
	// 학생이 수강중인 한 강의 과제리스트
	public List<Map<String, Object>> getStudentAssignmentList(Map<String, Object> paramMap) {
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "paramMap (service) > " + paramMap);
		
		// 매퍼메서드 호출 후 리턴값 디버깅
		List<Map<String, Object>> studentAssignmentList = assignmentMapper.selectStudentAssignmentList(paramMap);
		log.debug(TeamColor.LCH + "studentAssignmentList (service) > " + studentAssignmentList);
		
		return studentAssignmentList;
	}
	
	// 학생 수강중 과제 상세보기
	public Map<String, Object> getStudentAssignmentOne(int assignmentNo) {
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "assignmentNo (service) > " + assignmentNo);
		
		// 매퍼메서드 호출 후 리턴값 디버깅
		Map<String, Object> resultMap = assignmentMapper.selectStudentAssignmentOne(assignmentNo);
		log.debug(TeamColor.LCH + "resultMap (service) > " + resultMap);
		
		return resultMap;
	}

	
	//opendLec 자동 설정 추가 폼
	public Map<String, Object> addAssignmentForm(int studentCode) {
			
			Map<String, Object> resultMap = new HashMap<>();
		
			List<Map<String, Object>> opendLecList = lectureMapper.selectStudentLectureList(studentCode);
			
			resultMap.put("opendLecList", opendLecList);
			
			return resultMap;
		}
	
	//과제 추가 폼
	public int addAssignment(Assignment assignment) {
		int row = assignmentMapper.insertStudentAssignment(assignment);
		log.debug(TeamColor.BJH + assignment +  "<-----assignment 추가 폼");
		return row;

	}
	//과제 추가 액션
	public int addAssignmentAction(Assignment assignment) {
		int row = assignmentMapper.insertStudentAssignment(assignment);
		log.debug(TeamColor.BJH + assignment +  "<-----assignment 추가 액션");
		return row;

	}
	
	//과제 수정 폼
	public Map<String, Object> getAssignmentReg(int assignmentNo) {
		log.debug(TeamColor.BJH + "assignment수정폼(service) > " + assignmentNo);
		
		Map<String, Object> updateOne = assignmentMapper.selectStudentAssignmentOne(assignmentNo);
		log.debug(TeamColor.BJH + "updateOne (service) > " + updateOne);
		return updateOne;
	}
	
	//과제 수정 액션
	 public int modifyStudentAssignment(Map<String, Object> map) {
		
		//log.debug(TeamColor.BJH + "map studentYear ==> " + map.get("studentYear"));
		int row = assignmentMapper.updateStudentAssignment(map);
		log.debug(TeamColor.BJH + "updateStudentAssignment 수정액션(service) > " + map);
	
	    return row;
	}
		    

	//과제 삭제
    public int removeAssignmentReg(int assignmentRegNo) {
        return assignmentMapper.deleteStudentAssignmentReg(assignmentRegNo);
    }
	
	
}
