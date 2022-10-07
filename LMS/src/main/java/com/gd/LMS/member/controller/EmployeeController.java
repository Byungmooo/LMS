package com.gd.LMS.member.controller;

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

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.member.service.EmployeeService;
import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.Employee;
import com.gd.LMS.vo.Member;
import com.gd.LMS.vo.Student;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmployeeController {
	@Autowired EmployeeService employeeService;
	
	
    // 전체직원 리스트
    @GetMapping("/employee/employeeList")
    public String getEmployeeList(PagingVo vo, Model model, HttpSession session,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "rowPerPage", defaultValue = "5") int rowPerPage,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "searchType", defaultValue = "") String searchType) {
    	
    	
    	Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword); 
		map.put("searchType", searchType);

		
		int totalCount = employeeService.countEmployee(map);
		log.debug(TeamColor.BJH + "current/rowPer/total : " + currentPage + "/" + rowPerPage + "/" + totalCount);


        vo = new PagingVo(currentPage, totalCount, rowPerPage, keyword, searchType);
        // 이전 페이지 시작 글 번호와 현재 변경되는 페이지의 시작 글번호에 대한 일치 시키는거 많은 변경이 필요하므로 그냥 1로 처리함
        if(vo.getBeginRow() >= totalCount){
            vo = new PagingVo(1, totalCount, rowPerPage, keyword, searchType);
        }
		log.debug(TeamColor.BJH + "PagingVo : " + vo);

		map.put("beginRow", vo.getBeginRow());
		map.put("rowPerPage", vo.getRowPerPage());

		log.debug(TeamColor.BJH + "beginRow, rowPerPage > " + map);


		List<Map<String,Object>> list = employeeService.selectEmployeeList(map);
    	log.debug(TeamColor.BJH + " getEmployeeList 담겼음");
    	
    	
		model.addAttribute("paging", vo);
		model.addAttribute("list", list);

		log.debug(TeamColor.BJH + "학부 전체 리스트");
        
        return "member/employee/employeeList";
  
    }
    
    
    //직원상세보기
    @GetMapping("/employee/employeeOne")
    public String EmployeeOne(Model model, 
    		@RequestParam(value = "employeeCode") int employeeCode) {
       
    	log.debug(TeamColor.BJH + "직원 상세보기 controller진입=========" + employeeCode);
    			
    	Map<String, Object> map= employeeService.getEmployeeOne(employeeCode);
    	model.addAttribute("e", map);
        
    	log.debug(TeamColor.BJH + "map에 직원정보 담아서 보내기" + map);
    	
    	
        return "member/employee/employeeOne";
   
    }
	
    //직원정보 수정 폼
    @GetMapping("/employee/modifyEmployee")
    public String modifyEmployee(Model model, @RequestParam(value = "employeeCode") int employeeCode) {

		log.debug(TeamColor.BJH + "직원수정 페이지서비스 진입=======employeeCode========>" + employeeCode);
    	Map<String, Object> updateOne = employeeService.getEmployeeOne(employeeCode);
    
		model.addAttribute("e", updateOne);
		log.debug(TeamColor.BJH + "직원 수정 페이지 이동");
    	
    	return "member/employee/modifyEmployee";
    }
    
  
    // 직원정보 수정 액션
    @PostMapping("/employee/modifyEmployeeAction")
    public String modifyEmployeeAction(Model model, Map<String, Object> map, 
    		Member member, Employee employee, 
    		@RequestParam(value = "employeeCode") int employeeCode) {
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
    	
    	
    	log.debug(TeamColor.BJH + "modifyEmployeeAction에 정보 담기>>>>>"+ map);
    	
    	int count = employeeService.modifyEmployee(map);
    		if (count != 0) {
    			log.debug(TeamColor.BJH + " 직원정보 수정성공");
    			return "redirect:employeeOne?employeeCode="+employeeCode;
    		}
    	
    	return "redirect:employeeOne?employeeCode="+employeeCode;
    }
    
    
    //직원 삭제
    @GetMapping("/employee/removeEmployeeMember")
    public String removeEmployeeMember(@RequestParam (value= "memberId") String memberId) {
    	
    	employeeService.removeEmployeeMember(memberId);
    
    	log.debug(TeamColor.BJH + memberId+"<====  학생정보 + 멤버정보 삭제성공");
    	return "redirect:employeeList";
    					
    }
}
