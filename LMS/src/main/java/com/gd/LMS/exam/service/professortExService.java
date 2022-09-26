package com.gd.LMS.exam.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.amqp.RabbitProperties.Template;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.vo.ExamSheet;
import com.gd.LMS.vo.MultipleChoiceQuestion;
import com.gd.LMS.vo.MultipleExample;
import com.gd.LMS.vo.SubjectiveQuestion;
import lombok.extern.slf4j.Slf4j;
import com.gd.LMS.exam.mapper.professorExMapper;

@Slf4j
@Transactional
@Service
public class professortExService {
   @Autowired professorExMapper professorExMapper;
   
   //시험지 리스트보기
   public List<Map<String, Object>> getExList(int professorCode) {
      // 파라미터 디버깅
      log.debug(TeamColor.KBW + "professorCode (service) > " + professorCode);

      // 매퍼메서드 호출 후 리턴값 디버깅
      List<Map<String, Object>> professorExList = professorExMapper.selectExList(professorCode);
      log.debug(TeamColor.KBW + "professorExList (service) > " + professorExList);
      
      return professorExList;
   }
   
   
   // 시험지 개수
   public int getExListCount() {
      int result= professorExMapper.selectExListCount();
      log.debug(TeamColor.KBW + result+"시험지Count"); 
      return result;
   }
   
   
   //시험지 상세보기
    public ExamSheet getExamSheet(int examNo) {
       log.debug(TeamColor.KBW + "ExamSheet(service)"+examNo);
        return professorExMapper.selectExOne(examNo);
    }
    //시험상세보기 : 객관식문제
    public List<MultipleChoiceQuestion> getMultipleChoiceQuestion(int examNo) {
       log.debug(TeamColor.KBW + "MultipleChoiceQuestion(service)"+examNo);
       return professorExMapper.selectMultipleQ(examNo);
    }
    //시험상세보기 : 객관식문제에 대한 보기
    public List<MultipleExample> getMultipleExample(int examNo) {
       log.debug(TeamColor.KBW + "MultipleExample(service)"+examNo);
       return professorExMapper.selectMultipleExample(examNo);
    }
    
    //시험상세보기 : 주관식문제
    public List<SubjectiveQuestion> getSubjectiveQuestion(int examNo) {
       log.debug(TeamColor.KBW + "SubjectiveQuestion(service)"+examNo);
       return professorExMapper.selectSubjectiveQ(examNo);
    }
    
    
    
    
    //시험지 수정 폼
    public Map<String, Object> getUpdateExamSheet(int examNo){
    	log.debug(TeamColor.KBW + "UpdateExamSheet(service)" + examNo);
    	Map<String, Object> updateExamSheet = professorExMapper.updateExamSheet(examNo);
    	professorExMapper.updateExamSheet(examNo);

		return updateExamSheet;	
    }
    
    //시험지이름 수정
    public String updateExamSheetName(String examNo,String examName) {
    	professorExMapper.updateExamSheetName(examNo,examName);
    	log.debug(TeamColor.KBW + "updateExamSheetName(service)" + examNo +examName);
		return examNo;
    }
   // public Map<String, Object> getUpdateExamSheetName (int examNo)
   

    
    //시험지삭제
    public int deleteExamSheet(int examNo) {
       professorExMapper.deleteMultupleExample(examNo);
       professorExMapper.deleteMultipleQ(examNo);
       professorExMapper.deleteSubjectiveQ(examNo);
       professorExMapper.deleteExamSheet(examNo);
       
       log.debug(TeamColor.KBW +"deleteExamSheet(service)"+ examNo);
       
      return examNo;
       
       
    }



    
}