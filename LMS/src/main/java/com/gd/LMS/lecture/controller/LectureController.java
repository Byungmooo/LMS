package com.gd.LMS.lecture.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.lecture.service.LectureService;
import com.gd.LMS.schedule.service.ScheduleService;
import com.gd.LMS.utils.LectureListVo;
import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.Attendance;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LectureController {
	@Autowired LectureService lectureService;
	@Autowired ScheduleService scheduleService;

	// 학생이 수강중인 강의리스트
	@GetMapping("/student/studentLectureList")
	public String studentLectureList(Model model, HttpSession session,
			@RequestParam(value = "memberCode") int memberCode) {
		log.debug(TeamColor.LCH + "--- studentLectureList Controller GetMapping ---");

		// 학생수강리스트 메서드 호출 후 리턴값 디버깅
		List<Map<String, Object>> studentLectureList = lectureService.getStudentLectureList(memberCode);
		log.debug(TeamColor.LCH + "studentLectureList (controller) > " + studentLectureList);

		session.setAttribute("memberCode", memberCode);
		model.addAttribute("list", studentLectureList);
		return "lecture/studentLectureList";
	}

	// 교수가 진행중인 강의리스트
	@GetMapping("/professor/professorLectureList")
	public String professorLectureList(Model model, HttpSession session,
			@RequestParam(value = "memberCode") int memberCode) {
		log.debug(TeamColor.LCH + "--- professorLectureList Controller GetMapping ---");

		// 교수진행강의리스트 메서드 호출 후 리턴값 디버깅
		List<Map<String, Object>> professorLectureList = lectureService.getProfessorLectureList(memberCode);
		log.debug(TeamColor.LCH + "professorLectureList (controller) > " + professorLectureList);

		session.setAttribute("memberCode", memberCode);
		model.addAttribute("list", professorLectureList);
		return "lecture/professorLectureList";
	}
	
	// 강의 상세보기
	@GetMapping({"/professor/openedLectureOne", "/student/openedLectureOne"})
	public String openedLectureOne(Model model, @RequestParam(value = "openedLecNo") int openedLecNo,
			HttpSession session) {
		log.debug(TeamColor.LCH + "--- openedLectureOne Controller GetMapping ---");

		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "openedLecNo (controller) > " + openedLecNo);

		// 학생수강리스트 메서드 호출 후 리턴값 디버깅
		Map<String, Object> openedLectureOne = lectureService.getOpenedLectureOne(openedLecNo);
		log.debug(TeamColor.LCH + "openedLectureOne (controller) > " + openedLectureOne);

		model.addAttribute("map", openedLectureOne);
		session.setAttribute("lectureName", openedLectureOne.get("lectureName"));
		session.setAttribute("openedLecNo", openedLecNo);
		return "lecture/openedLectureOne";
	}	

	
	
	// 지울거임
	@GetMapping("/result")
	public String resultPage() {
		return "resultPage";
	}

}
