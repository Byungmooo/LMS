package com.gd.LMS.lecture.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.lecture.service.LectureService;
import com.gd.LMS.vo.LectureQuestion;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LectureController {
	@Autowired LectureService lectureService;
	
	// 학생이 수강중인 강의리스트
	@GetMapping("/student/studentLectureList")
	public String studentLectureList(Model model, @RequestParam (value = "memberCode") int memberCode) {
		log.debug(TeamColor.LCH + "--- studentLectureList Controller GetMapping ---");
		
		// 학생코드 추후 수정예정
		// int studentCode = 10;
		
		// 학생수강리스트 메서드 호출 후 리턴값 디버깅
		List<Map<String, Object>> studentLectureList = lectureService.getStudentLectureList(memberCode);
		log.debug(TeamColor.LCH + "studentLectureList (controller) > " + studentLectureList);
		
		model.addAttribute("list", studentLectureList);
		
		return "lecture/studentLectureList";
	}
	
	// 강의 상세보기
	@GetMapping("/student/openedLectureOne")
	public String openedLectureOne(Model model, @RequestParam (value = "openedLecNo") int openedLecNo) {
		log.debug(TeamColor.LCH + "--- openedLectureOne Controller GetMapping ---");
		
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "openedLecNo (controller) > " + openedLecNo);
		
		// 학생수강리스트 메서드 호출 후 리턴값 디버깅
		Map<String, Object> openedLectureOne = lectureService.getOpenedLectureOne(openedLecNo);
		log.debug(TeamColor.LCH + "openedLectureOne (controller) > " + openedLectureOne);
		
		model.addAttribute("map", openedLectureOne);
		
		return "lecture/openedLectureOne";
	}
	
	// 강의 질문 리스트
	@GetMapping("/student/lectureQuestionList")
	public String lectureQuestionList(Model model,
			@RequestParam (value = "openedLecNo") int openedLecNo) {
		log.debug(TeamColor.LCH + "--- lectureQuestionList Controller GetMapping ---");
		
		log.debug(TeamColor.LCH + "openedLecNo > " + openedLecNo);
		
		List<LectureQuestion> lectureQuestionList = lectureService.getLectureQuestionList(openedLecNo);
		
		log.debug(TeamColor.LCH + "lectureQuestionList > " + lectureQuestionList);
		
		model.addAttribute("question", lectureQuestionList);
		
		return "lecture/lectureQuestionList";
	}
	
	// 강의 질문 상세보기
	@GetMapping("/student/lectureQuestionOne")
	public String lectureQuestionOne(Model model,
			@RequestParam (value = "lecQuestionNo") int lecQuestionNo) {
		log.debug(TeamColor.LCH + "--- lectureQuestionOne Controller GetMapping ---");
		
		log.debug(TeamColor.LCH + "lecQuestionNo > " + lecQuestionNo);
		
		Map<String, Object> lectureQuestionOne = lectureService.getLectureQuestionOne(lecQuestionNo);
		
		log.debug(TeamColor.LCH + "lectureQuestionOne > " + lectureQuestionOne);
		
		model.addAttribute("question", lectureQuestionOne);
		
		return "lecture/lectureQuestionOne";
	}
}
