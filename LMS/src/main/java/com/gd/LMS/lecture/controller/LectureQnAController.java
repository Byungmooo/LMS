package com.gd.LMS.lecture.controller;

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
import com.gd.LMS.lecture.service.LectureQnAService;
import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.LectureAnswer;
import com.gd.LMS.vo.LectureQuestion;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LectureQnAController {
	@Autowired LectureQnAService lectureQnAService;
	
	// 강의 질문 리스트
	@GetMapping({"/professor/lectureQuestionList", "/student/lectureQuestionList"})
	public String lectureQuestionList(PagingVo vo, Model model, HttpSession session, Map<String, Object> map,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "searchType", defaultValue = "") String searchType,
			@RequestParam (value = "openedLecNo") int openedLecNo) {
		
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		map.put("openedLecNo", openedLecNo);
		
		log.debug(TeamColor.KJS + "openedLecNo > " + openedLecNo);
		int totalCount = lectureQnAService.countBoard(map);
		log.debug(TeamColor.KJS + "current/rowPer/total : " + currentPage + "/" + rowPerPage + "/" + totalCount);

		vo = new PagingVo(currentPage, totalCount, rowPerPage, keyword, searchType);
		// 이전 페이지 시작 글 번호와 현재 변경되는 페이지의 시작 글번호에 대한 일치 시키는거 많은 변경이 필요하므로 그냥 1로 처리함
		if (vo.getBeginRow() >= totalCount) {
			vo = new PagingVo(1, totalCount, rowPerPage, keyword, searchType);
		}

		// model.addAttribute("list", list1);
		map.put("beginRow", vo.getBeginRow());
		map.put("rowPerPage", vo.getRowPerPage());

		// --------
		log.debug(TeamColor.KJS + "--- lectureQuestionList Controller GetMapping ---");
		
		// List<LectureQuestion> lectureQuestionList =
		// lectureService.getLectureQuestionList(openedLecNo);
		List<LectureQuestion> list1 = lectureQnAService.selectBoard(map);
		log.debug(TeamColor.KJS + "noticeList : " + list1);
		// log.debug(TeamColor.LCH + "lectureQuestionList > " + lectureQuestionList);
		model.addAttribute("paging", vo);
		model.addAttribute("question", list1);
		
		return "lecture/lectureQnA/lectureQuestionList";
	}

	// 강의 질문 상세보기
	@GetMapping({"/professor/lectureQuestionOne","/student/lectureQuestionOne"})
	public String lectureQuestionOne(Model model, HttpSession session,
			@RequestParam(value = "lecQuestionNo") int lecQuestionNo) {
		log.debug(TeamColor.KJS + "--- lectureQuestionOne Controller GetMapping ---");

		log.debug(TeamColor.KJS + "lecQuestionNo > " + lecQuestionNo);

		Map<String, Object> lectureQuestionOne = lectureQnAService.getLectureQuestionOne(lecQuestionNo);
		log.debug(TeamColor.KJS + "lectureQuestionOne > " + lectureQuestionOne);

		model.addAttribute("question", lectureQuestionOne);

		if (lectureQuestionOne.get("answerY").equals("Y")) {
			Map<String, Object> lectureAnswerOne = lectureQnAService.getLectureAnswerOne(lecQuestionNo);
			log.debug(TeamColor.KJS + "lectureAnswerOne > " + lectureAnswerOne);
			model.addAttribute("answer", lectureAnswerOne);
		}
		session.setAttribute("lecQuestionNo", lecQuestionNo);
		return "lecture/lectureQnA/lectureQuestionOne";
	}

	// 질문게시판 수정 페이지 이동
	@GetMapping("/student/updateLectureQuestion")
	public String updateLectureQuestion(Model model, HttpSession session) {
		Map<String, Object> lectureQuestionOne = lectureQnAService
				.getLectureQuestionOne((int) session.getAttribute("lecQuestionNo"));
		log.debug(TeamColor.KJS + " [김진수] 학부공지 수정 페이지 이동");
		model.addAttribute("question", lectureQuestionOne);
		return "/lecture/lectureQnA/updateLectureQuestion";
	}

	// 질문게시판 수정
	@PostMapping("/student/updateLectureQuestion")
	public String updateLectureQuestion(LectureQuestion lectureQuestion, HttpSession session) {
		int count = lectureQnAService.updateQuestion(lectureQuestion);
		if (count >= 1) {
			log.debug(TeamColor.KJS + " [김진수] 학부공지 수정");
			return "redirect:/student/lectureQuestionOne?lecQuestionNo=" + session.getAttribute("lecQuestionNo");
		}
		return "redirect:/student/updateLectureQuestion";
	}

	// 질문 삭제
	   @GetMapping("/student/removeLectrueQuestion")
	   public String removeLecture(HttpSession session, RedirectAttributes redirectAttributes) {
		  int lecQuestionNo = (int) session.getAttribute("lecQuestionNo");
	      List<String> checkFk = lectureQnAService.getCheckFkLecQuestion(lecQuestionNo);
	      log.debug(TeamColor.KJS + "checkFk 0? > " + checkFk.size());
	      if(checkFk.size() != 0) {
	         log.debug(TeamColor.KJS + "삭제실패 FK 존재");
	         redirectAttributes.addAttribute("lecQuestionNo", lecQuestionNo); 
	         redirectAttributes.addAttribute("errorMsg", "이미 답변이 등록되어 잇습니다.");
	         return "redirect:/student/lectureQuestionOne";
	      }
	      
	      int count = lectureQnAService.deleteQuestion(lecQuestionNo);
	      if (count >= 1) {
	         log.debug(TeamColor.KJS + " [김진수] 학부공지 삭제");
	         return "redirect:/student/lectureQuestionList?openedLecNo=" + lecQuestionNo;
	      }
	      return "redirect:/student/lectureQuestionList?openedLecNo=" + lecQuestionNo;
	   }


	// 강의 질문 추가 페이지 이동
	@GetMapping("/student/addLectureQuestion")
	public String addLectureQuestionOne(HttpSession session) {
		log.debug(TeamColor.KJS + " [김진수] 답변 추가 페이지 이동");
		return "/lecture/lectureQnA/addLectureQuestion";

	}

	// 강의 질문 추가
	@PostMapping("/student/addLectureQuestion")
	public String addLectureStudent(LectureQuestion lectureQuestion, HttpSession session) {
		int count = lectureQnAService.getAddQuestion(lectureQuestion);

		log.debug(TeamColor.KJS + lectureQuestion + " [김진수] 답변 추가");
		return "redirect:/student/lectureQuestionList?openedLecNo=" + session.getAttribute("openedLecNo");

	}
	
	// 강의 질문 답변 추가 페이지 이동
	@GetMapping("/professor/addLectureAnswer")
	public String addLectureAnswerOne(Model model,HttpSession session) {
		Map<String, Object> lectureQuestionOne = lectureQnAService
				.getLectureQuestionOne((int) session.getAttribute("lecQuestionNo"));
		log.debug(TeamColor.KJS + " [김진수] 학부공지 수정 페이지 이동");
		model.addAttribute("question", lectureQuestionOne);
	
		log.debug(TeamColor.KJS + " [김진수] 답변 추가 페이지 이동");
		return "lecture/lectureQnA/addLectureAnswer";
	}

	// 강의 질문 답변 추가 - 교수만 해당
	@PostMapping("/professor/addLectureAnswer")
	public String addLectureAnswer( LectureAnswer lectureAnswer, HttpSession session) {
		int lecQuestionNo = (int) session.getAttribute("lecQuestionNo");
		lectureAnswer.setLecQuestionNo(lecQuestionNo);
		lectureQnAService.getAddAnswer(lectureAnswer);

		log.debug(TeamColor.KJS + " [김진수] 답변 추가"); 
		return "redirect:/professor/lectureQuestionOne?lecQuestionNo=" + session.getAttribute("lecQuestionNo"); //연결다리, 상세보기로 돌아가기
 
	}
	
	
	


}
