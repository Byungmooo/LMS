package com.gd.LMS.controller;





import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.LMS.vo.TotalNotice;


@Controller
public class TotalNoticeController {

	// 전체공지사항 리스트보기
	
	@GetMapping("/TotalNoticeList")
	public String TotalNoticeList(TotalNotice totalNotice) {
		System.out.println("전체게시판 화면으로 이동");
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
