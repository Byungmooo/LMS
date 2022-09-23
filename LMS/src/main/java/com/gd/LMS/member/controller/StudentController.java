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
	@GetMapping("/member/student/studentList")
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
    public String modifyStudent(Model model, @RequestParam(value = "studentCode") int studentCode) {
    	
    	log.debug(TeamColor.BJH + studentCode+"studentCode 보내기");
    	Map<String, Object> updateOne = studentService.getStudent(studentCode);
    
		model.addAttribute("s", updateOne);
    	log.debug(TeamColor.BJH + updateOne+"studentCode 담아서 보내기");
    	
    	return "/member/student/modifyStudent";
    }

    
  
    // 학생정보 수정 액션
    @PostMapping("/member/student/modifyStudentAction")
    public String modifyStudentAction(Model model, Map<String, Object> map, 
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
    		if (count != 0) {
    			log.debug(TeamColor.BJH + " 학생정보 수정성공");
    			return "redirect:studentOne?studentCode="+studentCode;
    		}
    	
    	return "redirect:/modifyStudent?studentCode="+studentCode;
    }
    
    
    //학생 삭제
    @PostMapping("/member/student/removeStudentMember")
    public String removeStudentMember(@RequestParam (value= "memberId") String memberId) {
    	
    	studentService.removeStudentMember(memberId);
    
    	log.debug(TeamColor.BJH + memberId+"<====  학생정보 + 멤버정보 삭제성공");
    	return "redirect:/member/student/studentList";
    					
    }
    
}

		