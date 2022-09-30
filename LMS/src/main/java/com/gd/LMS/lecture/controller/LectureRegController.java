package com.gd.LMS.lecture.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.lecture.service.LectureRegService;
import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.TotalLecture;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LectureRegController {
	@Autowired LectureRegService lectureRegService; 
	
	// 교수 강의신청 화면
	@GetMapping("/professor/professorLectureReg")
	public String professorLectureReg(PagingVo vo, Model model
			, @RequestParam(value="memberCode") int memberCode
			, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
			, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage
			, @RequestParam(value="keyword", defaultValue = "") String keyword) {
		log.debug(TeamColor.LCH + "professorLectureReg GetMapping Controller");
		
		// 해당 멤버코드 학부코드 받아오기
		String departmentCode = lectureRegService.getDepartmentCodeByMemberCode(memberCode);
		
		// 전체 학부강의 개수를 뽑을 파라미터 생성
		Map<String, Object> map = new HashMap<>();
		map.put("departmentCode", departmentCode);
		map.put("keyword", keyword);
		
		// 전체 학부강의 개수
		int totalDepLectureCount = lectureRegService.getTotalDepLectureCount(map);
		log.debug(TeamColor.LCH + "count > " + totalDepLectureCount);
		
		// 페이징 변수 계산
		vo = new PagingVo(currentPage, totalDepLectureCount, rowPerPage, keyword, null);
		log.debug(TeamColor.LCH + "vo > " + vo);
		
		// 전체 학부강의 리스트를 뽑을 파라미터 생성
		Map<String, Object> map2 = new HashMap<>();
		map2.put("beginRow", vo.getBeginRow());
		map2.put("rowPerPage", vo.getRowPerPage());
		map2.put("keyword", vo.getKeyword());
		map2.put("departmentCode", departmentCode);		
		
		// 전체 학부강의 리스트
		List<Map<String, Object>> totalDepLectureList = lectureRegService.getTotalDepLectureList(map2);
		log.debug(TeamColor.LCH + "totalDepLectureList > " + totalDepLectureList);
		
		model.addAttribute("totalDepLectureList", totalDepLectureList);
		model.addAttribute("paging", vo);
		
		return "lecture/professorLectureReg";
	}
	
	// 교수 강의신청 화면
	@GetMapping("/professor/professorAddLecture")
	public String professorLectureReg(Model model
			, @RequestParam(value="lectureCode") int lectureCode) {
		log.debug(TeamColor.LCH + "professorLectureReg GetMapping Controller");
		
		// 선택강의 정보 
		Map<String, Object> totalDepLectureOne = new HashMap<>();
		totalDepLectureOne = lectureRegService.getTotalDepLectureOne(lectureCode);
		
		model.addAttribute("map", totalDepLectureOne);
		
		
		return "lecture/lectureReg/professorAddLecture";
	}
}
