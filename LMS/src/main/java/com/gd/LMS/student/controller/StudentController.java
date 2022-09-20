package com.gd.LMS.student.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.student.service.StudentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StudentController {
	@Autowired StudentService studentService;
	
	// 학생이 수강중인 강의리스트
	@GetMapping("/student/studentLectureList")
	public String studentLectureList(Model model, @RequestParam (value = "memberCode") int memberCode) {
		log.debug(TeamColor.LCH + "--- studentLectureList Controller GetMapping ---");
		
		// 학생코드 추후 수정예정
		// int studentCode = 10;
		
		// 학생수강리스트 메서드 호출 후 리턴값 디버깅
		List<Map<String, Object>> studentLectureList = studentService.getStudentLectureList(memberCode);
		log.debug(TeamColor.LCH + "studentLectureList (controller) > " + studentLectureList);
		
		model.addAttribute("list", studentLectureList);
		
		return "student/studentLectureList";
	}
	
	// 학생이 수강중인 강의 상세보기
	@GetMapping("/student/studentLectureOne")
	public String studentLectureOne(Model model, @RequestParam (value = "openedLecNo") int openedLecNo) {
		log.debug(TeamColor.LCH + "--- studentLectureOne Controller GetMapping ---");
		
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "openedLecNo (controller) > " + openedLecNo);
		
		// 학생수강리스트 메서드 호출 후 리턴값 디버깅
		Map<String, Object> studentLectureOne = studentService.getStudentLectureOne(openedLecNo);
		log.debug(TeamColor.LCH + "studentLectureOne (controller) > " + studentLectureOne);
		
		model.addAttribute("map", studentLectureOne);
		
		return "student/studentLectureOne";
	}
	
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
		List<Map<String, Object>> studentAssignmentList = studentService.getStudentAssignmentList(paramMap);
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
		Map<String, Object> studentAssignmentOne = studentService.getStudentAssignmentOne(assignmentNo);
		log.debug(TeamColor.LCH + "studentAssignmentOne (controller) > " + studentAssignmentOne);
		
		model.addAttribute("map", studentAssignmentOne);
		
		return "student/studentAssignmentOne";
	}
}
