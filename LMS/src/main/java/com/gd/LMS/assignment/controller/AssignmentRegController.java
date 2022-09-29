package com.gd.LMS.assignment.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gd.LMS.assignment.service.AssignmentRegService;
import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.member.service.MemberService;
import com.gd.LMS.vo.AssignmentReg;
import com.gd.LMS.vo.AssignmentRegImg;
import com.gd.LMS.vo.OpenedLecture;
import com.gd.LMS.vo.Professor;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class AssignmentRegController { 
	
	@Autowired AssignmentRegService assignmentRegService;
	//memberId > 학생 불러오기 위한 객체 
	@Autowired 	MemberService memberService;
	
	
	// 과제 리스트 조회	
	@GetMapping("/student/assignmentRegList")
	public String assignmentRegList(Model model, HttpSession session) {
		
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "assignmentRegList Controller");
		
		//서비스 불러오기
		List<Map<String, Object>>  assignmentRegList = assignmentRegService.getAssignmentRegList();
		log.debug(TeamColor.BJH + assignmentRegList + "<--assignmentList");

		// 뷰에서 끄내쓸 리스트 보내기
		model.addAttribute("assignmentRegList", assignmentRegList);
		
		if (assignmentRegList != null) {
			// 성공
			log.debug(TeamColor.BJH + "나의 과제 리스트 조회 성공");
			// 이동
			return "assignment/assignmentRegList";
		} else {
			// 실패
			log.debug(TeamColor.BJH + "나의 과제 리스트 조회실패");
			// index로 리다이렉트
			return "redirect:/assignment/assignmentRegList";
		}
	}
		
		//과제 상세보기
		@GetMapping({"/student/assignmentRegOne", "/professor/assignmentRegOne" })
		public String getAssignmentRegOne(@RequestParam("assignmentRegNo") int assignmentRegNo ,Model model, Map<String, Object> assignmentRegOne) {
		log.debug(TeamColor.BJH + "assignmentRegNo > " + assignmentRegNo);
			
		assignmentRegOne = assignmentRegService.getAssignmentRegOne(assignmentRegNo);
		
		//모델에 담아서 상세보기 리스트에서 꺼내 쓰면 됨
		model.addAttribute("RegOne", assignmentRegOne);
		
		
		log.debug(TeamColor.BJH + "RegOne 값 들어갔나?----->s" + assignmentRegOne);
		
		
		return "assignment/assignmentRegOne";
		
		}
		// 과제 제출하는 메소드
		@GetMapping("/student/addAssignmentReg")
		public String addAssignmentReg(Model model, HttpSession session, 
				@RequestParam(value="assignmentRegNo") int assignmentRegNo) {
			// 디버깅 영역구분
			log.debug(TeamColor.BJH + "addAssignmentReg Controller 실행");
			
			
			// 세션 받아오기
			String memberId = (String) session.getAttribute("memberId");
			model.addAttribute("assignmentRegNo",assignmentRegNo);
			// 로그인한 강사의 멤버아이디
			log.debug(TeamColor.BJH + memberId + "<-- memberId");
			log.debug(TeamColor.BJH + assignmentRegNo + "<-- assignmentRegNo");

			return "redirect:/assignment/addAssignmentReg";
		} 

		

		// 과제 제출 Action
		@PostMapping("/student/addAssignmentRegAction")
		public String addAssignmentRegAction(AssignmentReg assignmentReg,MultipartFile[] regFile, HttpServletRequest request) throws UnsupportedEncodingException  {
			// 디버깅 영역구분
			log.debug(TeamColor.BJH + "addAssignmentReg ACTION Controller----실행");
		
			// Service Call
			assignmentRegService.addAssignmentRegForm(assignmentReg, regFile, request);
			
			// 파라미터 디버깅
			log.debug(TeamColor.BJH + assignmentReg + "<--assignmentReg");
			log.debug(TeamColor.BJH +  regFile + "<-----regFile" );
			log.debug(TeamColor.BJH +  request + "<-----request" );
			
			
			
			return "redirect:/assignment/assignmentRegList";
		}

		
		
		
		// 제출한 과제 점수 수정 Form
		@GetMapping("/professor/modifyAssignmentRegScore")
		public String modifyAssignmentRegScore(Model model, @RequestParam("assignmentRegNo") int assignmentRegNo) {
			// 디버깅 영역구분
			log.debug(TeamColor.BJH + "modifyassignmentRegScore 과제수정 Get Controller");
			// 파라미터 디버깅
		
			int score = assignmentRegService.modifyAssignmentRegScore(assignmentRegNo);
			// 디버깅
			log.debug(TeamColor.BJH + score + "<-- 수정할 내용 담아서 넘기기");

			// 모델단에 reportSubmitOne을 addAttribute해서 폼으로 전달
			model.addAttribute("score", score);

			return "redirect:/assignment/modifyAssignmentRegScore";
		} 
		// 제출한 과제 점수 수정 Action
		@PostMapping("/professor/modifyassignmentRegScore")
		public String modifyassignmentRegScore() {
			return null;

		}


		
	

		// 제출한 과제 수정 Form
		@GetMapping("/student/modifyAssignmentReg")
		public String modifyAssignmentReg(Model model, AssignmentReg assignmentReg,int assignmentRegNo) {
			// 디버깅 영역구분
			log.debug(TeamColor.BJH + "modifyAssignmentReg Controller");
			// 파라미터 디버깅
			log.debug(TeamColor.BJH + assignmentReg + "<-- assignmentReg");

			// assignmentRegOne 리스트 model값으로 보내기
			Map<String, Object> modifyAssignmentReg = assignmentRegService.getAssignmentRegOne(assignmentRegNo);
			// 디버깅
			log.debug(TeamColor.BJH + modifyAssignmentReg + "<-- assignmentReg");

			// 모델에 assignmentRegOne을 addAttribute해서 폼으로 전달
			model.addAttribute("modifyReg", modifyAssignmentReg);

			return "redirect:/assignment/modifyAssignmentReg";

		} 
		

		
		// 제출한 과제 수정action
		@PostMapping("/student/modifyAssignmentReg")
		public String modifyAssignmentReg(AssignmentReg assignmentReg)throws UnsupportedEncodingException  {
			// 디버깅 영역구분
			log.debug(TeamColor.BJH + "modifyAssignmentReg Controller");
			
			int row = assignmentRegService.AssignmentRegOne(assignmentReg);
			// modifyReportSubmit 디버깅
			log.debug(TeamColor.BJH + assignmentReg + "<-- assignmentReg에 수정내용 담기 성공");

			if (row != 0) {
				// 성공
				log.debug(TeamColor.BJH + " 제출한 과제 수정 성공");
			} else {
				// 실패
				log.debug(TeamColor.BJH + " 제출한 과제 수정 실패");
			}

			// assignmentRegList로 이동
			return "redirect:/assignment/assignmentRegList";
		} 
		
		

		// 제출한 과제 삭제
		@PostMapping("/student/removeAssignmentReg")
		public String removeAssignmentReg(@RequestParam("assignmentRegNo") int assignmentRegNo) {
			// 디버깅 영역구분
			log.debug(TeamColor.BJH + "removeAssignment Controller");
			assignmentRegService.removeAssignmentReg(assignmentRegNo);
			
			// 파라미터 디버깅
			log.debug(TeamColor.BJH + assignmentRegNo + "<-- assignmentRegNo");
							
			if (assignmentRegNo != 0) {
				// 성공
				log.debug(TeamColor.BJH + "과제가 존재하여 삭제불가능");
				return "redirect:/assignment/assignmentRegList";
			}
			return "redirect:/assignment/assignmentRegOne";
		}
		
		
		
		//파일 다운로드
		@GetMapping("downloadFile")
		public ResponseEntity<Object> downloadFile(String fileName, int assignmentRegNo, HttpServletRequest request) throws UnsupportedEncodingException{
			
			//파일 경로
			String realPath = request.getSession().getServletContext().getRealPath("/imgFile/file") + "\\"+ fileName;
			
			//디버깅
			log.debug(TeamColor.BJH+ "값 확인 / realPath: " + realPath);
			
			//리턴값 세팅
			ResponseEntity<Object> returnVal = assignmentRegService.douwnloadFile(fileName, realPath);
			
			//디버깅
			log.debug(TeamColor.BJH + "값 확인 / returnVal: " + returnVal);
			
			return returnVal;
		
	}
		
		

}
