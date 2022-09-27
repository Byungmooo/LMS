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
import com.gd.LMS.vo.Assignment;
import com.gd.LMS.vo.AssignmentReg;
import com.gd.LMS.vo.AssignmentRegForm;
import com.gd.LMS.vo.AssignmentRegImg;
import com.gd.LMS.vo.OpenedLecture;
import com.gd.LMS.vo.TotalLecture;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class AssignmentService {
	@Autowired AssignmentMapper assignmentMapper; //과제
	
	

	//전체과제리스트 조회
   public List<Assignment> getAssignmentList(int openedLecNo) {
      // 디버깅 영역구분
      log.debug(TeamColor.BJH + "@getAssignmentList Service");

      // ReportMapper 실행
      List<Assignment> assignmentList = assignmentMapper.selectAssignmentList(openedLecNo);
      // 디버깅
      log.debug(TeamColor.BJH + assignmentList + "<-- assignmentList");
      
      return assignmentList;
   } 
   
	
	// 과제 제출(추가)
	public int addAssignment(Assignment assignment) {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "assignment Service");
		// 파라미터 디버깅
		log.debug(TeamColor.BJH + assignment + "<-- assignment");

		// Mapper call
		int addssignment = assignmentMapper.insertAssignment(assignment);
		// Mapper에서 받아온 assignment  디버깅
		log.debug(TeamColor.BJH + addssignment + "<-- addssignment");

		return addssignment;
	} 

	
	//제출한 과제 수정 폼
	public Assignment getAssignmentOne(int assignmentNo) {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH+ "getAssignmentOne Service");
		// 파라미터 디버깅
		log.debug(TeamColor.BJH + assignmentNo + "<-- assignmentNo");

		// Mapper call
		Assignment getAssignmentOne = assignmentMapper.selectAssignmentOne(assignmentNo);
		// Mapper에서 받아온 assignmentNo 값 디버깅
		log.debug(TeamColor.BJH + getAssignmentOne + "<-- getAssignmentOne");

		return getAssignmentOne;
	} 

	
	
	//제출한 과제 수정 액션
	public int modifyAssignment(Assignment assignment) {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "modifyAssignment Service");
		// 파라미터 디버깅
		log.debug(TeamColor.BJH + assignment + "<-- assignment");
		// Mapper call
		int modifyAssignment = assignmentMapper.updateAssignment(assignment);
		// Mapper에서 받아온 assignmentNo 값 디버깅
		log.debug(TeamColor.BJH + modifyAssignment + "<-- modifyAssignment");

		return modifyAssignment;
	} 
	
	
	
	//과제 삭제
	public int removeAssignment(int assignmentNo) {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "removeAssignment Service");
		// 파라미터 디버깅
		log.debug(TeamColor.BJH + assignmentNo + "<-- assignmentNo");

		// Mapper call
		int removeAssignment = assignmentMapper.deleteAssignment(assignmentNo);
		// Mapper에서 받아온 assignmentNo 값 디버깅
		log.debug(TeamColor.BJH + removeAssignment + "<-- deleteAssignment");

		return removeAssignment;
	} 
	
	
	
	
	
	
	
	
	
	
	
	/*
	
	
	
	
	
	
	
	
	
	/*
	
	
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
	
    */
	
}
