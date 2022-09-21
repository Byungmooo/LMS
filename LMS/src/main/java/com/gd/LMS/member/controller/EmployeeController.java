package com.gd.LMS.member.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.employee.Service.EmployeeService;
import com.gd.LMS.student.service.StudentService;
import com.gd.LMS.vo.Employee;
import com.gd.LMS.vo.Student;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmployeeController {
	@Autowired EmployeeService employeeService;
	
	/////////////////////////////// 직원 리스트 + 상세보기
    // 전체직원 리스트
    @GetMapping(value = "/employeeList")
    public String EmployeeList(Model model){
    	
    	log.debug(TeamColor.BJH + " EmployeeList 담겼음");
    	
        List<Employee> list = employeeService.getEmployeeList();
    	log.debug(TeamColor.BJH + " getEmployeeList 담겼음");
    	
        model.addAttribute("list", list);
        log.debug(TeamColor.BJH + " model list 모델에 담김");
        
        return "employeeList";
  
    }
    
    
    @GetMapping("/employeeOne")
    public String EmployeeOne(Model model, @RequestParam(value = "employeeCode") int employeeCode) {
       
    	log.debug(TeamColor.BJH + " [지혜] EmployeeOne controller");
    	// 파라미터 디버깅
    	log.debug(TeamColor.BJH + "[지혜]  employeeCode controller" + employeeCode);
    			
    	Map<String, Object> EmployeeOne= employeeService.getEmployeeOne(employeeCode);
    	log.debug(TeamColor.BJH + "[지혜]  EmployeeOne controller" + EmployeeOne);
    	
    	model.addAttribute("e", EmployeeOne);
        
        log.debug(TeamColor.BJH + " [지혜] 직원 상세보기");
        return "employeeOne";
   
    }
	
    	// 학생 리스트
 		@GetMapping("/studentList")
 		public String StudentList(Model model){
 		
 		log.debug(TeamColor.BJH + " studentList 담겼음");
 		
 		List<Map<String, Object>> list = studentService.getStudentList();
 		log.debug(TeamColor.BJH + " getStudentList 담겼음");
 		
 		model.addAttribute("list", list);
 		log.debug(TeamColor.BJH + " model list 모델에 담김");
 		
 		return "studentList";
 		
 		}
 		
 		
 		
 				
 		//학생 상세보기
 		@GetMapping("/studentOne")
 		public String StudentOne(Model model, @RequestParam(value = "studentCode") int studentCode) {
 		
 		log.debug(TeamColor.BJH + " [지혜] StudentOne controller");
 		// 파라미터 디버깅
 		log.debug(TeamColor.BJH + "[지혜]  studentCode controller" + studentCode);
 		
 		Map<String, Object> StudentOne= studentService.getStudentOne(studentCode);
 		log.debug(TeamColor.BJH + "[지혜]  StudentOne controller" + StudentOne);
 		
 		model.addAttribute("s", StudentOne);
 		
 		log.debug(TeamColor.BJH + " [지혜] 직원 상세보기");
 		return "studentOne";
 		
 		}

	}
