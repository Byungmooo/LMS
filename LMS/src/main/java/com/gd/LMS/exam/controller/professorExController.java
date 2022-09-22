package com.gd.LMS.exam.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.exam.service.professortExService;
import com.gd.LMS.vo.ExamSheet;
import com.gd.LMS.vo.MultipleChoiceQuestion;
import com.gd.LMS.vo.MultipleExample;
import com.gd.LMS.vo.SubjectiveQuestion;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class professorExController {
	@Autowired professortExService professorExService;
	
	// 시험지 리스트
	@GetMapping(value={"/exam/professorExList"})
	public String ExList(Model model) {
		log.debug(TeamColor.KBW + "--- ExList Controller GetMapping ---");
		
		// 학생코드 추후 수정예정
		int professorCode = 10;
		
		// 학생수강리스트 메서드 호출 후 리턴값 디버깅
		List<Map<String, Object>> professorExList = professorExService.getExList(professorCode);
		log.debug(TeamColor.KBW + "professorExList (controller) > " + professorExList);
		
		model.addAttribute("Exlist", professorExList);
		
		return "exam/professorExList";
	}
	
	
	
	// 시험지 상세보기

    @GetMapping(value = "/exam/professorExList/{examNo}")
    public String ExOne(Model model, @PathVariable(value = "examNo") int examNo) {
    	log.debug(TeamColor.KBW + "--- ExOne(시험지상세보기) Controller GetMapping ---");
    	//시험지
        ExamSheet examSheet = professorExService.getExamSheet(examNo);
        log.debug(TeamColor.KBW + "examSheet (controller) > " + examNo);
        //객관식문제
        List<MultipleChoiceQuestion> multipleQ = professorExService.getMultipleChoiceQuestion(examNo);
        log.debug(TeamColor.KBW + "MultipleChoiceQuestion (controller) > " + examNo);
        //객관식문제보기
        List<MultipleExample> multipleEx = professorExService.getMultipleExample(examNo);
        log.debug(TeamColor.KBW + "MultipleExample (controller) > " + examNo);
        
        
        
        //주관식문제
        List<SubjectiveQuestion> subjectiveQ =  professorExService.getSubjectiveQuestion(examNo);
        log.debug(TeamColor.KBW + "SubjectiveQuestion (controller) > " + examNo);
        
        
        
        //시험지
        model.addAttribute("examSheet", examSheet);
        log.debug(TeamColor.KBW + "examSheet (controller) > "+ examSheet);
        //객관식문제
        model.addAttribute("multipleQ", multipleQ); 
        log.debug(TeamColor.KBW + "multipleQ (controller) > "+ multipleQ);
        //객관식문제 보기(1~4번)
        model.addAttribute("multipleEx", multipleEx); 
        log.debug(TeamColor.KBW + "multipleEx (controller) > "+ multipleEx);
        //주관식문제
        model.addAttribute("subjectiveQ",subjectiveQ);
        log.debug(TeamColor.KBW + "subjectiveQ (controller) > "+ subjectiveQ);
        
        
        
        log.debug(TeamColor.KBW + "arrayUsCHECK!!>>" + multipleQ);
         return "/exam/professorExOne";
    }	
    
    //시험지 추가
    @GetMapping("/exam/professorAddExamSheet")
    public String ExAdd() {
    	log.debug(TeamColor.KBW + "--- ExAdd(시험지추가) Controller Getmapping---");
    	return "/exam/professorAddExamSheet";
    }
    
    
	
	//시험문제 추가

	
	//시험문제 수정
	
	
	//시험문제 삭제
}
