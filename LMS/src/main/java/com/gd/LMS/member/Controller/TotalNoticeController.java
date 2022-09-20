package com.gd.LMS.member.Controller;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.member.Service.TotalNoticeService;
import com.gd.LMS.vo.TotalNotice;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TotalNoticeController {
    @Autowired
    TotalNoticeService noticeService;

    // 전체공지 목록 리스트
    @GetMapping(value = {"/totalNotice"})
    public String TotalnNoticeList(Model model) {
        List<TotalNotice> list = noticeService.getTotalNoticeList();
        model.addAttribute("list", list);
        log.debug(TeamColor.KJS + " [김진수] 전체공지 리스트");
        return "totalNoticeList";
    }

    // 전체공지사항 상세보기
    @GetMapping(value = "/totalNotice/{noticeNo}")
    public String TotalNoticeOne(Model model, @PathVariable(value = "noticeNo") int noticeNo) {
        TotalNotice totalNotice = noticeService.getTotalNotice(noticeNo);
        noticeService.updateTotalNoticeCount(noticeNo);
        model.addAttribute("totalNotice", totalNotice);
        log.debug(TeamColor.KJS + " [김진수] 전체공지 상세보기");
        return "totalNoticeOne";
    }

    // 전체공지사항 추가 페이지 이동
    @GetMapping("/addTotalNotice")
    public String addTotalNotice() {
    	log.debug(TeamColor.KJS + " [김진수] 전체공지 추가 페이지 이동");
        return "addTotalNotice";
    }

    // 전체공지사항 추가
    @PostMapping("/addTotalNotice")
    public String addTotalNotice(TotalNotice totalNotice) {
        int count = noticeService.insertTotalNotice(totalNotice);
        if (count >= 1) {
        	log.debug(TeamColor.KJS + " [김진수] 전체공지 추가");
            return "redirect:totalNotice";
        }
        return "addTotalNotice";
    }

    // 전체공지사항 수정 페이지 이동
    @GetMapping("/updateTotalNotice/{noticeNo}")
    public String updateTotalNotice(Model model, @PathVariable(value = "noticeNo") int noticeNo) {
        TotalNotice totalNotice = noticeService.getTotalNotice(noticeNo);
        model.addAttribute("totalNotice", totalNotice);
        log.debug(TeamColor.KJS + " [김진수] 전체공지 수정 페이지 이동");
        return "updateTotalNotice";
    }

    // 전체공지사항 수정
    @PostMapping("/updateTotalNotice")
    public String updateTotalNotice(TotalNotice totalNotice) {
        int count = noticeService.updateTotalNotice(totalNotice);
        if (count >= 1) {
        	log.debug(TeamColor.KJS + " [김진수] 전체공지 수정");
            return "redirect:totalNotice/"+totalNotice.getNoticeNo();
        }
        return "redirect:updateTotalNotice/"+totalNotice.getNoticeNo();
    }
    @GetMapping(value = "/removeTotalNotice")
    public String TotalNoticeOne(@RequestParam(value = "noticeNo") int noticeNo) {
        int count = noticeService.deleteTotalNotice(noticeNo);
        if (count >= 1) {
        	log.debug(TeamColor.KJS + " [김진수] 전체공지 삭제");
            return "redirect:totalNotice";
        }
        return "redirect:totalNotice/" + noticeNo;
    }


}
