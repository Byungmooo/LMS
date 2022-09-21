package com.gd.LMS.assignment.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.LMS.assignment.service.AssignmentService;
import com.gd.LMS.commons.TeamColor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AssignmentController {
	@Autowired AssignmentService assignmentService;
	
	// 학생이 수강중인 한 강의 과제리스트
	@GetMapping("/student/studentAssignmentList")
	public String studentAssignmentList(Model model, Map<String, Object> paramMap, 
			@RequestParam (value = "openedLecNo") int openedLecNo,
			@RequestParam (value = "studentCode") int studentCode) {
		log.debug(TeamColor.LCH + "--- studentAssignmentList Controller GetMapping ---");
		
		// 파라미터 디버깅openedLecNo
		paramMap.put("openedLecNo", openedLecNo);
		paramMap.put("studentCode", studentCode);
		log.debug(TeamColor.LCH + "paramMap (controller) > " + paramMap);
		
		// 학생과제리스트 메서드 호출 후 리턴값 디버깅
		List<Map<String, Object>> studentAssignmentList = assignmentService.getStudentAssignmentList(paramMap);
		log.debug(TeamColor.LCH + "studentAssignmentList (controller) > " + studentAssignmentList);
		
		model.addAttribute("list", studentAssignmentList);
		
		return "student/studentAssignmentList";
	}
	
	// 학생이 수강중인 강의 과제 상세보기
	@GetMapping("/student/studentAssignmentOne")
	public String studentAssignmentOne(Model model, @RequestParam (value = "assignmentNo") int assignmentNo) {
		log.debug(TeamColor.LCH + "--- studentAssignmentOne Controller GetMapping ---");
		
		// 파라미터 디버깅openedLecNo
		log.debug(TeamColor.LCH + "assignmentNo (controller) > " + assignmentNo);
		
		// 메서드 호출 후 리턴값 디버깅
		Map<String, Object> studentAssignmentOne = assignmentService.getStudentAssignmentOne(assignmentNo);
		log.debug(TeamColor.LCH + "studentAssignmentOne (controller) > " + studentAssignmentOne);
		
		model.addAttribute("map", studentAssignmentOne);
		
		return "student/studentAssignmentOne";
	}
}
