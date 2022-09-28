package com.gd.LMS.member.controller;

import java.util.List;
import java.util.Map;

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
import com.gd.LMS.vo.Member;
import com.gd.LMS.vo.Student;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class StudentController {
	@Autowired StudentService studentService;
	@Autowired DepartmentService departmentService;

    ////////////////////////학생
    
	// 학생 리스트
	@GetMapping("/employee/studentList")
	public String StudentList(Model model){
	
	log.debug(TeamColor.BJH + " studentList 담겼음");
	
	List<Map<String, Object>> list = studentService.getStudentList();
	log.debug(TeamColor.BJH + " getStudentList 담겼음" + list);
	                
	 model.addAttribute("list", list);
     log.debug(TeamColor.BJH + " model에 리스트 담음" +list);
	 
     return "member/student/studentList";
	
	}
	
	//학생 추가 폼
	
	
	
	
	
	//학생 상세보기
	@GetMapping({"/employee/studentOne", "/student/studentOne"})
	public String StudentOne(Model model, @RequestParam(value = "memberCode") int studentCode) {
		log.debug(TeamColor.BJH + "welcome");
			
		Map<String, Object> studentOne = studentService.getStudentOne(studentCode);
		log.debug(TeamColor.BJH + "StudentOne controller" + studentCode);
		
		model.addAttribute("s", studentOne);
		
		log.debug(TeamColor.BJH + " 학생 상세보기");
		return "member/student/studentOne";
	
	}
	
	// 수정 삭제 추가는 직원만
	// 학생정보 수정 폼
    @GetMapping("/employee/modifyStudent")
    public String modifyStudent(Model model, @RequestParam(value = "studentCode") int studentCode) {
    	
    	log.debug(TeamColor.BJH + studentCode+"studentCode 보내기");
    	Map<String, Object> updateOne = studentService.getStudent(studentCode);
    
		model.addAttribute("s", updateOne);
    	log.debug(TeamColor.BJH + updateOne+"studentCode 담아서 보내기");
    	
    	return "member/student/modifyStudent";
    }

    
  
    // 학생정보 수정 액션
    @PostMapping("/employee/modifyStudentAction")
    public String modifyStudentAction(Model model, Map<String, Object> map,
    		RedirectAttributes redirectAttributes,
    		Member member, Student student, @RequestParam(value = "studentCode") int studentCode) {
    	log.debug(TeamColor.BJH + this.getClass() + "액션 창 들어왔나?");
    	
    	map.put("studentCode", studentCode);
    	map.put("studentYear", student.getStudentYear());
    	log.debug(TeamColor.BJH + student.getStudentYear());
    	
    	
    	map.put("studentState", student.getStudentState());
    	map.put("memberName", member.getMemberName());
    	map.put("memberGender", member.getMemberGender());
    	map.put("memberType", member.getMemberType());
    	map.put("memberBirth", member.getMemberBirth());
    	map.put("memberEmail", member.getMemberEmail());
    	map.put("memberAddress", member.getMemberAddress());
    	map.put("memberContact", member.getMemberContact());
    	
    	
    	log.debug(TeamColor.BJH + this.getClass() + map);
    	
    	int count = studentService.modifyStudent(map);
    	//log.debug(TeamColor.BJH +  studentService + "확인" );
    	redirectAttributes.addAttribute("studentCode", studentCode);
    	
    	if (count != 0) {
			log.debug(TeamColor.BJH + " 학생정보 수정성공");
			return "redirect:/employee/studentOne?studentCode="+studentCode;
		}
    	
    	return "redirect:/employee/modifyStudent?studentCode="+studentCode;
    }
    
    
    //학생 삭제
    @PostMapping("/employee/removeStudentMember")
    public String removeStudentMember(@RequestParam (value= "memberId") String memberId) {
    	
    	studentService.removeStudentMember(memberId);
    
    	log.debug(TeamColor.BJH + memberId+"<====  학생정보 + 멤버정보 삭제성공");
    	return "redirect:/member/student/studentList";
    					
    }
    
}

		