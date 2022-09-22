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
import com.gd.LMS.member.service.EmployeeService;
import com.gd.LMS.vo.Student;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmployeeController {
	@Autowired EmployeeService employeeService;
	
	
	/////////////////////////////// 직원 리스트 + 상세보기
    // 전체직원 리스트
    @GetMapping(value = "/member/employee/employeeList")
    public String EmployeeList(Model model){
    	
    	log.debug(TeamColor.BJH + " EmployeeList 담겼음");
    	
        List<Map<String,Object>> list = employeeService.getEmployeeList();
    	log.debug(TeamColor.BJH + " getEmployeeList 담겼음");
    	
        model.addAttribute("list", list);
        log.debug(TeamColor.BJH + " model list 모델에 담김");
        
        return "member/employee/employeeList";
  
    }
    
    
    @GetMapping("/member/employee/employeeOne")
    public String EmployeeOne(Model model, @RequestParam(value = "employeeCode") int employeeCode) {
       
    	log.debug(TeamColor.BJH + "[지혜]  employeeCode controller" + employeeCode);
    			
    	Map<String, Object> EmployeeOne= employeeService.getEmployeeOne(employeeCode);
    	log.debug(TeamColor.BJH + "[지혜]  EmployeeOne controller" + EmployeeOne);
    	
    	model.addAttribute("e", EmployeeOne);
        
        log.debug(TeamColor.BJH + " [지혜] 직원 상세보기");
        return "member/employee/employeeOne";
   
    }
	
    
}
