package com.gd.LMS.notice.controller;



import java.util.List;


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

	@Autowired LectureNoticeService lecNoticeService;
	
	   // 전체공지 목록 리스트
    @GetMapping("/lecNotice")
    public String TotalnNoticeList(PagingVo vo,Model model
    		, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
			, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage
			, @RequestParam(value="keyword", defaultValue = "") String keyword
			, @RequestParam(value="searchType", defaultValue = "") String searchType){
        List<LectureNotice> list = lecNoticeService.getLecNoticeList();
        model.addAttribute("list", list);
    	
        int totalCount = lecNoticeService.countBoard(keyword, searchType);
		log.debug(TeamColor.KJS + "current/rowPer/total : " + currentPage + "/" + rowPerPage + "/" + totalCount);
		
		vo = new PagingVo(currentPage, totalCount, rowPerPage, keyword, searchType);
		log.debug(TeamColor.KJS + "PaginVo : " + vo);
		
		List<LectureNotice> list1 = lecNoticeService.selectBoard(vo);
		log.debug(TeamColor.KJS + "noticeList : " + list1);
		
		model.addAttribute("paging", vo);
		model.addAttribute("list", list1);
        
        
        log.debug(TeamColor.KJS + " [김진수] 학부공지 리스트");
        return "/notice/lectureNotice/lecNoticeList";
    }
	
    // 학부공지사항 상세보기
    @GetMapping(value = "/lecNotice/{lecNoticeNo}")
    public String TotalNoticeOne(Model model, @PathVariable(value = "lecNoticeNo") int lecNoticeNo) {
        log.debug(TeamColor.KJS);
    	LectureNotice lecNotice = lecNoticeService.getLecNoticeList(lecNoticeNo);
        lecNoticeService.updateLecNoticeCount(lecNoticeNo);
        model.addAttribute("lectureNotice", lecNotice);
        log.debug(TeamColor.KJS + lecNotice + " [김진수] 학부공지 상세보기");
        return "/notice/lectureNotice/lecNoticeOne";
    }
	

    // 학부공지사항 추가 페이지 이동
    @GetMapping("/addLecNotice")
    public String addLecNotice() {
    	log.debug(TeamColor.KJS + " [김진수] 학부공지 추가 페이지 이동");
        return "/notice/lectureNotice/addLecNotice";
    }
	

    // 학부공지사항 추가
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
        
        
        // 학부공지사항 수정 페이지 이동
        @GetMapping("/updateLecNotice/{lecNoticeNo}")
        public String updateLecNotice(Model model, @PathVariable(value = "lecNoticeNo") int lecNoticeNo) {
        	log.debug(TeamColor.KJS + lecNoticeNo);
        	LectureNotice lecNotice = lecNoticeService.getLecNoticeList(lecNoticeNo);
            model.addAttribute("LectureNotice", lecNotice);
            log.debug(TeamColor.KJS + " [김진수] 학부공지 수정 페이지 이동");
            return "/notice/lectureNotice/updateLecNotice";
        }

        // 학부공지사항 수정
        @PostMapping("/updateLecNotice")
        public String updateLecNotice(LectureNotice lectureNotice) {
        	int num = 1;
        	lectureNotice.setOpenedLecNo(num);
            int count = lecNoticeService.updateLecNotice(lectureNotice);
            log.debug(TeamColor.KJS +  lectureNotice + "확인" );
            if (count >= 1) {
            	log.debug(TeamColor.KJS + " [김진수] 학부공지 수정");
                return "redirect:/lecNotice/"+lectureNotice.getLecNoticeNo();
            }
            return "redirect:/updateLecNotice/"+lectureNotice.getLecNoticeNo();
        }
        // 학부공지사항 삭제
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
	 
