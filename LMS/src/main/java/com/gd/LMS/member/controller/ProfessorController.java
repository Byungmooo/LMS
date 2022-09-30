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
import com.gd.LMS.department.service.DepartmentService;
import com.gd.LMS.member.service.ProfessorService;
import com.gd.LMS.vo.Member;
import com.gd.LMS.vo.Professor;
import com.gd.LMS.vo.Student;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class ProfessorController {
	@Autowired ProfessorService professorService;
	@Autowired DepartmentService departmentService;

    
    
	// 교수 리스트
	@GetMapping("/employee/professorList")
	public String ProfessorList(Model model){
	
	log.debug(TeamColor.BJH + " professorList 담겼음");
	
	List<Map<String, Object>> list = professorService.getProfessorList();
	log.debug(TeamColor.BJH + " getProfessorList 담겼음" + list);
	                
	 model.addAttribute("list", list);
     log.debug(TeamColor.BJH + " model에 리스트 담음" +list);
	 
     return "member/professor/professorList";
	
	}

	
	
	//교수 상세보기
	@GetMapping({"/employee/studentOne", "/professor/professorOne"})
	public String ProfessorOne(Model model, @RequestParam(value = "memberCode") int professorCode) {
		log.debug(TeamColor.BJH + "welcome");
			
		Map<String, Object> professorOne = professorService.getProfessorOne(professorCode);
		log.debug(TeamColor.BJH + "professorOne controller" + professorCode);
		
		model.addAttribute("p", professorOne);
		
		log.debug(TeamColor.BJH + " 교수 상세보기");
		return "professor/professorOne";
	
	}
	
	//교수정보 수정 폼
    @GetMapping("/employee/modifyProfessor")
    public String modifyProfessor(Model model, @RequestParam(value = "professorCode") int professorCode) {
    	
    	log.debug(TeamColor.BJH + professorCode+"professorCode 보내기");
    	Map<String, Object> updateOne = professorService.getProfessor(professorCode);
    
		model.addAttribute("s", updateOne);
    	log.debug(TeamColor.BJH + updateOne+"professorCode 담아서 보내기");
    	
    	return "professor/modifyProfessor";
    }

    
  
    // 교수정보 수정 액션
    @PostMapping("/employee/modifyProfessorAction")
    public String modifyprofessorAction(Model model, Map<String, Object> map, 
    		Member member, Professor professor, @RequestParam(value = "professorCode") int professorCode) {
    	log.debug(TeamColor.BJH + this.getClass() + "액션 창 들어왔나?");
    	
    	map.put("professorCode", professorCode);
    	map.put("departmentCode", professor.getDepartmentCode());    	
    	map.put("departmentLeader", professor.getDepartmentLeader());
    	map.put("professorState", professor.getProfessorState());
    	map.put("memberName", member.getMemberName());
    	map.put("memberGender", member.getMemberGender());
    	map.put("memberType", member.getMemberType());
    	map.put("memberBirth", member.getMemberBirth());
    	map.put("memberEmail", member.getMemberEmail());
    	map.put("memberAddress", member.getMemberAddress());
    	map.put("memberContact", member.getMemberContact());
    	
    	
    	log.debug(TeamColor.BJH + this.getClass() + map);
    	
    	int count = professorService.modifyProfessor(map);
    		if (count != 0) {
    			log.debug(TeamColor.BJH + " 교수정보 수정성공");
    			return "redirect:professorOne?professorCode="+professorCode;
    		}
    	
    	return "redirect:modifyProfessor?professorCode="+professorCode;
    }
    
    
    //교수 삭제
    @PostMapping("/employee/removeProfessorMember")
    public String removeProfessorMember(@RequestParam (value= "memberId") String memberId) {
    	
    	professorService.removeProfessorMember(memberId);
    
    	log.debug(TeamColor.BJH + memberId+"<====  교수정보 + 멤버정보 삭제성공");
    	return "redirect:/member/professor/professorList";
    					
    }
    
}

		