package com.gd.LMS.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.service.LecNoticeService;
import com.gd.LMS.vo.LectureNotice;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LecNoticeController {

	@Autowired LecNoticeService lecNoticeService;
	
	//공지리스트
	@GetMapping("/lecNoticeList")
	public String lecNoticeList(Model model, HttpSession session,
			@RequestParam(name="currentPage") int currentPage){
	
		// 한 페이지에 표시할 데이터 수
		int rowPerPage = 10;
		
		// 시작 페이지 계산
		int beginRow = (currentPage - 1) * rowPerPage;
		
		List<LectureNotice> lecNoticeList = lecNoticeService.getLecNoticeList(beginRow, rowPerPage);
		
		int totalCount = lecNoticeService.getLecNoticeListCount();
		// 페이징 코드
		// 전체 데이터 수
		int lastPage = totalCount / rowPerPage;
		
		// 10 미만의 개수의 데이터가 있는 페이지를 표시
		if (totalCount % rowPerPage != 0) {
			lastPage += 1;
		}
		
		// 전체 페이지가 0개이면 현재 페이지도 0으로 표시
		if (lastPage == 0) {
			currentPage = 0;
		}
		
		// 내비게이션에 표시할 페이지 수
		int navPerPage = 10;
		
		// 내비게이션 첫번째 페이지
		int navFirstPage = currentPage - (currentPage % navPerPage) + 1;	
		
		// 내비게이션 마지막 페이지
		int navLastPage = navFirstPage + navPerPage - 1;
		
		// 10으로 나누어 떨어지는 경우 처리하는 코드
		if (currentPage % navPerPage == 0 && currentPage != 0) {
			navFirstPage = navFirstPage - navPerPage;
			navLastPage = navLastPage - navPerPage;
		}
		
		// 현재 페이지에 대한 이전 페이지
		int prePage;
		if (currentPage > 10) {
			prePage = currentPage - (currentPage % navPerPage) + 1 - 10;
		} else {
			prePage = 1;
		}
		
		// 현재 페이지에 대한 다음 페이지
		int nextPage = currentPage - (currentPage % navPerPage) + 1 + 10;
		if (nextPage > lastPage) {
			nextPage = lastPage;
		}
		
		
		
		model.addAttribute("lecNoticeList", lecNoticeList);
		System.out.println(TeamColor.BJH + lecNoticeList);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);

		System.out.println(TeamColor.BJH + currentPage);
		System.out.println(TeamColor.BJH + lastPage);
		
		
		return "/lecNoticeList";
	}
	
	
	
	 // 공지사항 상세보기
	 @GetMapping("/lecNoticeOne")
	 public String lecNoticeOne(Model model, 
			 @RequestParam(value="lecNoticeNo") int lecNoticeNo) {
		 
		 log.debug(TeamColor.BJH + lecNoticeNo + "lecNoticeNo 컨트롤러");
		 
		 lecNoticeService.modifyLecNoticeOneCount(lecNoticeNo); 
		 LectureNotice lectureNotice = lecNoticeService.getLecNoticeOne(lecNoticeNo);
		 			
		 model.addAttribute("lectureNotice",lectureNotice); 
		 log.debug(TeamColor.BJH + lectureNotice + "상세보기 컨트롤러");
		 
		 return "/lecNoticeOne"; 
	 
	 }
	 
	
	 
	 
	 // 공지사항 업데이트
	 @GetMapping("/modifyLecNoticeOne") 
	 public String modifyLecNoticeOne(Model model, @RequestParam(value="lecNoticeNo") int lecNoticeNo) {
		 System.out.println(lecNoticeNo + " <-- 안떠?");
		 
		 LectureNotice lectureNotice = lecNoticeService.getLecNoticeOne(lecNoticeNo);
		 log.debug(TeamColor.BJH + lectureNotice+"<--lectureNotice");
		 
		 
		 model.addAttribute("lectureNotice", lectureNotice); 
		 log.debug(TeamColor.BJH + lectureNotice);
		 
		
		 return "modifyLecNoticeOne";
	 
	 }
	 
	 
	 @PostMapping("/modifyLecNoticeOne") 
	 public String modifyLecNoticeOne(LectureNotice lectureNotice) {
	
		 lecNoticeService.modifyLecNoticeOne(lectureNotice);
		 
		 log.debug(TeamColor.BJH + lectureNotice);
		 
	 
	 return "redirect:/lecNoticeOne";
	
	 }
	 
	 
	 
	 // 공지사항 삭제
	 @GetMapping("/removeLecNoticeOne") 
	 public String removeLecNoticeOne(@RequestParam(name="lecNoticeNo") int lecNoticeNo) {
	
		 lecNoticeService.removeLecNoticeOne(lecNoticeNo);
		 
		 log.debug(TeamColor.BJH + lecNoticeNo);
		 
	 return "redirect:/lecNoticeList/1"; 
	 
	 }
	 
	 
	 
	 // 공지사항 추가
	 
	 @GetMapping("/addLecNoticeOne") 
	 public String addLecNoticeOne(Model model, LectureNotice lectureNotice) {
		
		 model.addAttribute("lectureNotice", lectureNotice); 
		 
		 log.debug(TeamColor.BJH + lectureNotice + "add추가폼");	
	 
	 return "/addLecNoticeOne"; 
	 
	 }
		 
	 @PostMapping("/addLecNoticeOne")
	 public String addLecNoticeOne(LectureNotice lectureNotice) {
		 
		 int result = lecNoticeService.addLecNoticeOneAction(lectureNotice);
			
		 log.debug(TeamColor.BJH + result + "add추가액션");	
		 
	 return "redirect:/lecNoticeList/1";
	 
	 }
	
	 
}