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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.department.service.DepartmentService;
import com.gd.LMS.member.service.StudentService;
import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.Member;
import com.gd.LMS.vo.Student;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class StudentController {
	@Autowired StudentService studentService;

    ////////////////////////학생
    
	@GetMapping({"/employee/studentList", "/professor/professorList"})
	public String studentList(PagingVo vo, Model model, HttpSession session,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "searchType", defaultValue = "") String searchType) {
    	
		
		Map<String, Object> map = new HashMap<>();
		 
		
		int totalCount = studentService.countStudent(map);
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
		
		
		List<Map<String,Object>> list = studentService.getStudentList(map);
		log.debug(TeamColor.BJH + " 학생리스트 담겼음" + list);
		      
		model.addAttribute("paging", vo);
		model.addAttribute("list", list);

		log.debug(TeamColor.BJH + "학생 전체 리스트");
		 
	    return "member/student/studentList"; //뷰 페이지 경로 지정 
		
	}
	
	
	//학생 상세보기
	@GetMapping({"/employee/studentOne", "/student/studentOne"})
	public String StudentOne(Model model, @RequestParam(value = "studentCode") int studentCode) {
		log.debug(TeamColor.BJH + "학생 상세보기 controller 진입===========");
			
		Map<String, Object> studentOne = studentService.getStudentOne(studentCode);

		log.debug(TeamColor.BJH + "map에 학생정보 담아서 보내기" + studentCode);
		
		model.addAttribute("s", studentOne);
		log.debug(TeamColor.BJH + " 학생 상세보기 controller 성공");
		
		return "member/student/studentOne";
	
	}
	
	// 수정 삭제 추가는 직원만
	// 학생정보 수정 폼
    @GetMapping("/employee/modifyStudent")
    public String modifyStudent(Model model, @RequestParam(value = "studentCode") int studentCode) {
    	
    	log.debug(TeamColor.BJH + "학생정보 페이지서비스 진입=======studentCode========>" + studentCode);
    	Map<String, Object> updateOne = studentService.getStudentOne(studentCode);
    
		model.addAttribute("s", updateOne);
    	log.debug(TeamColor.BJH + "학생정보 수정 페이지 이동");
    	
    	return "member/student/modifyStudent";
    }

    
  
    // 학생정보 수정 액션
    @PostMapping("/employee/modifyStudentAction")
    public String modifyStudentAction(Model model, Map<String, Object> map,
    		Member member, Student student,
    		@RequestParam(value = "studentCode") int studentCode) {
    	log.debug(TeamColor.BJH + this.getClass() + "액션 창 들어왔나?");
    	
    	map.put("studentCode", studentCode);
    	map.put("studentYear", student.getStudentYear());    	
    	map.put("studentState", student.getStudentState());
    	map.put("memberName", member.getMemberName());
    	map.put("memberGender", member.getMemberGender());
    	map.put("memberType", member.getMemberType());
    	map.put("memberBirth", member.getMemberBirth());
    	map.put("memberEmail", member.getMemberEmail());
    	map.put("memberAddress", member.getMemberAddress());
    	map.put("memberContact", member.getMemberContact());
    	
    	
    	log.debug(TeamColor.BJH + "modifyStudentAction에 정보 담기>>>>>"+ map);
    	
    	int count = studentService.modifyStudent(map);
    	
    	if (count != 0) {
			log.debug(TeamColor.BJH + " 학생정보 수정성공");
			return "redirect:studentOne?studentCode="+studentCode;
		}
    	
    	return "redirect:modifyStudent?studentCode="+studentCode;

    }
    
    
    //학생 삭제
    @PostMapping("/employee/removeStudentMember")
    public String removeStudentMember(@RequestParam (value= "memberId") String memberId) {
    	
    	studentService.removeStudentMember(memberId);
    
    	log.debug(TeamColor.BJH + memberId+"<====  학생정보 + 멤버정보 삭제성공");
    	return "redirect:studentList";
    					
    }
    
    
    ////////////////////승인관련
	// 학생 승인대기 출력
    @GetMapping("/employee/studentQueueList")
	public String studentQueueList(Model model,
			@RequestParam(value = "memberId") String memberId) {

		// 총 페이지
    	int totalCount = studentService.getCountStudentQueue(); 
    	
    	Map<String, Object> map = new HashMap<>();	
    	List<Member> studentQueueList = studentService.getStudentQueueList(map); // 학생 목록
		
    	model.addAttribute("list", studentQueueList);
    	
		return "member/student/studentQueueList";
    }
    
 // 학생 승인 거절
 	@GetMapping("/employee/studentQueueList")
 	public String negativeStudent(
 			@RequestParam(value="memberId") String memberId) {
 		studentService.negativeStudent(memberId);
 		return "redirect:/member/student/studentQueueList";
 	}
 	
 	// 학생 승인
 	@GetMapping("/employee/accessStudent")
 	public String accessStudent(HttpSession session,
 			@RequestParam(value="memberId") String memberId) {
 		
 		
 		studentService.accessStudent(memberId);
 		return "redirect:/member/student/studentQueueList";
 	}
 	
    
}

		