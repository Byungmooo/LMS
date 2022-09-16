package com.gd.LMS.student.Controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.student.Service.StudentService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class StudentController {
	@Autowired StudentService studentService;
	
	@GetMapping("/student/studentLectureList")
	public String studentLectureList(Model model, String studentCode) {
		log.debug(TeamColor.LCH + " <-- studentLectureList (Controller)");
		
		List<Map<String, Object>> studentLectureList = studentService.getStudentLectureList(studentCode);
		
		model.addAttribute("list", studentLectureList);
		log.debug(TeamColor.LCH + model.getAttribute("list") + " <-- studentLectureList (Controller)");
		
		return "student/studentLectureList";
	}
}
