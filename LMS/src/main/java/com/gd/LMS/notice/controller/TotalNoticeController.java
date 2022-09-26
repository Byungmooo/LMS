package com.gd.LMS.notice.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.notice.service.TotalNoticeService;
import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.TotalNotice;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TotalNoticeController {
	@Autowired
	TotalNoticeService totalNoticeService;

	// 전체공지 목록 리스트
	@GetMapping(value = { "/totalNotice" })
	public String totalNoticeList(PagingVo vo, Model model, HttpSession session, Map<String, Object> map,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "searchType", defaultValue = "") String searchType) {

		String memberDepartmentCode = (String) session.getAttribute("memberDepartmentCode");
		log.debug(TeamColor.LCH + "memberDepartmentCode > " + memberDepartmentCode);

		map.put("departmentCode", memberDepartmentCode);
		map.put("keyword", keyword);
		map.put("searchType", searchType);

		log.debug(TeamColor.LCH + "map1 > " + map);

		int totalCount = totalNoticeService.countBoard(map);
		log.debug(TeamColor.KJS + "current/rowPer/total : " + currentPage + "/" + rowPerPage + "/" + totalCount);

		vo = new PagingVo(currentPage, totalCount, rowPerPage, keyword, searchType);
		// 이전 페이지 시작 글 번호와 현재 변경되는 페이지의 시작 글번호에 대한 일치 시키는거 많은 변경이 필요하므로 그냥 1로 처리함
		if (vo.getBeginRow() >= totalCount) {
			vo = new PagingVo(1, totalCount, rowPerPage, keyword, searchType);
		}
		log.debug(TeamColor.KJS + "PagingVo : " + vo);

		map.put("beginRow", vo.getBeginRow());
		map.put("rowPerPage", vo.getRowPerPage());

		log.debug(TeamColor.KJS + "map2 > " + map);

		List<TotalNotice> list = totalNoticeService.selectBoard(map);
		log.debug(TeamColor.KJS + "noticeList : " + list);

		model.addAttribute("paging", vo);
		model.addAttribute("list", list);

		log.debug(TeamColor.KJS + " [김진수] 전체공지 리스트");
		return "/notice/totalNotice/totalNoticeList";
	}

	// 부서공지 리스트
	@GetMapping(value = { "/departmentNotice" })
	public String departmentNoticeList(PagingVo vo, Model model, HttpSession session, Map<String, Object> map,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "searchType", defaultValue = "") String searchType) {

		String memberDepartmentCode = (String) session.getAttribute("memberDepartmentCode");
		log.debug(TeamColor.LCH + "memberDepartmentCode > " + memberDepartmentCode);

		map.put("departmentCode", memberDepartmentCode);
		map.put("keyword", keyword);
		map.put("searchType", searchType);

		log.debug(TeamColor.KJS + "map1 > " + map);

		int totalCount = totalNoticeService.countBoard(map);
		log.debug(TeamColor.KJS + "current/rowPer/total : " + currentPage + "/" + rowPerPage + "/" + totalCount);

		vo = new PagingVo(currentPage, totalCount, rowPerPage, keyword, searchType);
		log.debug(TeamColor.KJS + "PaginVo : " + vo);

		map.put("memberDcode", memberDepartmentCode);
		map.put("beginRow", vo.getBeginRow());
		map.put("rowPerPage", vo.getRowPerPage());

		log.debug(TeamColor.KJS + "map2 > " + map);

		List<TotalNotice> list = totalNoticeService.selectBoard2(map);
		log.debug(TeamColor.KJS + "noticeList : " + list);

		model.addAttribute("paging", vo);
		model.addAttribute("list", list);

		log.debug(TeamColor.KJS + " [김진수] 부서공지 리스트");
		return "/notice/totalNotice/totalNoticeList";
	}

	// 전체공지사항 상세보기
	@GetMapping(value = "/totalNotice/{noticeNo}")
	public String totalNoticeOne(Model model, @PathVariable(value = "noticeNo") int noticeNo) {

		TotalNotice totalNotice = totalNoticeService.getTotalNotice(noticeNo);

		totalNoticeService.updateTotalNoticeCount(noticeNo);

		model.addAttribute("totalNotice", totalNotice);

		log.debug(TeamColor.KJS + " [김진수] 전체공지 상세보기");

		return "/notice/totalNotice/totalNoticeOne";
	}

	// 전체공지사항 추가 페이지 이동
	@GetMapping("/addTotalNotice")
	public String addTotalNotice() {
		log.debug(TeamColor.KJS + " [김진수] 전체공지 추가 페이지 이동");
		return "/notice/totalNotice/addTotalNotice";
	}

	// 전체공지사항 추가
	@PostMapping("/addTotalNotice")
	public String addTotalNotice(TotalNotice totalNotice) {
		int count = totalNoticeService.addTotalNotice(totalNotice);
		if (count >= 1) {
			log.debug(TeamColor.KJS + " [김진수] 전체공지 추가");
			return "redirect:totalNotice";
		}
		return "/notice/totalNotice/addTotalNotice";
	}

	// 전체공지사항 수정 페이지 이동
	@GetMapping("/updateTotalNotice/{noticeNo}")
	public String updateTotalNotice(Model model, @PathVariable(value = "noticeNo") int noticeNo) {
		TotalNotice totalNotice = totalNoticeService.getTotalNotice(noticeNo);
		model.addAttribute("totalNotice", totalNotice);
		log.debug(TeamColor.KJS + " [김진수] 전체공지 수정 페이지 이동");
		return "/notice/totalNotice/updateTotalNotice";
	}

	// 전체공지사항 수정
	@PostMapping("/updateTotalNotice")
	public String updateTotalNotice(TotalNotice totalNotice) {
		int count = totalNoticeService.updateTotalNotice(totalNotice);
		if (count >= 1) {
			log.debug(TeamColor.KJS + " [김진수] 전체공지 수정");
			return "redirect:totalNotice/" + totalNotice.getNoticeNo();
		}
		return "redirect:updateTotalNotice/" + totalNotice.getNoticeNo();
	}

	@GetMapping(value = "/removeTotalNotice")
	public String totalNoticeOne(@RequestParam(value = "noticeNo") int noticeNo) {
		int count = totalNoticeService.deleteTotalNotice(noticeNo);
		if (count >= 1) {
			log.debug(TeamColor.KJS + " [김진수] 전체공지 삭제");
			return "redirect:totalNotice";
		}
		return "redirect:totalNotice/" + noticeNo;
	}
}
