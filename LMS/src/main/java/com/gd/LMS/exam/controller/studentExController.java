package com.gd.LMS.exam.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.exam.service.studentExService;
import com.gd.LMS.utils.ExamList;
import com.gd.LMS.vo.ExamSheet;
import com.gd.LMS.vo.MultipleChoiceQuestion;
import com.gd.LMS.vo.MultipleExample;
import com.gd.LMS.vo.SubjectiveQuestion;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class studentExController {
	@Autowired
	studentExService studentExService;
	

	// 시험지 리스트
	@GetMapping(value = { "/exam/studentExList" })
	public String ExList(Model model) {
		log.debug(TeamColor.KBW + "--- StudentExList Controller GetMapping ---");

		// 교수코드 추후 수정예정
		int studentCode = 20;

		// 교수강의리스트 메서드 호출 후 리턴값 디버깅
		List<Map<String, Object>> studentExList = studentExService.getExList(studentCode);
		log.debug(TeamColor.KBW + "studentExList (controller) > " + studentExList);

		model.addAttribute("studentExlist", studentExList);

		return "exam/studentExList";
	}	
	
	
	// 시험지 상세보기
	@GetMapping(value = "/exam/studentExList/{examNo}")
	public String ExOneForm(Model model, @PathVariable(value = "examNo") int examNo, HttpSession session) {
		

		// 여기서 막아서 리턴
		Map<String, Object> map = new HashMap<>();
		map.put("studentCode", session.getAttribute("memberCode"));
		map.put("openedLecNo", session.getAttribute("openedLecNo"));
		log.debug(TeamColor.KBW + "map:" +map);
		
		List<Map<String,Object>> list = studentExService.getExPossible(map);
		log.debug(TeamColor.KBW + "list:" +list);
		
		if((int)list.get(0).get("examScore") >= 0) {
			log.debug(TeamColor.KBW + "size o" );
			return "redirect:/exam/studentExList";
		}
		

		
		log.debug(TeamColor.KBW + "--- studentExOne(시험지상세보기) Controller GetMapping ---");
		// 시험지
		ExamSheet examSheet = studentExService.getExamSheet(examNo);
		log.debug(TeamColor.KBW + "examSheet (controller) > " + examNo);
		// 객관식문제
		List<MultipleChoiceQuestion> multipleQ = studentExService.getMultipleChoiceQuestion(examNo);
		log.debug(TeamColor.KBW + "MultipleChoiceQuestion (controller) > " + examNo);
		// 객관식문제보기
		List<MultipleExample> multipleEx = studentExService.getMultipleExample(examNo);
		log.debug(TeamColor.KBW + "MultipleExample (controller) > " + examNo);

		// 주관식문제
		List<SubjectiveQuestion> subjectiveQ = studentExService.getSubjectiveQuestion(examNo);
		log.debug(TeamColor.KBW + "SubjectiveQuestion (controller) > " + examNo);

		// 시험지
		model.addAttribute("examSheet", examSheet);
		log.debug(TeamColor.KBW + "examSheet (controller) > " + examSheet);
		// 객관식문제
		model.addAttribute("multipleQ", multipleQ);
		log.debug(TeamColor.KBW + "multipleQ (controller) > " + multipleQ);
		// 객관식문제 보기(1~4번)
		model.addAttribute("multipleEx", multipleEx);
		log.debug(TeamColor.KBW + "multipleEx (controller) > " + multipleEx);
		// 주관식문제
		model.addAttribute("subjectiveQ", subjectiveQ);
		log.debug(TeamColor.KBW + "subjectiveQ (controller) > " + subjectiveQ);

		log.debug(TeamColor.KBW + "arrayUsCHECK!!>>" + multipleQ);

		return "/exam/studentExOne";
	}	
	
	
	//제출된 시험지
	@PostMapping("/exam/complateExamSheet")
	public String ExOne(@RequestParam(value = "examNo") int examNo
			, ExamList examList
			, RedirectAttributes redirectAttributes
			, Model model
			, HttpSession session) {
		log.debug(TeamColor.KBW + "---ExComplate Postmapping");
		log.debug(TeamColor.KBW + "exMq / Sq > " + examList);
		log.debug(TeamColor.KBW + "examNo > " + examNo);
		
		ExamSheet examSheet = studentExService.getExamSheet(examNo);
		List<MultipleChoiceQuestion> multipleQ = studentExService.getMultipleChoiceQuestion(examNo);
		List<MultipleExample> multipleEx = studentExService.getMultipleExample(examNo);
		List<SubjectiveQuestion> subjectiveQ = studentExService.getSubjectiveQuestion(examNo);


		List<Map<String, Object>> list = new ArrayList<>();
		
		Map<String, Object> map = null;
		
		for(int i=0; i<multipleQ.size(); i++) {
			map = new HashMap<>();
			map.put("multipleQ", multipleQ.get(i));
			map.put("answer", map);
			
			list.add(map);
		}
		
		model.addAttribute("examSheet", examSheet);
		model.addAttribute("multipleQ", multipleQ);
		model.addAttribute("multipleEx", multipleEx);
		model.addAttribute("subjectiveQ", subjectiveQ);
		
		
		int [] exMq = {Integer.parseInt(examList.getExMq1()),Integer.parseInt(examList.getExMq2()),Integer.parseInt(examList.getExMq3()),
							Integer.parseInt(examList.getExMq4()),Integer.parseInt(examList.getExMq5()),};
		//int [] exMq = {examList.getExMq1(),examList.getExMq2(),examList.getExMq3(),examList.getExMq4(),examList.getExMq5(),};
		
		int multipleScore = 0;
		int subjectiveScore = 0;
		for(int i=0; i<multipleQ.size(); i++) {
			int x = Integer.parseInt(String.valueOf((multipleQ.get(i).getMultipleAnswer())));
			
			if(x == exMq[i]) {
				multipleScore += multipleQ.get(i).getQuestionPoint();
			}
			 
		}
		for(int i=0;i<subjectiveQ.size();i++) {
			log.debug(TeamColor.KBW+"subjective정답:" + subjectiveQ.get(i).getSubjectiveAnswer());
			
			if(subjectiveQ.get(i).getSubjectiveAnswer().equals(examList.getExSq()[i])) {
				subjectiveScore += subjectiveQ.get(i).getQuestionPoint();
			}
		}
		
		log.debug(TeamColor.KBW + "multipleScore > " + multipleScore);
		log.debug(TeamColor.KBW + "subjectiveScore >" +subjectiveScore);
		
		int score = multipleScore+subjectiveScore;
		Map<String, Object> map1 = new HashMap<>();
		map1.put("studentCode", session.getAttribute("memberCode"));
		map1.put("openedLecNo", session.getAttribute("openedLecNo"));
		map1.put("score", score);
		
		
		int Score = studentExService.getScore(map1);
		log.debug(TeamColor.KBW + "Score(Service호출여부)" + Score);
		
		//redirectAttributes.addAttribute("examList", examList.toString());
		model.addAttribute("examList",examList);
		log.debug(TeamColor.KBW + "examList : " + examList);
		//redirectAttributes.addAttribute("score", score);
		model.addAttribute("score",score);
		log.debug(TeamColor.KBW + "score : " + score);
		redirectAttributes.addAttribute("examNo", examNo);
		log.debug(TeamColor.KBW + "examNo : " + examNo);
		return "/exam/complateExamSheet";
	}

	
}
