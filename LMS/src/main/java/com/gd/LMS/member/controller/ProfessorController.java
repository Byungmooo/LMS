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
import com.gd.LMS.department.service.DepartmentService;
import com.gd.LMS.member.service.ProfessorService;
import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.Employee;
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
	@GetMapping({"/employee/professorList", "/professor/professorList"})
	public String ProfessorList(PagingVo vo, Model model, HttpSession session,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "searchType", defaultValue = "") String searchType) {
    	
		Map<String, Object> map = new HashMap<>();
    	
		
		int totalCount = professorService.countProfessor(map);
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

		List<Map<String, Object>> list = professorService.getProfessorList(map);
    	log.debug(TeamColor.BJH + " 교수리스트 담겼음>>>>>" + list);
    	
    	
		model.addAttribute("paging", vo);
		model.addAttribute("list", list);

		log.debug(TeamColor.BJH + "교수 전체 리스트");
				
	     return "member/professor/professorList";
		
		}

	
	
	//교수 상세보기
	@GetMapping({"/employee/professorOne", "/professor/professorOne"})
	public String ProfessorOne(Model model,HttpSession session,
			@RequestParam(value = "professorCode") int professorCode) {
		
		log.debug(TeamColor.BJH + "교수 상세보기 controller 진입===========");
			
		Map<String, Object> professorOne = professorService.getProfessorOne(professorCode);
		model.addAttribute("p", professorOne);
		log.debug(TeamColor.BJH + "map에 교수정보 담아서 보내기" + professorCode);
		
		return "member/professor/professorOne";
	
	}
	
	//교수정보 수정 폼
    @GetMapping("/employee/modifyProfessor")
    public String modifyProfessor(Model model, @RequestParam(value = "professorCode") int professorCode) {
    	
    	log.debug(TeamColor.BJH + "교수정보 페이지서비스 진입=======professorCode========>" + professorCode);
    	Map<String, Object> updateOne = professorService.getProfessor(professorCode);
    
		model.addAttribute("p", updateOne);
		log.debug(TeamColor.BJH + "교수정보 수정 페이지 이동");
    	
    	return "member/professor/modifyProfessor";
    }

    
  
    // 교수정보 수정 액션
    @PostMapping("/employee/modifyProfessor")
    public String modifyprofessor(Model model, 
    		Member member, Professor professor, 
    		@RequestParam(value = "professorCode") int professorCode) {
    	log.debug(TeamColor.BJH + "교수 정보 수정액션 professorCode 실행===========" +professorCode);
    	
    	Map<String, Object> map = new HashMap<>();
    	
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
    	
    	
    	log.debug(TeamColor.BJH + "map에 담아서 보내기>>>>>" + map);
    	
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
    	return "redirect:professor/professorList";
    					
    }
    
}

		