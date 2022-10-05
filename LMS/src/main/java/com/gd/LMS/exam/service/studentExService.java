package com.gd.LMS.exam.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.exam.mapper.studentExMapper;
import com.gd.LMS.vo.ExamSheet;
import com.gd.LMS.vo.MultipleChoiceQuestion;
import com.gd.LMS.vo.MultipleExample;
import com.gd.LMS.vo.SubjectiveQuestion;
@Slf4j
@Transactional
@Service
public class studentExService {
	@Autowired
	studentExMapper studentExMapper;
	
	//시험지 리스트보기
	public List<Map<String,Object>> getExList(int studentCode){
		// 파라미터 디버깅
		log.debug(TeamColor.KBW + "studentCode (service) > " + studentCode);

		// 매퍼메서드 호출 후 리턴값 디버깅
		List<Map<String, Object>> studentExList = studentExMapper.selectExList(studentCode);
		log.debug(TeamColor.KBW + "studentExList (service) > " + studentExList);

		return studentExList;
	}
	// 시험지 상세보기
	public ExamSheet getExamSheet(int examNo) {
		
		log.debug(TeamColor.KBW + "ExamSheet(service)" + examNo);
		return studentExMapper.selectExOne(examNo);
	}

	
	// 시험상세보기 : 객관식문제
	public List<MultipleChoiceQuestion> getMultipleChoiceQuestion(int examNo) {
		log.debug(TeamColor.KBW + "MultipleChoiceQuestion(service)" + examNo);
		return studentExMapper.selectMultipleQ(examNo);
	}

	// 시험상세보기 : 객관식문제에 대한 보기
	public List<MultipleExample> getMultipleExample(int examNo) {
		log.debug(TeamColor.KBW + "MultipleExample(service)" + examNo);
		return studentExMapper.selectMultipleExample(examNo);
	}

	// 시험상세보기 : 주관식문제
	public List<SubjectiveQuestion> getSubjectiveQuestion(int examNo) {
		log.debug(TeamColor.KBW + "SubjectiveQuestion(service)" + examNo);
		return studentExMapper.selectSubjectiveQ(examNo);
	}
	
	// 시험가능여부
	public List<Map<String, Object>> getExPossible(Map<String, Object> map) {
		log.debug(TeamColor.KBW + "getExPossible(service)" );
		return studentExMapper.selectExPossible(map);
	}	
	
	//시험제출하기
	public int getScore(Map<String,Object> map){
		log.debug(TeamColor.KBW + "getScore(service) map: " +map);
		return  studentExMapper.updateScore(map);
	}
	
	

	
}

