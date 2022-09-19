package com.gd.LMS.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.LMS.test.service.TestService;
import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.LectureNotice;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TestController {
	@Autowired TestService testService;
	
	@GetMapping("/test/testList")
	public String testList(PagingVo vo, Model model
			, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
			, @RequestParam(value="rowPerPage", defaultValue = "5") int rowPerPage
			, @RequestParam(value="keyword", defaultValue = "") String keyword
			, @RequestParam(value="searchType", defaultValue = "") String searchType) {
		
		
		int totalCount = testService.countBoard(keyword, searchType);
		
		System.out.println(currentPage + " / " + rowPerPage + " / " + totalCount);
		
		vo = new PagingVo(currentPage, totalCount, rowPerPage, keyword, searchType);
		
		System.out.println(vo.toString());
		
		model.addAttribute("paging", vo);
		model.addAttribute("viewAll", testService.selectBoard(vo));
		
		System.out.println(testService.selectBoard(vo));
		
		return "test/testList";
	}
	
	@GetMapping("/test/testNoticeOne")
	public String testNoticeOne(Model model, @RequestParam(value="lecNoticeNo") int lecNoticeNo) {
		LectureNotice lectureNotice = testService.getNoticeOne(lecNoticeNo);
		
		model.addAttribute("one", lectureNotice);
		
		return "test/testNoticeOne";
	}
	
	@GetMapping("/test/addNotice")
	public String addNotice() {
		return "addNotice";
	}
	
	@PostMapping("/test/addNotice")
	public String addNotice(LectureNotice lectureNotice) {
		
		int row = testService.addNotice(lectureNotice);
		
		System.out.println(row);
		
		return "redirect:/test/testNoticeOne?" + row;
	}
}
