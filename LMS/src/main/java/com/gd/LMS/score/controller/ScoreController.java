package com.gd.LMS.score.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.score.service.ScoreService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ScoreController {
	@Autowired ScoreService scoreService;
	
	//학생 점수 리스트
	@GetMapping("/score/studentScoreListForm")
	public String studentScoreList(Model model, HttpSession session,
			@RequestParam(value = "memberCode") int memberCode) {
		log.debug(TeamColor.KBW + "--- studentScoreList Controller GetMapping ---");

		// 학생수강리스트 메서드 호출 후 리턴값 디버깅
		List<Map<String, Object>> studentScoreList = scoreService.getStudentScoreList(memberCode);
		log.debug(TeamColor.KBW + "studentScoreList (controller) > " + studentScoreList);

		session.setAttribute("memberCode", memberCode);
		model.addAttribute("list", studentScoreList);
		return "score/studentScoreList";
	}
	
	@PostMapping("/score/studentScoreAction")
	public String studentScoreAction(Model model, HttpSession session,
			@RequestParam(value="memberCode") int memberCode,
			@RequestParam(value="openedLecNo") int openedLecNo) {
		
	
			
		return "score/studentScoreList";
	}
}
