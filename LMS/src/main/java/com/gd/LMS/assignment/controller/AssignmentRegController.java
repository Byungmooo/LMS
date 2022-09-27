package com.gd.LMS.assignment.controller;

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

import com.gd.LMS.assignment.service.AssignmentRegService;
import com.gd.LMS.assignment.service.AssignmentService;
import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.member.service.MemberService;
import com.gd.LMS.member.service.ProfessorService;
import com.gd.LMS.vo.Assignment;
import com.gd.LMS.vo.AssignmentReg;
import com.gd.LMS.vo.AssignmentRegForm;
import com.gd.LMS.vo.OpenedLecture;
import com.gd.LMS.vo.Professor;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class AssignmentRegController { 
	
	//과제 객체 
	@Autowired AssignmentService assignmentService;
	//학생(과제) 객체 
	@Autowired AssignmentRegService assignmentRegService;
	//memberId > 교수 불러오기 위한 객체 
	@Autowired 	MemberService memberService;
	//수강중인 강의 불러오기 위한 객체
	//@Autowired LectureService lectureService;
	//교수 정보 불러오는 객체
	@Autowired ProfessorService professorService;
	
	
	// LectureService 객체 주입
	//@Autowired LectureSubjectService lectureSubjectService;
	
		// 학생별 제출한 과제 리스트 조회 메소드
		// 파라미터 : assignmentRegListById 담을 Model
		// 리턴값 : assignmentRegListById.jsp로 이동
		@GetMapping("/student/assignmentRegListById")
		public String assignmentRegListById(Model model, HttpSession session) {
			// 디버깅 영역구분
			log.debug(TeamColor.BJH + "assignmentRegList Controller");

			// sessionId 값 넘겨주기
			String memberId = ((String) session.getAttribute("memberId"));
			// accountId 디버깅
			log.debug(TeamColor.BJH + memberId + "<--memberId");

			// 요청 받은 값 Map 객체에 셋팅
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("memberId", memberId);
			log.debug(TeamColor.BJH + paramMap + "<--paramMap");

			// Service Call
			Map<String, Object> assignmentRegList = assignmentRegService.getAssignmentRegById(memberId);
			// reportSubmitListById 디버깅
			log.debug(TeamColor.BJH + assignmentRegList + "<--assignmentRegList");

			// model에 담기
			model.addAttribute("assignmentRegList", assignmentRegList);

			if (assignmentRegList != null) {
				// 성공
				log.debug(TeamColor.BJH + " 제출한 과제 리스트 조회 성공");
			} else {
				// 실패
				log.debug(TeamColor.BJH + " 제출한 과제 리스트 조회 실패");
			}

			// assignmentRegList로 이동
			return "assignmnet/assignmentRegListById";
		}

		
		/*
		
		// 강좌별 제출한 과제 리스트 조회 메소드
		// assignmentRegList Form
		// 파라미터 : infoAboutTeacher, subjectNameList 담을 Model
		// 리턴값 : reportSubmitList.jsp로 이동
		@GetMapping("/student/assignmentRegList")
		public String assignmentRegList(Model model, HttpSession session) {
			// 디버깅 영역구분
			log.debug(TeamColor.BJH + "assignmentRegListt Controller");

			// 세션 받아오기
			String memberId = (String) session.getAttribute("memberId");
			// 로그인한 교수아이디  확인
			log.debug(TeamColor.BJH + memberId + "<-- memberId");
			
			// lecturName 리스트 받아오기 Service Call
			//List<Map<String,Object>> lectureCodeList = lectureService.getStudentLectureList(memberId);
			// 디버깅
			//log.debug(TeamColor.BJH + lectureCodeList + "<-- lectureCodeList");

			// 모델단에 전체과목리스트와 과목과정 기간을 addAttribute해서 폼으로 전달
			//model.addAttribute("lectureCodeList", lectureCodeList);

			
			if (lectureCodeList != null) {
				// 성공
				log.debug(TeamColor.BJH + " 듣고있는 강의 조회 성공");
			} else {
				// 실패
				log.debug(TeamColor.BJH + " 듣고있는 강의 리스트 조회 실패");
			}
			
			return "assignment/assginementRegList";
		}

		
		
		// 과제 제출하기 메소드
		// addAssignmnetReg Form
		// 파라미터:assginmentNo
		// 리턴값 : addAssignmnetReg.jsp로 이둉
		@GetMapping("/student/addAssignmentReg")
		public String addAssignmentReg(Model model, HttpSession session, 
				@RequestParam("assginmentNo") int assginmentNo,
				@RequestParam("professorCode") int professorCode) {
			// 디버깅 영역구분
			log.debug(TeamColor.BJH + "addAssignmentReg Controller");
			// 파라미터 디버깅
			log.debug(TeamColor.BJH + assginmentNo + "<--assginmentNo");

			// addAssignmentRegForm Service Call
			Assignment addAssignmentRegForm = assignmentService.getAssignmentOne(assginmentNo);
			// addAssignmentRegForm 디버깅
			log.debug(TeamColor.BJH + addAssignmentRegForm + "<--addAssignmentRegForm");

			// 세션 받아오기
			String memberId = (String) session.getAttribute("memberId");
			// 로그인한 교수아이디  확인
			log.debug(TeamColor.BJH + memberId + "<-- memberId");

			// professorInfo Service Call
			Map<String,Object>  professorInfo = professorService.getProfessorOne(professorCode);
			// addAssignmentRegForm 디버깅
			log.debug(TeamColor.BJH + professorInfo + "<--professorInfo");

			// addReportSubmitForm, EducationInfo model값으로 보내기 Service Call
			model.addAttribute("addAssignmentRegForm", addAssignmentRegForm);
			model.addAttribute("professorInfo", professorInfo);

			return "/assignment/addAssignmentReg";
		} 
	

		// 과제 제출하기 메소드
		// addReportSubmit Action
		// 파라미터 : ReportSubmit , ReportSubmitFile
		// 리턴값 : ReportSubmit , ReportSubmitFile
		@PostMapping("/student/addAssignmentReg")
		public String addAssignmentReg(AssignmentRegForm assignmentRegForm) {
			// 디버깅 영역구분
			log.debug(TeamColor.BJH + "addAssignmentReg Controller");
			// 파라미터 디버깅
			log.debug(TeamColor.BJH + assignmentRegForm + "<--assignmentRegForm");

			// Service Call
			assignmentService.addAssignment(assignmentRegForm);
			
			return "redirect:/assignmnet/assginementRegList";
		}

		// 제출한 과제 점수 수정하는 메소드
		// modifyReportScore Action
		// 파라미터 : reportSubmitNo
		// 리턴값 : ReportSubmit , ReportSubmitFile
		@PostMapping("/student/modifyassignmentRegScore")
		public String modifyassignmentRegScore() {
			return null;

		} // end modifyReportScore @PostMapping

		// 제출한  과제 수정하는 메소드
		// assignmentRegOne Form
		// 파라미터 : assignmentRegOne 담을 Model
		// 리턴값: assignmenttOne.jsp로 이동
		@GetMapping("/student/assignmentRegOne")
		String assignmenOne(Model model, @RequestParam("assignmentRegNo") int assignmentRegNo) {
			// 디버깅 영역구분
			log.debug(TeamColor.BJH + "assignmenOne Controller");
			// 파라미터 디버깅
			log.debug(TeamColor.BJH + assignmentRegNo + "<--assginmentRegNo");

			// reportOne 리스트 model값으로 보내기 Service Call
			AssignmentReg assignmentRegOne = assignmentRegService.AssignmentRegOne(assignmentRegNo);
			// 디버깅
			log.debug(TeamColor.BJH + assignmentRegOne + "<-- reportOne");

			// 모델단에 reportOne을 addAttribute해서 폼으로 전달
			model.addAttribute("assignmentRegOne", assignmentRegOne);

			// reportOne로 이동
			return "assignment/assignmentOne";
		} // end reportOne

		// 제출한 과제 점수 수정하는 메소드
		// modifyassignmentRegScore Form
		// 파라미터 : reportSubmitNo
		// 리턴값 : int
		@GetMapping("/loginCheck/modifyAssignmentRegScore")
		public String modifyAssignmentRegScore(Model model, @RequestParam("assignmentRegNo") int assignmentRegNo) {
			// 디버깅 영역구분
			log.debug(TeamColor.BJH + "modifyassignmentRegScore Controller");
			// 파라미터 디버깅
			log.debug(TeamColor.BJH + assignmentRegNo + "<-- assignmentRegNo");

			// reportSubmitOne 리스트 model값으로 보내기 Service Call
			AssignmentReg assignmentRegOne = assignmentRegService.AssignmentRegOne(assignmentRegNo);
			// 디버깅
			log.debug(TeamColor.BJH + assignmentRegOne + "<-- assignmentRegOne");

			// 모델단에 reportSubmitOne을 addAttribute해서 폼으로 전달
			model.addAttribute("assignmentRegOne", assignmentRegOne);

			return "assignment/modifyAssignmentRegScore";
		} // end modifyReportScore @GetMapping

		// 제출한 과제 수정하는 메소드
		// modifyReportSubmit Form
		// 파라미터 : ReportSubmit
		// 리턴값 : int
		@GetMapping("/loginCheck/modifyAssignmentReg")
		public String modifyAssignmentReg(Model model, @RequestParam("assignmentRegNo") int assignmentRegNo) {
			// 디버깅 영역구분
			log.debug(TeamColor.BJH + "modifyAssignmentReg Controller");
			// 파라미터 디버깅
			log.debug(TeamColor.BJH + assignmentRegNo + "<-- assignmentRegNo");

			// reportSubmitOne 리스트 model값으로 보내기 Service Call
			AssignmentReg assignmentRegOne = assignmentRegService.AssignmentRegOne(assignmentRegNo);
			// 디버깅
			log.debug(TeamColor.BJH + assignmentRegOne + "<-- assignmentRegOne");

			// 모델단에 reportSubmitOne을 addAttribute해서 폼으로 전달
			model.addAttribute("assignmentRegOne", assignmentRegOne);

			return "assignment/modifyAssignmentReg";

		} 

		// 제출한 과제 수정하는 메소드
		// modifyReportSubmit action
		// 파라미터 : AssignmentReg
		// 리턴값 : int
		@PostMapping("/student/modifyAssignmentReg")
		public String modifyAssignmentReg(@RequestParam("assignmentTitle") String assignmentTitle,
				@RequestParam("assignmentContent") String assignmentContent,
				@RequestParam("assignmentRegNo") int assignmentRegNo) {
			// 디버깅 영역구분
			log.debug(TeamColor.BJH + "modifyAssignmentReg Controller");
			// 파라미터 디버깅
			log.debug(TeamColor.BJH + assignmentTitle + "<-- assignmentTitle");
			log.debug(TeamColor.BJH + assignmentContent + "<-- assignmentContent");
			log.debug(TeamColor.BJH + assignmentRegNo + "<-- assignmentRegNo");

			// 파라미터 값 셋팅
			AssignmentRegForm assignmentReg = new AssignmentRegForm();
			assignmentReg.setAssignmentRegContent(assignmentContent);
			assignmentReg.setAssignmentRegTitle(assignmentTitle);
			assignmentReg.setAssignmentRegNo(assignmentRegNo);
			// 파라미터 디버깅
			log.debug(TeamColor.BJH + assignmentReg + "<-- assignmentReg");

			// Service Call
			int modifyAssignmentReg = assignmentRegService.modifyAssignmentReg(assignmentReg);
			// modifyReportSubmit 디버깅
			log.debug(TeamColor.BJH + modifyAssignmentReg + "<-- modifyAssignmentReg");

			if (modifyAssignmentReg != 0) {
				// 성공
				log.debug(TeamColor.BJH + " 제출한 과제 수정 성공");
			} else {
				// 실패
				log.debug(TeamColor.BJH + " 제출한 과제 수정 실패");
			}

			// assignmentListById로 이동
			return "assignment/assignmentListById";
		} 
		
		
		
		

		// 제출한 과제 삭제하는 메소드
		// 파라미터 : reportSubmitNo
		// 리턴값 : int
		@GetMapping("/student/removeAssignmentReg")
		public String removeAssignmentReg(@RequestParam("assignmentRegNo") int assignmentRegNo) {
			// 디버깅 영역구분
			log.debug(TeamColor.BJH + "removeAssignment Controller");
			// 파라미터 디버깅
			log.debug(TeamColor.BJH + assignmentRegNo + "<-- assignmentRegNo");

			// 과제 삭제 service call
			int removeAssignmentReg = assignmentRegService.removeAssignmentReg(assignmentRegNo);
			// 파라미터
			log.debug(TeamColor.BJH + removeAssignmentReg + "<-- removeAssignmentReg");

			if (assignmentRegNo != 0) {
				// 성공
				log.debug(TeamColor.BJH + " 과제 삭제 성공");
			} else {
				// 실패
				log.debug(TeamColor.BJH + " 과제 삭제 실패");
			}
			// assignmentList로 리다이렉트
			return "redirect:/sutdent/assignmentRegList";
		} // end
	
		
		*/
	
	

}
