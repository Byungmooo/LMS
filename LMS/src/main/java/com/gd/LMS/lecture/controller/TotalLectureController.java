package com.gd.LMS.lecture.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.lecture.service.TotalLectureService;
import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.TotalLecture;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TotalLectureController {
	@Autowired TotalLectureService totalLectureService;
	
	// 직원 전체과목 보기
	@GetMapping("/totalLectureList")
	public String totalLectureList(PagingVo vo, Model model,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
			@RequestParam(value = "keyword", defaultValue = "") String keyword) {
		int totalLectureCount = totalLectureService.getTotalLectureCount(keyword);
		vo = new PagingVo(currentPage, totalLectureCount, rowPerPage, keyword, null);

		log.debug(TeamColor.LCH + "count > " + totalLectureCount);
		log.debug(TeamColor.LCH + "vo > " + vo);

		List<Map<String, Object>> totalLectureList = totalLectureService.getTotalLectureList(vo);

		model.addAttribute("paging", vo);
		model.addAttribute("totalList", totalLectureList);

		return "lecture/totalLecture/totalLectureList";
	}
	
	@GetMapping("/totalLectureOne")
	public String totalLectureOne(Model model, @RequestParam (value = "lectureCode") int lectureCode) {
		log.debug(TeamColor.LCH + "--- totalLectureOne Controller GetMapping ---");
		
		Map<String, Object> map = totalLectureService.getTotalLectureOne(lectureCode);
		log.debug(TeamColor.LCH + "totalLectureOne > " + map);
		
		model.addAttribute("map", map);
		
		return "lecture/totalLecture/totalLectureOne";
	}
	
	@GetMapping("/addTotalLecture")
	public String addTotalLecture(Model model) {
		log.debug(TeamColor.LCH + "--- addTotalLecture Controller GetMapping ---");
		
		List<Map<String, Object>> list = totalLectureService.getTotalDepartmentName();
		log.debug(TeamColor.LCH + "departmentList > " + list);
		
		model.addAttribute("department", list);
		
		return "lecture/totalLecture/addTotalLectureOne";
	}
	
	@PostMapping("/addTotalLecture")
	public String addTotalLecture(Model model, TotalLecture totalLecture, RedirectAttributes redirectAttributes) {
		log.debug(TeamColor.LCH + "--- addTotalLectureOne Controller PostMapping ---");
		
		log.debug(TeamColor.LCH + "totalLecture > " + totalLecture);
		
		int result = totalLectureService.addTotalLectureOne(totalLecture);
		log.debug(TeamColor.LCH + "result > " + result);
		
		redirectAttributes.addAttribute("lectureCode", result);
		return "redirect:/totalLectureOne";
	}
	
	@GetMapping("/modifyTotalLecture")
	public String modifyTotalLecture(Model model, @RequestParam (value = "lectureCode") int lectureCode) {
		log.debug(TeamColor.LCH + "--- modifyTotalLecture Controller GetMapping ---");
		
		Map<String, Object> map = totalLectureService.getTotalLectureOne(lectureCode);
		log.debug(TeamColor.LCH + "totalLectureOne > " + map);
		
		List<Map<String, Object>> list = totalLectureService.getTotalDepartmentName();
		log.debug(TeamColor.LCH + "departmentList > " + list);
		
		model.addAttribute("department", list);
		model.addAttribute("map", map);

		return "lecture/totalLecture/modifyTotalLecture";
	}
	
	@PostMapping("/modifyTotalLecture")
	public String modifyTotalLecture(TotalLecture totalLecture, RedirectAttributes redirectAttributes) {
		log.debug(TeamColor.LCH + "--- modifyTotalLecture Controller PostMapping ---");
		
		log.debug(TeamColor.LCH + "totalLecture > " + totalLecture);
		
		int result = totalLectureService.modifyTotalLectureOne(totalLecture);
		log.debug(TeamColor.LCH + "result > " + result);
		
		redirectAttributes.addAttribute("lectureCode", totalLecture.getLectureCode());
		return "redirect:/totalLectureOne";
	}
	
	@GetMapping("/removeTotalLecture")
	public String removeTotalLecture(@RequestParam (value = "lectureCode") int lectureCode) {
		log.debug(TeamColor.LCH + "--- removeTotalLecture Controller GetMapping ---");
		
		log.debug(TeamColor.LCH + "lectureCode > " + lectureCode);
		
		int result = totalLectureService.removeTotalLectureOne(lectureCode);
		log.debug(TeamColor.LCH + "result > " + result);
		
		return "redirect:/totalLectureList";
	}
	
}
