package com.gd.LMS.lecture.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.lecture.service.LectureService;
import com.gd.LMS.utils.LectureListVo;
import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.LectureAnswer;
import com.gd.LMS.vo.LectureNotice;
import com.gd.LMS.vo.LectureQuestion;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LectureController {
    @Autowired
    LectureService lectureService;

    // 학생이 수강중인 강의리스트
    @GetMapping("/student/studentLectureList")
    public String studentLectureList(Model model, HttpSession session,@RequestParam(value = "memberCode") int memberCode
    ) {
        log.debug(TeamColor.LCH + "--- studentLectureList Controller GetMapping ---");

        // 학생코드 추후 수정예정
        // int studentCode = 10;

        // 학생수강리스트 메서드 호출 후 리턴값 디버깅
        List<Map<String, Object>> studentLectureList = lectureService.getStudentLectureList(memberCode);
        log.debug(TeamColor.LCH + "studentLectureList (controller) > " + studentLectureList);

		session.setAttribute("memberCode",memberCode);
        model.addAttribute("list", studentLectureList);
        return "lecture/studentLectureList";
    }

    // 강의 상세보기
    @GetMapping("/student/openedLectureOne")
    public String openedLectureOne(Model model, @RequestParam(value = "openedLecNo") int openedLecNo, HttpSession session) {
        log.debug(TeamColor.LCH + "--- openedLectureOne Controller GetMapping ---");

        // 파라미터 디버깅
        log.debug(TeamColor.LCH + "openedLecNo (controller) > " + openedLecNo);

        // 학생수강리스트 메서드 호출 후 리턴값 디버깅
        Map<String, Object> openedLectureOne = lectureService.getOpenedLectureOne(openedLecNo);
        log.debug(TeamColor.LCH + "openedLectureOne (controller) > " + openedLectureOne);

        model.addAttribute("map", openedLectureOne);
        session.setAttribute("openedLecNo", openedLecNo);
        return "lecture/openedLectureOne";
    }

    // 강의 질문 리스트
    @GetMapping("/student/lectureQuestionList")
    public String lectureQuestionList(PagingVo vo, Model model, HttpSession session
    		, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
			, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage
			, @RequestParam(value="keyword", defaultValue = "") String keyword
			, @RequestParam(value="searchType", defaultValue = "") String searchType
//			,@RequestParam (value = "openedLecNo", required = false) int openedLecNo
    ) {
    	
    	
        int totalCount = lectureService.countBoard(keyword, searchType);
		log.debug(TeamColor.KJS + "current/rowPer/total : " + currentPage + "/" + rowPerPage + "/" + totalCount);
		
        vo = new PagingVo(currentPage, totalCount, rowPerPage, keyword, searchType);
        // 이전 페이지 시작 글 번호와 현재 변경되는 페이지의 시작 글번호에 대한 일치 시키는거 많은 변경이 필요하므로 그냥 1로 처리함
        if(vo.getBeginRow() >= totalCount){
            vo = new PagingVo(1, totalCount, rowPerPage, keyword, searchType);
        }
		
		List<LectureQuestion> list1 = lectureService.selectBoard(vo);
		log.debug(TeamColor.KJS + "noticeList : " + list1);
		
		model.addAttribute("paging", vo);
		// model.addAttribute("list", list1);
		
		
		//--------
        log.debug(TeamColor.LCH + "--- lectureQuestionList Controller GetMapping ---");

        int openedLecNo = (int) session.getAttribute("openedLecNo");
        log.debug(TeamColor.LCH + "openedLecNo > " + openedLecNo);

        // List<LectureQuestion> lectureQuestionList = lectureService.getLectureQuestionList(openedLecNo);

        // log.debug(TeamColor.LCH + "lectureQuestionList > " + lectureQuestionList);

        model.addAttribute("question", list1);
        return "lecture/lectureQuestionList";
    }

    // 강의 질문 상세보기
    @GetMapping("/student/lectureQuestionOne")
    public String lectureQuestionOne(Model model,
                                     HttpSession session,
                                     @RequestParam(value = "lecQuestionNo") int lecQuestionNo) {
        log.debug(TeamColor.LCH + "--- lectureQuestionOne Controller GetMapping ---");

        log.debug(TeamColor.LCH + "lecQuestionNo > " + lecQuestionNo);

        Map<String, Object> lectureQuestionOne = lectureService.getLectureQuestionOne(lecQuestionNo);
        log.debug(TeamColor.LCH + "lectureQuestionOne > " + lectureQuestionOne);

        model.addAttribute("question", lectureQuestionOne);

        if(lectureQuestionOne.get("answerY").equals("Y")){
            Map<String, Object> lectureAnswerOne = lectureService.getLectureAnswerOne(lecQuestionNo);
            log.debug(TeamColor.KJS + "lectureAnswerOne > " + lectureAnswerOne);
            model.addAttribute("answer", lectureAnswerOne);
        }
        session.setAttribute("lecQuestionNo",lecQuestionNo);
        return "lecture/lectureQuestionOne";
    }


    // 강의 질문 답변 추가 페이지 이동
    @GetMapping("/student/addLectureStudent")
    public String addLectureStudentOne(HttpSession session
    ) {
        log.debug(TeamColor.KJS + " [김진수] 답변 추가 페이지 이동");
        return "lecture/addLectureAnswer";
    }

    // 강의 질문 답변 추가 - 교수만 해당
    @PostMapping("/student/addLectureStudent")
    public String addLectureStudent(LectureAnswer lectureAnswer,
                                    HttpSession session) {
        int lecQuestionNo = (int) session.getAttribute("lecQuestionNo");
        lectureAnswer.setLecQuestionNo(lecQuestionNo);
        lectureService.getAddAnswer(lectureAnswer);

        log.debug(TeamColor.KJS + " [김진수] 답변 추가");
        return "redirect:/student/lectureQuestionList";

    }

    // 강의 질문 추가 페이지 이동
    @GetMapping("/student/addLectureQuestion")
    public String addLectureQuestionOne(HttpSession session) {
        log.debug(TeamColor.KJS + " [김진수] 답변 추가 페이지 이동");
        return "lecture/addLectureQuestion";

    }

    // 강의 질문 추가
    @PostMapping("/student/addLectureQuestion")
    public String addLectureStudent(LectureQuestion lectureQuestion,HttpSession session) {
        int count = lectureService.getAddQuestion(lectureQuestion);

        log.debug(TeamColor.KJS + lectureQuestion + " [김진수] 답변 추가");
        return "redirect:/student/lectureQuestionList?openedLecNo="+session.getAttribute("openedLecNo");

    }
    
    
    // 학부공지사항 수정 페이지 이동
    @GetMapping("/student/updateLectureQuestion")
    public String updateLectureQuestion(Model model, HttpSession session) {
    	Map<String, Object> lectureQuestionOne = lectureService.getLectureQuestionOne((int) session.getAttribute("lecQuestionNo"));
        log.debug(TeamColor.KJS + " [김진수] 학부공지 수정 페이지 이동");
        model.addAttribute("question", lectureQuestionOne);
        return "/lecture/updateLectureQuestion";
    }

    // 학부공지사항 수정
    @PostMapping("/student/updateLectureQuestion")
    public String updateLecNotice(LectureQuestion lectureQuestion ,HttpSession session) {
        int count = lectureService.updateQuestion(lectureQuestion);
        if (count >= 1) {
        	log.debug(TeamColor.KJS + " [김진수] 학부공지 수정");
            return "redirect:/student/lectureQuestionOne?lecQuestionNo="+session.getAttribute("lecQuestionNo");
        }
        return "redirect:/student/updateLectureQuestion";
    }
    // 학부공지사항 삭제
    @GetMapping("/student/removeLectrueQuestion")
    public String LecNoticeOne(HttpSession session) {
        int count = lectureService.deleteQuestion((int) session.getAttribute("lecQuestionNo"));
        if (count >= 1) {
        	log.debug(TeamColor.KJS + " [김진수] 학부공지 삭제");
            return "redirect:/student/lectureQuestionList?openedLecNo="+session.getAttribute("openedLecNo");
        }
        return "redirect:/student/lectureQuestionList?openedLecNo="+session.getAttribute("openedLecNo");
    }


    // 학생 수강신청 화면
    @GetMapping("/studentLectureReg")
    public String studentLectureReg(PagingVo vo, Model model
            , @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
            , @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage) {

        int totalLectureCount = lectureService.getTotalLectureCount();

        vo = new PagingVo(currentPage, totalLectureCount, rowPerPage, null, null);

        List<Map<String, Object>> totalLectureList = lectureService.getTotalLectureList(vo);

        model.addAttribute("totalList", totalLectureList);

        List<Map<String, Object>> studentLectureCartList = lectureService.getStudentLectureCartList();
        int size = 9 - studentLectureCartList.size();

        if (size < 0) {
            size = 0;
        }

        model.addAttribute("size", size);
        model.addAttribute("cartList", studentLectureCartList);

        return "lecture/studentLectureReg";
    }

    // 학생 수강신청 액션
    @PostMapping("/studentLectureReg")
    public String studentLectureReg(LectureListVo lectureList) {
        log.debug(TeamColor.LCH + "lectureList > " + lectureList);

        Map<String, Object> map = null;
        List<Map<String, Object>> list = new ArrayList<>();

        int length = lectureList.getOpenedLecNo2().length;

        for (int i = 0; i < length; i++) {
            map = new HashMap<>();
            map.put("studentCode", lectureList.getStudentCode2()[i]);
            map.put("openedLecNo", lectureList.getOpenedLecNo2()[i]);
            list.add(map);
        }

        log.debug(TeamColor.LCH + "size > " + lectureList.getOpenedLecNo2().length);
        log.debug(TeamColor.LCH + "map > " + map);
        log.debug(TeamColor.LCH + "list > " + list);

        int result = lectureService.addStudentLeture(list);

        if (result != 0) {
            // 수강신청 성공 시 장바구니강의 삭제
            String studentCode = (String) list.get(0).get("studentCode");
            int row = lectureService.removeStudentLectureCart(studentCode);
            if (row == 0) {
                log.debug(TeamColor.LCH + "실패 row > " + row);
                return "redirect:/studentLectureReg";
            }
            log.debug(TeamColor.LCH + row + "개의 강의 삭제성공");
        }

        return "redirect:/studentLectureReg";
    }

    // 학생 장바구니 담기
    @PostMapping("/cartAdd")
    public @ResponseBody String cartAdd(Map<String, Object> map,
                                        @RequestParam(value = "openedLecNo") String openedLecNo,
                                        @RequestParam(value = "studentCode") String studentCode) {
        log.debug(TeamColor.LCH + "--- cartAdd Controller PostMapping ---");

        // 파라미터 디버깅
        log.debug(TeamColor.LCH + "openedLecNo (controller) > " + openedLecNo);
        log.debug(TeamColor.LCH + "studentCode (controller) > " + studentCode);

        map.put("openedLecNo", openedLecNo);
        map.put("studentCode", studentCode);
        log.debug(TeamColor.LCH + "map (controller) > " + map);

        // 리턴값 디버깅
        int result = lectureService.studentCartAdd(map);
        log.debug(TeamColor.LCH + "result (controller) > " + result);

        // ajax Json에 보낼 메시지
        String returnJson;

        // 리턴값이 null일 경우 사용가능한 아이디
        if (result != 0) {
            returnJson = "y";
        } else {
            returnJson = "n";
        }

        return returnJson;
    }

    // 학생 장바구니 빼기
    @PostMapping("/cartRemove")
    public @ResponseBody String cartRemove(@RequestParam(value = "cartNo") String cartNo) {
        log.debug(TeamColor.LCH + "--- cartDelete Controller PostMapping ---");

        // 파라미터 디버깅
        log.debug(TeamColor.LCH + "cartNo (controller) > " + cartNo);

        // 리턴값 디버깅
        int result = lectureService.studentCartRemove(cartNo);
        log.debug(TeamColor.LCH + "result (controller) > " + result);

        // ajax Json에 보낼 메시지
        String returnJson;

        // 리턴값이 null일 경우 사용가능한 아이디
        if (result != 0) {
            returnJson = "y";
        } else {
            returnJson = "n";
        }

        return returnJson;
    }


    // 지울거임
    @GetMapping("/result")
    public String resultPage() {
        return "resultPage";
    }
    
    
    
}
