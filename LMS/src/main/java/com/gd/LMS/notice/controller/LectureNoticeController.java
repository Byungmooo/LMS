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
import com.gd.LMS.notice.service.LectureNoticeService;
import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.LectureNotice;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LectureNoticeController {

	@Autowired
	LectureNoticeService lecNoticeService;

	   //강의공지 목록 리스트
    @GetMapping(value = {"/student/lecNotice"})
    public String LecturenNoticeList(PagingVo vo, Model model, HttpSession session, Map<String, Object> map
          , @RequestParam(value="currentPage", defaultValue = "1") int currentPage
         , @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage
         , @RequestParam(value="keyword", defaultValue = "") String keyword
         , @RequestParam(value="searchType", defaultValue = "") String searchType){
        

        map.put("keyword", keyword);
        map.put("searchType", searchType);
        map.put("openedLecNo", session.getAttribute("openedLecNo"));
      
        int totalCount = lecNoticeService.countBoard(map);
      log.debug(TeamColor.KJS + "current/rowPer/total : " + currentPage + "/" + rowPerPage + "/" + totalCount);
      

       vo = new PagingVo(currentPage, totalCount, rowPerPage, keyword, searchType);
        // 이전 페이지 시작 글 번호와 현재 변경되는 페이지의 시작 글번호에 대한 일치 시키는거 많은 변경이 필요하므로 그냥 1로 처리함
        if(vo.getBeginRow() >= totalCount){
            vo = new PagingVo(1, totalCount, rowPerPage, keyword, searchType);
        }

        log.debug(TeamColor.KJS + "PagingVo : " + vo);

        map.put("beginRow", vo.getBeginRow());
        map.put("rowPerPage", vo.getRowPerPage());
        
        log.debug(TeamColor.KJS + "map2 > " + map);
        
      List<LectureNotice> list = lecNoticeService.selectBoard(map);
      log.debug(TeamColor.KJS + "noticeList : " + list);
      
      model.addAttribute("paging", vo);
      model.addAttribute("list", list);
        
        
        log.debug(TeamColor.KJS + " [김진수] 학부공지 리스트");
        return "/notice/lectureNotice/lecNoticeList";
    }

	// 강의공지 상세보기
	@GetMapping(value = "/lecNotice/{lecNoticeNo}")
	public String TotalNoticeOne(Model model, @PathVariable(value = "lecNoticeNo") int lecNoticeNo) {
		log.debug(TeamColor.KJS);
		LectureNotice lecNotice = lecNoticeService.getLecNoticeList(lecNoticeNo);
		lecNoticeService.updateLecNoticeCount(lecNoticeNo);
		model.addAttribute("lectureNotice", lecNotice);
		log.debug(TeamColor.KJS + lecNotice + " [김진수] 학부공지 상세보기");
		return "/notice/lectureNotice/lecNoticeOne";
	}

	// 강의공지 추가 페이지 이동
	@GetMapping("/addLecNotice")
	public String addLecNotice() {
		log.debug(TeamColor.KJS + " [김진수] 학부공지 추가 페이지 이동");
		return "/notice/lectureNotice/addLecNotice";
	}

	// 강의공지 추가
	@PostMapping("/addLecNotice")
	public String addLecNotice(LectureNotice lectureNotice) {
		int num = 1;
		lectureNotice.setOpenedLecNo(num);
		int count = lecNoticeService.addLecNotice(lectureNotice);
		if (count >= 1) {
			log.debug(TeamColor.KJS + " [김진수] 학부공지 추가");
			return "redirect:/lecNotice";
		}
		return "/notice/lectureNotice/addLecNotice";
	}

	// 강의공지 수정 페이지 이동
	@GetMapping("/updateLecNotice/{lecNoticeNo}")
	public String updateLecNotice(Model model, @PathVariable(value = "lecNoticeNo") int lecNoticeNo) {
		log.debug(TeamColor.KJS + lecNoticeNo);
		LectureNotice lecNotice = lecNoticeService.getLecNoticeList(lecNoticeNo);
		model.addAttribute("LectureNotice", lecNotice);
		log.debug(TeamColor.KJS + " [김진수] 학부공지 수정 페이지 이동");
		return "/notice/lectureNotice/updateLecNotice";
	}

	// 강의공지 수정
	@PostMapping("/updateLecNotice")
	public String updateLecNotice(LectureNotice lectureNotice) {
		int num = 1;
		lectureNotice.setOpenedLecNo(num);
		int count = lecNoticeService.updateLecNotice(lectureNotice);
		log.debug(TeamColor.KJS + lectureNotice + "확인");
		if (count >= 1) {
			log.debug(TeamColor.KJS + " [김진수] 학부공지 수정");
			return "redirect:/lecNotice/" + lectureNotice.getLecNoticeNo();
		}
		return "redirect:/updateLecNotice/" + lectureNotice.getLecNoticeNo();
	}

	// 강의공지 삭제
	@GetMapping("/removeLecNotice")
	public String LecNoticeOne(@RequestParam(value = "lecNoticeNo") int lecNoticeNo) {
		int count = lecNoticeService.deleteLecNotice(lecNoticeNo);
		if (count >= 1) {
			log.debug(TeamColor.KJS + " [김진수] 학부공지 삭제");
			return "redirect:/lecNotice";
		}
		return "redirect:/lecNotice/" + lecNoticeNo;
	}

}
	 
