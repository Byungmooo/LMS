package com.gd.LMS.controller;





import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.LMS.service.TotalNoticeService;
import com.gd.LMS.vo.TotalNotice;

@Controller
public class TotalNoticeController {
	@Autowired
	TotalNoticeService noticeService;

	// 전체공지 목록 리스트
	@GetMapping("/TotalNoticeList")
	public String TotalnNoticeList(Model model) {

		List<Map<String, Object>> list = noticeService.getTotalNoticeList();
		// model 데이터 세팅
		model.addAttribute("list", list);

		return "TotalNoticeList"; 
	}
	
	// 전체공지사항 상세보기
	
	@GetMapping("/TotalNoticeOne")
	public String TotalNoticeOne(TotalNotice totalNotice) {
		System.out.println("게시판 화면으로 이동");
		return "TotalNoticeOne";
	}
	
	// 전체공지사항 추가하기
	
	@GetMapping("/TotalNoticeAdd")
	public String TotalNoticeAdd(TotalNotice totalNotice) {
		System.out.println("noticeForm 컨트롤러 작동");
		return "TotalNoticeAdd";
	}
}
