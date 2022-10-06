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
   public List<Map<String, Object>>  getAssignmentList(Map<String,Object> map) {
      // 디버깅 영역구분
      log.debug(TeamColor.BJH + "전체 과제(교수)리스트 서비스 진입========");
      
      return assignmentMapper.selectAssignmentList(map);
   } 
   
   // 과제 게시글수
	public int getAssignmentCount(Map<String, Object> map) {
	// 파라미터 디버깅
	 log.debug(TeamColor.BJH + "과제 총 게시글수 서비스 진입========");

		return assignmentMapper.selectAssignmentCount(map);
	}
    
   //제출한 과제 상세보기
 	public Map<String, Object> getAssignmentOne(int assignmentNo) {
 		// 디버깅 영역구분
 		log.debug(TeamColor.BJH+ "상세보기 서비스 진입===========");
 		Map<String, Object> One = assignmentMapper.selectAssignmentOne(assignmentNo);
 		return One;
 	} 

 	
	// 과제 출제(추가)
	public int addAssignment(Assignment assignment) {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "과제 추가(교수) 서비스 진입========");
		// 파라미터 디버깅
		log.debug(TeamColor.BJH + assignment + "<-- assignment 객체 담기");

		int key = assignmentMapper.insertAssignment(assignment);
		log.debug(TeamColor.BJH + "key > " + key);
		
		
		return key;
	} 

	
	// 출제(교수) 과제 수정 
	public int modifyAssignment(Assignment assignment) {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "과제 수정(교수) 서비스 진입=========");
		
		return assignmentMapper.updateAssignment(assignment);
	} 
	
	
	//과제 삭제
	public int removeAssignment(int openedLecNo) {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "과제 삭제(교수) 서비스 진입==========");
		// 파라미터 디버깅
		log.debug(TeamColor.BJH + openedLecNo + "<-- openedLecNo");

		return assignmentMapper.deleteAssignment(openedLecNo);
	} 
	
	
}
