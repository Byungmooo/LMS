package com.gd.LMS.student.Controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.student.Service.StudentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StudentController {
	@Autowired StudentService studentService;
	
	@GetMapping("/student/studentLectureList")
	public String studentLectureList(Model model) {
		log.debug(TeamColor.LCH + " <-- studentLectureList (Controller)");
		
		int studentCode = 10;
		
		List<Map<String, Object>> studentLectureList = studentService.getStudentLectureList(studentCode);
		
		model.addAttribute("list", studentLectureList);
		log.debug(TeamColor.LCH + model.getAttribute("list") + " <-- studentLectureList (Controller)");
		
		return "student/studentLectureList";
	}
	
	@GetMapping("/student/studentLectureOne")
	public String studentLectureOne(Model model, @RequestParam (value = "openedLecNo") int openedLecNo) {
		log.debug(TeamColor.LCH + " <-- studentLectureOne (Controller)");
		
		log.debug(TeamColor.LCH + openedLecNo + " <-- openedLecNo (Controller)");
		
		Map<String, Object> studentLectureOne = studentService.getStudentLectureOne(openedLecNo);
		
		model.addAttribute("map", studentLectureOne);
		
		return "student/studentLectureOne";
	}
	
	@GetMapping("/student/studentAssignmentList")
	public String studentAssignmentList(Model model, @RequestParam (value = "openedLecNo") int openedLecNo) {
		log.debug(TeamColor.LCH + openedLecNo + " <-- openedLecNo (Controller)");
		
		List<Map<String, Object>> studentAssignmentList = studentService.getAssignmentList(openedLecNo);
		
		model.addAttribute("list", studentAssignmentList);
		
		return "student/studentAssignmentList";
	}
}
