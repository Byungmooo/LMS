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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.LMS.assignment.service.AssignmentRegService;
import com.gd.LMS.assignment.service.AssignmentService;
import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.member.service.MemberService;
import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.Assignment;
import com.gd.LMS.vo.AssignmentReg;
import com.gd.LMS.vo.AssignmentRegImg;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
public class AssignmentRegController { 
	
	@Autowired AssignmentRegService assignmentRegService;
	//memberId > 학생 불러오기 위한 객체 
	@Autowired 	MemberService memberService;
	@Autowired AssignmentService assignmentService;
	
	
	
	// 과제 리스트 조회	
	@GetMapping({"/student/assignmentRegList", "/professor/assignmentRegList"})
	public String assignmentRegList(PagingVo pagingVo, Model model, Map<String, Object> map,
			@RequestParam(value = "openedLecNo") int openedLecNo,
			@RequestParam(value = "assignmentNo") int assignmentNo,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "searchType", defaultValue = "") String searchType) {
		
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "제출한 과제 전체리스트 컨트롤러 진입=========");
		// 파라미터 세팅 (전체 게시글 개수 계산)
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		map.put("assignmentNo",assignmentNo);
		map.put("openedLecNo", openedLecNo);
		
		int totalCount = assignmentRegService.getAssignmentRegCount(map);
		log.debug(TeamColor.BJH + " keyword, searchType, openedLecNo ,assignmentNo > " + totalCount);		
		
		// 이전 페이지 시작 글 번호와 현재 변경되는 페이지의 시작 글번호에 대한 일치 시키는거 많은 변경이 필요하므로 그냥 1로 처리함
		pagingVo = new PagingVo(currentPage, totalCount, rowPerPage, keyword, searchType);
		if (pagingVo.getBeginRow() >= totalCount) {
			pagingVo = new PagingVo(1, totalCount, rowPerPage, keyword, searchType);
		}
		log.debug(TeamColor.BJH + "PagingVo > " + pagingVo);

		// 페이지네이션위한 파라미터 추가 세팅
		map.put("beginRow", pagingVo.getBeginRow());
		map.put("rowPerPage", pagingVo.getRowPerPage());
		log.debug(TeamColor.BJH + "beginRow, rowPerPage > " + map);
				
		//서비스 불러오기
		List<Map<String, Object>>  list = assignmentRegService.getAssignmentRegList(map);
		log.debug(TeamColor.BJH + list + "<--assignmentList");

		// 뷰에서 끄내쓸 리스트 보내기

		model.addAttribute("paging", pagingVo);
		model.addAttribute("list", list);
		
		return "/assignment/assignmentRegList";
	}
		
	
		//과제 상세보기
		@GetMapping({"/professor/assignmentRegOne", "/student/assignmentRegOne"})
		public String getAssignmentRegOne(Model model,AssignmentReg assignmentReg,
				@RequestParam(value = "assignmentRegNo") int assignmentRegNo,
				@RequestParam(value = "openedLecNo") int openedLecNo) {
					
		
		Map<String,Object> assignmentRegOne = assignmentRegService.getAssignmentRegOne(assignmentRegNo);
		
		model.addAttribute("map", assignmentRegOne);
		log.debug(TeamColor.BJH + "assignmentRegOne 값 들어갔나?----->" + assignmentRegOne);
		

		return "assignment/assignmentRegOne";
		
		}
		
		
		// 과제 제출하는 메소드
		@GetMapping("/student/addAssignmentReg")
		public String addAssignmentReg(Model model, AssignmentReg assignmentReg,
					HttpSession session,
					@RequestParam(value="openedLecNo") int openedLecNo){
			
			
			log.debug(TeamColor.BJH + "과제 제출 컨트롤러(GetMappting) 실행=========");
			int memberCode = (int)session.getAttribute("memberCode");
			int studentLecNo = assignmentRegService.getStudentLectureNo(openedLecNo,memberCode);
			
			model.addAttribute("assignmentReg",assignmentReg);
			log.debug(TeamColor.BJH + "assignmentReg>>>>>>" +assignmentReg);
			model.addAttribute("studentLecNo",studentLecNo);
			log.debug(TeamColor.BJH + "studentLecNo>>>>>>" +studentLecNo);
			
			
			return "assignment/addAssignmentReg";
		}
		

		// 과제 제출 Action
		@PostMapping("/student/addAssignmentReg")
		public String addAssignmentReg(AssignmentReg assignmentReg,  
				HttpSession session,
				MultipartFile[] regFile, 
				HttpServletRequest request,
				@RequestParam(value ="openedLecNo")int openedLecNo) throws UnsupportedEncodingException  {
			// 디버깅 영역구분
			log.debug(TeamColor.BJH + "addAssignmentReg ACTION Controller----실행");
			
			int assignmentNo = assignmentReg.getAssignmentNo(); 
			int studentLecNo = assignmentReg.getStudentLecNo(); 

			Map<String, Object> map = new HashMap<>();

			map.put("openedLecNo", openedLecNo);
			map.put("studentLecNo", studentLecNo);
			map.put("assignmentNo", assignmentNo);

			
			// Service Call
			assignmentRegService.addAssignmentReg(assignmentReg,  regFile, request, map);
			
			
			// 파라미터 디버깅
			log.debug(TeamColor.BJH + assignmentReg + "<--assignmentReg");
			log.debug(TeamColor.BJH +  regFile + "<-----regFile" );
			log.debug(TeamColor.BJH +  request + "<-----request" );
			log.debug(TeamColor.BJH +  map + "<-----map" );
			
			
			
			return "redirect:/student/assignmentRegList?openedLecNo="+ openedLecNo +"&assignmentNo=" + assignmentNo;
		}


		// 제출한 과제 수정 Form
		@GetMapping("/student/modifyAssignmentReg")
		public String modifyAssignmentReg(Model model, Map<String,Object> map,
				@RequestParam(value= "openedLecNo")  int openedLecNo,
				@RequestParam(value = "assignmentRegNo") int assignmentRegNo) {
			// 디버깅 영역구분
			log.debug(TeamColor.BJH + "과제 수정 컨트롤러(getMapping) 실행=========");

			map.put("openedLecNo",openedLecNo);
			map.put("assignmentRegNo",assignmentRegNo);
			
			// assignmentRegOne 리스트 model값으로 보내기
			Map<String,Object> assignmentRegOne = assignmentRegService.getAssignmentRegOne(assignmentRegNo);
			// 디버깅
			log.debug(TeamColor.BJH + assignmentRegOne + "<-- assignmentRegOne");

			// 모델에 assignmentRegOne을 addAttribute해서 폼으로 전달
			model.addAttribute("map", assignmentRegOne);

			return "/assignment/modifyAssignmentReg";

		} 
		
		// 기존에 썼던 제출한 과제 수정 액션
		@PostMapping("/stduent/modifyAssignmentReg")
		public String modifyAssignmentReg(AssignmentReg assignmentReg, Map<String,Object> map,
				@RequestParam(value= "openedLecNo")  int openedLecNo,
				@RequestParam(value = "assignmentRegNo") int assignmentRegNo) {

			// 디버깅 영역구분
			log.debug(TeamColor.BJH + "과제출제 수정(PostMapping) 컨트롤러 실행=========");
			map.put("openedLecNo",openedLecNo);
			map.put("assignmentRegNo",assignmentRegNo);
			
			int result = assignmentRegService.modifyAssignmentReg(assignmentReg);
			// 디버깅
			log.debug(TeamColor.BJH + "result>>>>> " + result);
			if (result == 0) {
				
				// 실패
				log.debug(TeamColor.BJH + " 제출한 과제 수정 실패");
				//실패했으면 과제 수정 폼으로 보내기
				return "redirect:/member/modifyAssignmentReg";
			}
			// 수정에 성공했으면 낸 과제 상세보기 보내기
			return "redirect:/member/assignmentRegOne";
		}
		
		

		// 제출한 과제 삭제
		@GetMapping("/student/removeAssignmentReg")
		public String removeAssignmentReg(HttpSession session, 
				RedirectAttributes redirectAttributes,
				@RequestParam(value="openedLecNo") int openedLecNo,
				@RequestParam(value = "assignmentRegNo") int assignmentRegNo) {
			// 디버깅 영역구분
			log.debug(TeamColor.BJH + "과제 삭제 Controller 실행=============");
			
			List<String> checkFk = assignmentRegService.getCheckAssignmentReg(assignmentRegNo);
			log.debug(TeamColor.BJH + "checkFk 0? > " + checkFk.size());
			 
			 if(checkFk.size() != 0 ) {
		         log.debug(TeamColor.BJH + "삭제실패 FK 존재");
		         redirectAttributes.addAttribute("assignmentRegNo", assignmentRegNo); 
		         redirectAttributes.addAttribute("errorMsg", "등록된 과제는 삭제 할 수 없습니다.");
		         return "redirect:/student/assignmentRegOne?openedLecNo=" + openedLecNo +"&assignmentRegNo=" + assignmentRegNo;
		      }
		      
			 if(checkFk.size() != 0 ) {
		         log.debug(TeamColor.BJH + "제출한 과제 삭제");
		         return "redirect:/student/assignmentRegList?openedLecNo=" + openedLecNo +"&assignmentRegNo=" + assignmentRegNo;
		      }
		      return "redirect:/student/assignmentRegList?openedLecNo=" + openedLecNo + "&assignmentRegNo=" + assignmentRegNo;
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
		
		//과제 상세보기
		@PostMapping("/professor/addAssignmentScore")
		public String addAssignmentScore(Model model,AssignmentReg assignmentReg,
				@RequestParam(value = "assignmentRegNo") int assignmentRegNo,
				@RequestParam(value = "openedLecNo") int openedLecNo,
				@RequestParam(value = "assignmentScore") int assignmentScore,
				@RequestParam(value = "studentLecNo") int studentLecNo) {
		
		log.debug(TeamColor.BJH + " 값 들어갔나?----->" + assignmentReg + "/" + assignmentScore);
		
		// 과제 제출 여부
		Map<String, Object> map = new HashMap<>();
		map.put("assignmentRegNo", map);
		int row = assignmentRegService.modifyAssignmentDid(assignmentRegNo);
		
		// 학생수강 과제점수 등록
		map.put("studentLecNo", studentLecNo);
		map.put("assignmentScore", assignmentScore);
		int result = assignmentRegService.addAssignmentScore(map);
		
		
		return "redirect:/professor/assignmentRegOne?assignmentRegNo=" +assignmentRegNo + "&openedLecNo=" + openedLecNo;
		}

		

}
