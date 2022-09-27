package com.gd.LMS.assignment.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.eclipse.sisu.Parameters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.LMS.assignment.service.AssignmentService;
import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.vo.Assignment;
import com.gd.LMS.vo.AssignmentReg;
import com.gd.LMS.vo.Employee;
import com.gd.LMS.vo.LectureNotice;
import com.gd.LMS.vo.Member;
import com.gd.LMS.vo.OpenedLecture;
import com.gd.LMS.vo.TotalNotice;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AssignmentController {
	@Autowired AssignmentService assignmentService;
	
	// 학생이 수강중인 한 강의 과제리스트
	@GetMapping("/student/openedAssignmentList")
	public String openedAssignmentList(Model model, Map<String, Object> paramMap, 
			@RequestParam (value = "openedLecNo") int openedLecNo,
			@RequestParam (value = "studentCode") int studentCode) {
		log.debug(TeamColor.LCH + "--- openedAssignmentList Controller GetMapping ---");
		
		// 파라미터 디버깅openedLecNo
		paramMap.put("openedLecNo", openedLecNo);
		paramMap.put("studentCode", studentCode);
		log.debug(TeamColor.LCH + "paramMap (controller) > " + paramMap);
		
		// 학생과제리스트 메서드 호출 후 리턴값 디버깅
		List<Map<String, Object>> openedAssignmentList = assignmentService.getStudentAssignmentList(paramMap);
		log.debug(TeamColor.LCH + "studentAssignmentList (controller) > " + openedAssignmentList);
		
		model.addAttribute("list", openedAssignmentList);
		
		return "assignment/openedAssignmentList";
	}
	
	// 학생이 수강중인 강의 과제 상세보기
	@GetMapping("/student/openedAssignmentOne")
	public String openedAssignmentOne(Model model, @RequestParam (value = "assignmentNo") int assignmentNo) {
		log.debug(TeamColor.LCH + "--- openedAssignmentOne Controller GetMapping ---");
		
		// 파라미터 디버깅openedLecNo
		log.debug(TeamColor.LCH + "assignmentNo (controller) > " + assignmentNo);
		
		// 메서드 호출 후 리턴값 디버깅
		Map<String, Object> openedAssignmentOne = assignmentService.getStudentAssignmentOne(assignmentNo);
		log.debug(TeamColor.LCH + "studentAssignmentOne (controller) > " + openedAssignmentOne);
		
		model.addAttribute("map", openedAssignmentOne);
		
		return "assignment/openedAssignmentOne";
	}
	
	//과제 추가폼
	@GetMapping("/student/addAssignment")
	public String addAssignment(Model model, @RequestParam (value = "studentCode") int studentCode) {
		Map<String, Object> map = assignmentService.addAssignmentForm(studentCode);
		model.addAttribute("list", map.get("list"));
		
		return "assignment/addAssignment";
	}
	//과제 추가 액션
	@PostMapping("/addAssignment")
	public String addAssignment(Assignment assignment) {
		
		log.debug(TeamColor.BJH + assignment +"<-----assignment");
		assignmentService.addAssignmentAction(assignment);
		
		return "redirect:/openedAssignmentList";
	}
			
		
	
	 //직원정보 수정 폼
    @GetMapping("/assignment/modifyAssignment")
    public String modifyAssignment(Model model, @RequestParam(value = "assignmentNo") int assignmentNo) {
    	
    	log.debug(TeamColor.BJH + assignmentNo+"assignmentNo 보내기");
    	Map<String, Object> updateOne = assignmentService.getAssignmentReg(assignmentNo);
    
		model.addAttribute("a", updateOne);
    	log.debug(TeamColor.BJH + updateOne+"assignmentNo 담아서 보내기");
    	
    	return "assignment/modifyAssignment";
    }

    
  
    // 직원정보 수정 액션
    @PostMapping("/modifyAssignmentAction")
    public String modifyAssignmentAction(Model model, Map<String, Object> map, 
    		AssignmentReg assignmentReg,Assignment assignment, OpenedLecture openedLecture ,
    		@RequestParam(value = "assignmentNo") int assignmentNo) {
    	log.debug(TeamColor.BJH + this.getClass() + "액션 창 들어왔나?");
    	
    	map.put("assignmentTitle", assignment.getAssignmentTitle());
    	map.put("assignmentContent" ,assignment.getAssignmentContent());
    	map.put("endDate", assignment.getEndDate());
    	map.put("assignmentScore", assignmentReg.getAssignmentScore());
    	log.debug(TeamColor.BJH + this.getClass() + map);
    	
    	int count = assignmentService.modifyStudentAssignment(map);
    		if (count != 0) {
    			log.debug(TeamColor.BJH + " 과제 수정성공");
    			return "redirect:studentAssignmentOne?assignmentNo="+assignmentNo;
    		}
    	
    	return "redirect:modifyAssignment?assignmentNo="+assignmentNo;
    }
    
	
	
    //과제 삭제
    @PostMapping("/removeAssignmentReg")
    public String removeAssignmentReg(@RequestParam (value= "assignmentNo") int assignmentNo) {
    	
    	assignmentService.removeAssignmentReg(assignmentNo);
    
    	log.debug(TeamColor.BJH + assignmentNo+"<====  과제삭제성공");
    	return "redirect:/studentAssignmentList";
    					
    }
	
	
	
	
	

}
