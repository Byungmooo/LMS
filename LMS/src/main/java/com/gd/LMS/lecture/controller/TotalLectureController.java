package com.gd.LMS.lecture.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	// 전체과목 보기 (직원기능)
	@GetMapping("/employee/totalLectureList")
	public String totalLectureList(PagingVo pagingVo, Model model, Map<String, Object> map,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "rowPerPage", defaultValue = "5") int rowPerPage,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "searchType", defaultValue = "") String searchType) {
		// 파라미터 설정
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		log.debug(TeamColor.LCH + "map > " + map);
		
		// 전체 강의 개수 및 페이징 변수 vo에 추가 후 디버깅
		int totalLectureCount = totalLectureService.getTotalLectureCount(map);
		log.debug(TeamColor.LCH + "count > " + totalLectureCount);
		
		// 이전 페이지 시작 글 번호와 현재 변경되는 페이지의 시작 글번호에 대한 일치 시키는거 많은 변경이 필요하므로 그냥 1로 처리함
		pagingVo = new PagingVo(currentPage, totalLectureCount, rowPerPage, keyword, searchType);
		if (pagingVo.getBeginRow() >= totalLectureCount) {
			pagingVo = new PagingVo(1, totalLectureCount, rowPerPage, keyword, searchType);
		}
		log.debug(TeamColor.KJS + "PagingVo : " + pagingVo);
		
		// 전체 부서이름 리스트에 담은 후 디버깅
		List<Map<String, Object>> list = totalLectureService.getTotalDepartmentName();
		log.debug(TeamColor.LCH + "list > " + list);
		
		// 리스트에 강의목록 담기
		List<Map<String, Object>> totalLectureList = totalLectureService.getTotalLectureList(pagingVo);
		
		// 모델에 담아서 페이지로 리턴
		model.addAttribute("department", list);
		model.addAttribute("paging", pagingVo);
		model.addAttribute("totalList", totalLectureList);

		return "lecture/totalLecture/totalLectureList";
	}
	
	@GetMapping("/employee/totalLectureOne")
	public String totalLectureOne(Model model
			, @RequestParam (value = "errorMsg", defaultValue = "") String errorMsg
			, @RequestParam (value = "lectureCode") int lectureCode) {
		log.debug(TeamColor.LCH + "--- totalLectureOne Controller GetMapping ---");
		
		Map<String, Object> map = totalLectureService.getTotalLectureOne(lectureCode);
		log.debug(TeamColor.LCH + "totalLectureOne > " + map);
		
		// error 처리
		if(!errorMsg.equals("")) {
			log.debug(TeamColor.LCH + "errorMsg > " + errorMsg);
			model.addAttribute("errorMsg", errorMsg);
		} else {
			model.asMap().clear();
		}
		
		model.addAttribute("map", map);
		
		return "lecture/totalLecture/totalLectureOne";
	}
	
	@GetMapping("/employee/addTotalLecture")
	public String addTotalLecture(Model model) {
		log.debug(TeamColor.LCH + "--- addTotalLecture Controller GetMapping ---");
		
		List<Map<String, Object>> list = totalLectureService.getTotalDepartmentName();
		log.debug(TeamColor.LCH + "departmentList > " + list);
		
		model.addAttribute("department", list);
		
		return "lecture/totalLecture/addTotalLecture";
	}
	
	@PostMapping("/employee/addTotalLecture")
	public String addTotalLecture(Model model, TotalLecture totalLecture, RedirectAttributes redirectAttributes) {
		log.debug(TeamColor.LCH + "--- addTotalLectureOne Controller PostMapping ---");
		
		log.debug(TeamColor.LCH + "totalLecture > " + totalLecture);
		
		int result = totalLectureService.addTotalLectureOne(totalLecture);
		log.debug(TeamColor.LCH + "result > " + result);
		
		redirectAttributes.addAttribute("lectureCode", result);
		return "redirect:/employee/totalLectureOne";
	}
	
	@GetMapping("/employee/modifyTotalLecture")
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
	
	@PostMapping("/employee/modifyTotalLecture")
	public String modifyTotalLecture(TotalLecture totalLecture, RedirectAttributes redirectAttributes) {
		log.debug(TeamColor.LCH + "--- modifyTotalLecture Controller PostMapping ---");
		
		log.debug(TeamColor.LCH + "totalLecture > " + totalLecture);
		
		int result = totalLectureService.modifyTotalLectureOne(totalLecture);
		log.debug(TeamColor.LCH + "result > " + result);
		
		redirectAttributes.addAttribute("lectureCode", totalLecture.getLectureCode());
		return "redirect:/employee/totalLectureOne";
	}
	
	@GetMapping("/employee/removeTotalLecture")
	public String removeTotalLecture(Model model, RedirectAttributes redirectAttributes
			, @RequestParam (value = "lectureCode") int lectureCode) {
		log.debug(TeamColor.LCH + "--- removeTotalLecture Controller GetMapping ---");
		
		log.debug(TeamColor.LCH + "lectureCode > " + lectureCode);
		
		// FK로 잡힌 테이블이 있는지 먼저 확인해야함
		List<String> checkFk = totalLectureService.getCheckFkOpenedLecture(lectureCode);
		log.debug(TeamColor.LCH + "checkFk 0? > " + checkFk.size());
		if(checkFk.size() != 0) {
			log.debug(TeamColor.LCH + "삭제실패 FK 존재");
			redirectAttributes.addAttribute("lectureCode", lectureCode);
			redirectAttributes.addAttribute("errorMsg", "진행중인 강의가 있어 삭제가 불가능합니다.");
			return "redirect:/employee/totalLectureOne";
		}
		
		int result = totalLectureService.removeTotalLectureOne(lectureCode);
		log.debug(TeamColor.LCH + "result > " + result);
		
		return "redirect:/employee/totalLectureList";
	}
	
}
