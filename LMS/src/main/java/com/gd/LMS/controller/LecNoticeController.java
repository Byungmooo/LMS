package com.gd.LMS.controller;



import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.service.LecNoticeService;
import com.gd.LMS.vo.LectureNotice;
import com.gd.LMS.vo.Member;


@Controller
public class LecNoticeController {

	@Autowired LecNoticeService lecNoticeService;
	
	//공지리스트
	@GetMapping("/lecNoticeList/{currentPage}")
	public String lecNoticeList(Model model, HttpSession session,
			@PathVariable(name="currentPage") int currentPage){
	
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
		System.out.println(TeamColor.BJH + lecNoticeList + TeamColor.RESET);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);

		System.out.println(TeamColor.BJH + currentPage + TeamColor.RESET);
		System.out.println(TeamColor.BJH + lastPage + TeamColor.RESET);
		
		
		return "/lecNoticeList";
	}
	
	
	
	 // 공지사항 상세보기
	 @GetMapping("/lecNoticeOne/{lecNoticeNo}")
	 public String lecNoticeOne(Model model, 
			 @PathVariable(name="lecNoticeNo") int lecNoticeNo) {
		 
		 lecNoticeService.modifyLecNoticeOneCount(lecNoticeNo); 
		 LectureNotice lectureNotice = lecNoticeService.getLecNoticeOne(lecNoticeNo);
		 			
		 model.addAttribute("lectureNotice",lectureNotice); 
		 System.out.println(TeamColor.BJH + lectureNotice);
		 
	 return "/lecNoticeOne"; 
	 
	 }
	 
	 // 공지사항 업데이트
	 @GetMapping("/modifyLecNoticeOne/{lectNoticeNo}") 
	 public String modifyLecNoticeOne(Model model, @PathVariable(name="lecNoticeNo") int lecNoticeNo) {
	
		 LectureNotice lectureNotice = lecNoticeService.getLecNoticeOne(lecNoticeNo);
	 
		 model.addAttribute("lectureNotice", lectureNotice); 
		 
		 System.out.println(TeamColor.BJH + lectureNotice);
		 
		 
	 return "/modifyLecNoticeOne";
	 
	 
	 }
	  
	 @PostMapping("/modifyLecNotice") 
	 public String modifyLecNotice(LectureNotice lectureNotice) {
	
		 lecNoticeService.modifyLecNoticeOne(lectureNotice);
		 
		 System.out.println(TeamColor.BJH + lectureNotice);
		 
	 
	 return "redirect:/modifyLecNotice+"+lectureNotice.getLecNoticeNo();
	
	 }
	 
	 
	 
	 // 공지사항 삭제
	 @GetMapping("/removeLecNoticeOne/{lectureNotice}") 
	 public String removeLecNoticeOne(@PathVariable(name="lecNoticeNo") int lecNoticeNo) {
	
		 lecNoticeService.removeLecNoticeOne(lecNoticeNo);
		 
		 System.out.println(TeamColor.BJH + lecNoticeNo);
		 
	 return "redirect:/lecNoticeList/1"; 
	 
	 }
	 
	 // 공지사항 추가
	 
	 @GetMapping("/addLecNoticeOne") 
	 public String addLecNoticeOne(Model model, LectureNotice lectureNotice) {
		
		 model.addAttribute("l", lectureNotice); 
		 
		 System.out.println(TeamColor.BJH + lectureNotice);	
	 
	 return "/addLecNoticeOne"; 
	 
	 }
		 
	 @PostMapping("/addLecNoticeOne")
	 public String addLecNoticeOne(LectureNotice lectureNotice) {
		 
		 int result = lecNoticeService.addLecNoticeOneAction(lectureNotice);
			
		 System.out.println(TeamColor.BJH + result);	
		 
	 return "redirect:/lecNoticeList/1";
	 
	 }
	
	 
}package com.gd.LMS.controller;



import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.service.LecNoticeService;
import com.gd.LMS.vo.LectureNotice;
import com.gd.LMS.vo.Member;


@Controller
public class LecNoticeController {

	@Autowired LecNoticeService lecNoticeService;
	
	//공지리스트
	@GetMapping("/lecNoticeList/{currentPage}")
	public String lecNoticeList(Model model, HttpSession session,
			@PathVariable(name="currentPage") int currentPage){
	
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
		System.out.println(TeamColor.BJH + lecNoticeList + TeamColor.RESET);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);

		System.out.println(TeamColor.BJH + currentPage + TeamColor.RESET);
		System.out.println(TeamColor.BJH + lastPage + TeamColor.RESET);
		
		
		return "/lecNoticeList";
	}
	
	
	
	 // 공지사항 상세보기
	 @GetMapping("/lecNoticeOne/{lecNoticeNo}")
	 public String lecNoticeOne(Model model, 
			 @PathVariable(name="lecNoticeNo") int lecNoticeNo) {
		 
		 lecNoticeService.modifyLecNoticeOneCount(lecNoticeNo); 
		 LectureNotice lectureNotice = lecNoticeService.getLecNoticeOne(lecNoticeNo);
		 			
		 model.addAttribute("lectureNotice",lectureNotice); 
		 System.out.println(TeamColor.BJH + lectureNotice);
		 
	 return "/lecNoticeOne"; 
	 
	 }
	 
	 // 공지사항 업데이트
	 @GetMapping("/modifyLecNoticeOne/{lectNoticeNo}") 
	 public String modifyLecNoticeOne(Model model, @PathVariable(name="lecNoticeNo") int lecNoticeNo) {
	
		 LectureNotice lectureNotice = lecNoticeService.getLecNoticeOne(lecNoticeNo);
	 
		 model.addAttribute("lectureNotice", lectureNotice); 
		 
		 System.out.println(TeamColor.BJH + lectureNotice);
		 
		 
	 return "/modifyLecNoticeOne";
	 
	 
	 }
	  
	 @PostMapping("/modifyLecNotice") 
	 public String modifyLecNotice(LectureNotice lectureNotice) {
	
		 lecNoticeService.modifyLecNoticeOne(lectureNotice);
		 
		 System.out.println(TeamColor.BJH + lectureNotice);
		 
	 
	 return "redirect:/modifyLecNotice+"+lectureNotice.getLecNoticeNo();
	
	 }
	 
	 
	 
	 // 공지사항 삭제
	 @GetMapping("/removeLecNoticeOne/{lectureNotice}") 
	 public String removeLecNoticeOne(@PathVariable(name="lecNoticeNo") int lecNoticeNo) {
	
		 lecNoticeService.removeLecNoticeOne(lecNoticeNo);
		 
		 System.out.println(TeamColor.BJH + lecNoticeNo);
		 
	 return "redirect:/lecNoticeList/1"; 
	 
	 }
	 
	 // 공지사항 추가
	 
	 @GetMapping("/addLecNoticeOne") 
	 public String addLecNoticeOne(Model model, LectureNotice lectureNotice) {
		
		 model.addAttribute("l", lectureNotice); 
		 
		 System.out.println(TeamColor.BJH + lectureNotice);	
	 
	 return "/addLecNoticeOne"; 
	 
	 }
		 
	 @PostMapping("/addLecNoticeOne")
	 public String addLecNoticeOne(LectureNotice lectureNotice) {
		 
		 int result = lecNoticeService.addLecNoticeOneAction(lectureNotice);
			
		 System.out.println(TeamColor.BJH + result);	
		 
	 return "redirect:/lecNoticeList/1";
	 
	 }
	
	 
}