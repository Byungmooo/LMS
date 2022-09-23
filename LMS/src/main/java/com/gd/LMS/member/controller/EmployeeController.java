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
import com.gd.LMS.vo.Employee;
import com.gd.LMS.vo.Member;
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
	
    //직원정보 수정 폼
    @GetMapping("/member/employee/modifyEmployee")
    public String modifyEmployee(Model model, @RequestParam(value = "employeeCode") int employeeCode) {
    	
    	log.debug(TeamColor.BJH + employeeCode+"employeeCode 보내기");
    	Map<String, Object> updateOne = employeeService.getEmployee(employeeCode);
    
		model.addAttribute("e", updateOne);
    	log.debug(TeamColor.BJH + updateOne+"employeeCode 담아서 보내기");
    	
    	return "/member/employee/modifyEmployee";
    }

    
  
    // 직원정보 수정 액션
    @PostMapping("/member/employee/modifyEmployeeAction")
    public String modifyEmployeeAction(Model model, Map<String, Object> map, 
    		Member member, Employee employee, @RequestParam(value = "employeeCode") int employeeCode) {
    	log.debug(TeamColor.BJH + this.getClass() + "액션 창 들어왔나?");
    	
    	map.put("employeeCode", employeeCode);
    	map.put("authority" ,employee.getAuthority());
    	map.put("employeeState", employee.getEmployeeState());
    	map.put("memberName", member.getMemberName());
    	map.put("memberGender", member.getMemberGender());
    	map.put("memberType", member.getMemberType());
    	map.put("memberBirth", member.getMemberBirth());
    	map.put("memberEmail", member.getMemberEmail());
    	map.put("memberAddress", member.getMemberAddress());
    	map.put("memberContact", member.getMemberContact());
    	
    	
    	log.debug(TeamColor.BJH + this.getClass() + map);
    	
    	int count = employeeService.modifyEmployee(map);
    		if (count != 0) {
    			log.debug(TeamColor.BJH + " 직원정보 수정성공");
    			return "redirect:employeeOne?employeeCode="+employeeCode;
    		}
    	
    	return "redirect:modifyEmployee?employeeCode="+employeeCode;
    }
    
    
    //직원 삭제
    @PostMapping("/member/employee/removeEmployeeMember")
    public String removeEmployeeMember(@RequestParam (value= "memberId") String memberId) {
    	
    	employeeService.removeEmployeeMember(memberId);
    
    	log.debug(TeamColor.BJH + memberId+"<====  학생정보 + 멤버정보 삭제성공");
    	return "redirect:/member/employee/employeeList";
    					
    }
}
