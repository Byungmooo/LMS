package com.gd.LMS.member.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.member.service.StudentService;
import com.gd.LMS.vo.Student;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class StudentController {
	@Autowired StudentService studentService;
	

    ////////////////////////학생
    
 // 학생 리스트
 		@GetMapping("/member/student/studentList")
 		public String StudentList(Model model){
 		
 		log.debug(TeamColor.BJH + " studentList 담겼음");
 		
 		List<Map<String, Object>> list = studentService.getStudentList();
 		log.debug(TeamColor.BJH + " getStudentList 담겼음" + list);
 		                
 		 model.addAttribute("list", list);
 	     log.debug(TeamColor.BJH + " model에 리스트 담음" +list);
 		 
         return "member/student/studentList";
 		
 		}
 		
 		//학생 상세보기
 		@GetMapping("/member/student/studentOne")
 		public String StudentOne(Model model, @RequestParam(value = "studentCode") int studentCode) {
 		log.debug(TeamColor.BJH + "welcome");
 			
 		Map<String, Object> studentOne = studentService.getStudentOne(studentCode);
 		log.debug(TeamColor.BJH + "StudentOne controller" + studentCode);
 		
 		model.addAttribute("s", studentOne);
 		
 		log.debug(TeamColor.BJH + " 학생 상세보기");
 		return "member/student/studentOne";
 		
 		}
 		
 		
 		//학생정보 수정 폼
 	    @GetMapping("/member/student/modifyStudent")
 	    public String modifyStudent(Model model, @RequestParam(value= "studentCode") int studentCode) {
 	    	
 	    	log.debug(TeamColor.BJH + studentCode+"studentCode 보내기");
 	    	Map<String, Object> studentOne = studentService.getStudentOne(studentCode);
 	    	
 	    	model.addAttribute("studentOne", studentOne);
 	    	log.debug(TeamColor.BJH + studentOne+"studentCode 담아서 보내기");
 	        return "member/student/modifyStudent";
 	    }

 	    // 학생정보 수정 액션
 	    @PostMapping("/member/student/modifyStudent")
 	    public String modifyStudent(Student student) {
 	    	
 	        int count = studentService.modifyStudent(student);
 	        log.debug(TeamColor.BJH +  student + "확인" );
 	        if (count < 1) {
 	        	log.debug(TeamColor.BJH + " 학생정보 업로드");
 	            return "redirect:/member/student/studentList";
 	        }
 	        return "redirect:/member/student/modifyStudent/"+student.getStudentCode();
 	    }
    

}
