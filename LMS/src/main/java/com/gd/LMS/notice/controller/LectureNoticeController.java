package com.gd.LMS.notice.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.notice.service.LectureNoticeService;
import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.LectureNotice;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LectureNoticeController {
	@Autowired
	LectureNoticeService lecNoticeService;

	// 강의공지 목록 리스트
	@GetMapping({"/professor/lectureNoticeList", "/student/lectureNoticeList"})
	public String lectureNoticeList(PagingVo pagingVo, Model model, Map<String, Object> map,
			@RequestParam(value = "openedLecNo") int openedLecNo,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "searchType", defaultValue = "") String searchType) {
		log.debug(TeamColor.KJS + " [김진수] 강의공지 리스트");
		
		// 파라미터 세팅 (전체 게시글 개수 계산)
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		map.put("openedLecNo", openedLecNo);
		int lectureNoticeCount = lecNoticeService.getLectureNoticeCount(map);
		log.debug(TeamColor.LCH + " totalCount > " + lectureNoticeCount);		
		
		// 이전 페이지 시작 글 번호와 현재 변경되는 페이지의 시작 글번호에 대한 일치 시키는거 많은 변경이 필요하므로 그냥 1로 처리함
		pagingVo = new PagingVo(currentPage, lectureNoticeCount, rowPerPage, keyword, searchType);
		if (pagingVo.getBeginRow() >= lectureNoticeCount) {
			pagingVo = new PagingVo(1, lectureNoticeCount, rowPerPage, keyword, searchType);
		}
		log.debug(TeamColor.LCH + "PagingVo > " + pagingVo);
		
		// 페이지네이션위한 파라미터 추가 세팅
		map.put("beginRow", pagingVo.getBeginRow());
		map.put("rowPerPage", pagingVo.getRowPerPage());
		log.debug(TeamColor.LCH + "map > " + map);
		
		// 리스트값 세팅 후 디버깅
		List<Map<String, Object>> list = lecNoticeService.getLectureNoticeList(map);
		log.debug(TeamColor.LCH + "noticeList > " + list);

		model.addAttribute("paging", pagingVo);
		model.addAttribute("list", list);

		return "/notice/lectureNotice/lectureNoticeList";
	}

	// 강의공지 상세보기
	@GetMapping({"/professor/lectureNoticeOne", "/student/lectureNoticeOne"})
	public String lectureNoticeOne(Model model
			, @RequestParam (value = "errorMsg", defaultValue = "") String errorMsg
			, @RequestParam(value = "lecNoticeNo") int lecNoticeNo) {
		log.debug(TeamColor.KJS);
		
		LectureNotice lectureNoticeOne = lecNoticeService.getLectureNoticeOne(lecNoticeNo);
		if(lectureNoticeOne != null) {
			int views = lecNoticeService.getLectureNoticeModifyViews(lecNoticeNo);
			
			if(views != 0) {
				lectureNoticeOne.setViews(views);
				log.debug(TeamColor.LCH + "lectureNoticeOne > " + lectureNoticeOne);
			}
		}
		
		// error 처리
		if(!errorMsg.equals("")) {
			log.debug(TeamColor.LCH + "errorMsg > " + errorMsg);
			model.addAttribute("errorMsg", errorMsg);
		} else {
			model.asMap().clear();
		}
		
		model.addAttribute("map", lectureNoticeOne);
		
		return "/notice/lectureNotice/lectureNoticeOne";
	}
	
	// 강의공지 추가 삭제 수정은 교수만
	// 강의공지 추가
	@GetMapping("/professor/addLectureNotice")
	public String addLectureNotice() {
		log.debug(TeamColor.LCH + "addLectureNotice GetMappting Controller");
		return "/notice/lectureNotice/addLectureNotice";
	}

	// 강의공지 추가 액션
	@PostMapping("/professor/addLectureNotice")
	public String addLectureNotice(LectureNotice lectureNotice, RedirectAttributes redirectAttributes) {
		log.debug(TeamColor.LCH + "addLectureNotice PostMappting Controller");
		
		int result = lecNoticeService.addLectureNoticeOne(lectureNotice);
		if (result == 0) {
			log.debug(TeamColor.LCH + "fail > move to addNotice");
			return "redirect:/professor/addLectureNotice";
		}
		
		redirectAttributes.addAttribute("lecNoticeNo", result);
		return "redirect:/professor/lectureNoticeOne";
	}

	// 강의공지 수정
	@GetMapping("/professor/modifyLectureNotice")
	public String modifyLectureNotice(Model model
			, @RequestParam(value = "lecNoticeNo") int lecNoticeNo) {
		log.debug(TeamColor.LCH + "lecNoticeNo > " + lecNoticeNo);
		
		LectureNotice lectureNoticeOne = lecNoticeService.getLectureNoticeOne(lecNoticeNo);
		log.debug(TeamColor.LCH + "lectureNoticeOne > " + lectureNoticeOne);
		
		model.addAttribute("map", lectureNoticeOne);
		
		return "/notice/lectureNotice/modifyLectureNotice";
	}

	// 강의공지 수정 액션
	@PostMapping("/professor/modifyLectureNotice")
	public String modifyLectureNotice(LectureNotice lectureNotice, RedirectAttributes redirectAttributes) {
		log.debug(TeamColor.KJS + "lectureNotice > " + lectureNotice);
		redirectAttributes.addAttribute("lecNoticeNo", lectureNotice.getLecNoticeNo());
		
		int result = lecNoticeService.modifyLectureNoticeOne(lectureNotice);
		
		if (result == 0) {
			return "redirect:/professor/modifyLectureNotice";
		}
		return "redirect:/professor/lectureNoticeOne";
	}

	// 강의공지 삭제
	@GetMapping("/professor/removeLectureNotice")
	public String removeLectureNotice(Model model, HttpSession session
			, RedirectAttributes redirectAttributes
			, @RequestParam(value = "lecNoticeNo") int lecNoticeNo) {
		log.debug(TeamColor.LCH + "--- removeLectureNotice Controller GetMapping ---");
		
		log.debug(TeamColor.LCH + "lecNoticeNo > " + lecNoticeNo);
		
		// FK로 잡힌 키가 없으므로 삭제진행
		int result = lecNoticeService.removeLectureNoticeOne(lecNoticeNo);
		log.debug(TeamColor.LCH + "result > " + result);
		
		redirectAttributes.addAttribute("openedLecNo", session.getAttribute("openedLecNo"));
		return "redirect:/professor/lectureNoticeList";
	}
}
