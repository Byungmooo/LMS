package com.gd.LMS.student.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.student.service.LecNoticeService;
import com.gd.LMS.vo.LectureNotice;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LecNoticeController {

	@Autowired LecNoticeService lecNoticeService;
	
	//공지리스트
	@GetMapping("/lecNoticeList")
	 public String lecNoticeList(Model model, 
			 @RequestParam(value="lecNoticeNo") int lecNoticeNo) {
		
	return "lecNoticeList";
		
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