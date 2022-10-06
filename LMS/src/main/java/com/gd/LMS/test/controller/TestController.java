package com.gd.LMS.test.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.test.service.TestService;
import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.LectureNotice;
import com.gd.LMS.vo.TotalNotice;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TestController {
	@Autowired TestService testService;
	
	@GetMapping("/testList")
	public String testList(PagingVo vo, Model model
			, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
			, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage
			, @RequestParam(value="keyword", defaultValue = "") String keyword
			, @RequestParam(value="searchType", defaultValue = "") String searchType) {
		
		
		
		
		int totalCount = testService.countBoard(keyword, searchType);
		log.debug(TeamColor.LCH + "current/rowPer/total : " + currentPage + "/" + rowPerPage + "/" + totalCount);
		
		vo = new PagingVo(currentPage, totalCount, rowPerPage, keyword, searchType);
		log.debug(TeamColor.LCH + "PaginVo : " + vo);
		
		List<TotalNotice> list = testService.selectBoard(vo);
		log.debug(TeamColor.LCH + "noticeList : " + list);
		
		model.addAttribute("paging", vo);
		model.addAttribute("list", list);

		return "test/testList";
	}
	
	@GetMapping("/testNoticeOne")
	public String testNoticeOne(Model model, @RequestParam(value="noticeNo") int noticeNo) {
		LectureNotice noticeOne = testService.getNoticeOne(noticeNo);
		
		model.addAttribute("one", noticeOne);
		
		return "test/testNoticeOne";
	}
	
	@GetMapping("/addNotice")
	public String addNotice() {
		return "addNotice";
	}
	
	@PostMapping("/addNotice")
	public String addNotice(LectureNotice noticeNo) {
		
		int row = testService.addNotice(noticeNo);
		
		System.out.println(row);
		
		return "redirect:/test/testNoticeOne?" + row;
	}
	
	@GetMapping("/testReg")
	public String testReg() {
		
		return "test/testReg";
	}
	
	@GetMapping("/testLink")
	public String testLink() {
		
		return "test/testLink";
	}
	
	@GetMapping("/addTestLink")
	public String addTestLink(@RequestParam(value="clubNo") int clubNo
			, @RequestParam(value="studentNo") int studentNo) {
		
		log.debug(TeamColor.LCH + "no > " + clubNo + "/" + studentNo);
		
		return "redirect:/testLink";
	}
	
	@GetMapping("/removeTestLink")
	public String removeTestLink(@RequestParam(value="clubNo") int clubNo
			, @RequestParam(value="studentNo") int studentNo) {
		
		log.debug(TeamColor.LCH + "no > " + clubNo + "/" + studentNo);
		
		return "redirect:/testLink";
	}
	
	@PostMapping("/testPost")
	public @ResponseBody String testPost(
			@RequestParam (value = "aNo") String aNo,
			@RequestParam (value = "bNo") String bNo) {
		log.debug(TeamColor.LCH + "--- testPost Controller PostMapping ---");
		
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "aNo (controller) > " + aNo);
		log.debug(TeamColor.LCH + "bNo (controller) > " + bNo);
		
		// ajax Json에 보낼 메시지
		String returnJson = "y";

		
		return returnJson;
	}
	
	@PostMapping("/linkPost")
	public @ResponseBody String linkPost(
			@RequestParam (value = "aNo") String aNo,
			@RequestParam (value = "bNo") String bNo) {
		log.debug(TeamColor.LCH + "--- testPost Controller PostMapping ---");
		
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "aNo (controller) > " + aNo);
		log.debug(TeamColor.LCH + "bNo (controller) > " + bNo);
		
		// ajax Json에 보낼 메시지
		String returnJson = "y";

		
		return returnJson;
	}
}
