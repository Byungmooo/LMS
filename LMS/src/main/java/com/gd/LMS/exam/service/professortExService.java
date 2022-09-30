package com.gd.LMS.exam.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.vo.ExamSheet;
import com.gd.LMS.vo.MultipleChoiceQuestion;
import com.gd.LMS.vo.MultipleExample;
import com.gd.LMS.vo.SubjectiveQuestion;

import ch.qos.logback.core.rolling.helper.IntegerTokenConverter;
import lombok.extern.slf4j.Slf4j;
import com.gd.LMS.exam.mapper.professorExMapper;

@Slf4j
@Transactional
@Service
public class professortExService {
	@Autowired
	professorExMapper professorExMapper;

	// 시험지 리스트보기
	public List<Map<String, Object>> getExList(int professorCode) {
		// 파라미터 디버깅
		log.debug(TeamColor.KBW + "professorCode (service) > " + professorCode);

		// 매퍼메서드 호출 후 리턴값 디버깅
		List<Map<String, Object>> professorExList = professorExMapper.selectExList(professorCode);
		log.debug(TeamColor.KBW + "professorExList (service) > " + professorExList);

		return professorExList;
	}

	// 시험지 추가
	public int insertExamSheet(ExamSheet examSheet) {
		professorExMapper.insertExamSheet(examSheet);
		int key = examSheet.getExamNo();
		log.debug(TeamColor.KBW + key + "번 시험지생성");
		return key;
	}

	// 객관식 문제 추가
	public int insertMultiple(long multipleNo, String multipleContent,String answer,long examNo) {
		Map<String, Object> list = new HashMap<>();
		log.debug(TeamColor.KBW+"insertMultiple list(service) :" +list);		
		list.put("multipleNo", multipleNo);
		list.put("multipleContent", multipleContent);
		list.put("answer", answer);
		list.put("examNo", examNo);
		int result = professorExMapper.insertMultiple(list);

		
		return result;
	}
	//객관식 보기 추가
	public int insertExample(long examNo, long multipleNo, String exampleContent, int example) {
		Map<String, Object> list = new HashMap<>();
		log.debug(TeamColor.KBW + "insertExample(service) : "+list);
		list.put("examNo", examNo);
		list.put("multipleNo", multipleNo);
		list.put("exampleContent", exampleContent);
		list.put("example", Integer.toString(example));
		int result =professorExMapper.insertExample(list);

		return result;
	}

	// 시험지 개수
	public int getExListCount() {
		int result = professorExMapper.selectExListCount();
		log.debug(TeamColor.KBW + result + "시험지Count");
		return result;
	}

	// 시험지 상세보기
	public ExamSheet getExamSheet(int examNo) {
		log.debug(TeamColor.KBW + "ExamSheet(service)" + examNo);
		return professorExMapper.selectExOne(examNo);
	}

	// 시험상세보기 : 객관식문제
	public List<MultipleChoiceQuestion> getMultipleChoiceQuestion(int examNo) {
		log.debug(TeamColor.KBW + "MultipleChoiceQuestion(service)" + examNo);
		return professorExMapper.selectMultipleQ(examNo);
	}

	// 시험상세보기 : 객관식문제에 대한 보기
	public List<MultipleExample> getMultipleExample(int examNo) {
		log.debug(TeamColor.KBW + "MultipleExample(service)" + examNo);
		return professorExMapper.selectMultipleExample(examNo);
	}

	// 시험상세보기 : 주관식문제
	public List<SubjectiveQuestion> getSubjectiveQuestion(int examNo) {
		log.debug(TeamColor.KBW + "SubjectiveQuestion(service)" + examNo);
		return professorExMapper.selectSubjectiveQ(examNo);
	}

	// 시험지 수정 폼
	public Map<String, Object> getUpdateExamSheet(int examNo) {
		log.debug(TeamColor.KBW + "UpdateExamSheet(service)" + examNo);
		Map<String, Object> updateExamSheet = professorExMapper.updateExamSheet(examNo);
		professorExMapper.updateExamSheet(examNo);

		return updateExamSheet;
	}

	// 시험지이름 수정
	public int updateExamSheetName(String examNo, String examName) {
		Map<String, Object> list = new HashMap<>();
		list.put("examNo", examNo);
		list.put("examName", examName);
		int result = professorExMapper.updateExamSheetName(list);
		log.debug(TeamColor.KBW + "updateExamSheetName(service)" + examNo + examName);
		return result;
	}

	// 객관식문제 수정
	public int updateQuestion(String exampleNo, String exampleContent, String multipleNo) {
		Map<String, Object> list = new HashMap<>();
		list.put("examNo", exampleNo);
		list.put("exampleContent", exampleContent);
		list.put("multipleNo", multipleNo);
		int result = professorExMapper.updateQuestion(list);
		log.debug(TeamColor.KBW + "updateQuestion(service)" + exampleNo + exampleContent);
		return result;
	}

	// 객관식 보기 수정
	public int updateExample(String examNo, String multipleNo, String exampleNo, String exampleContent) {
		Map<String, Object> list = new HashMap<>();
		list.put("examNo", examNo);
		list.put("multipleNo", multipleNo);
		list.put("exampleNo", exampleNo);
		list.put("exampleContent", exampleContent);
		int result = professorExMapper.updateExampleContent(list);
		log.debug(TeamColor.KBW + "updateExample(service)" + exampleContent + examNo + multipleNo + exampleNo);

		return result;
	}

	// 객관식 정답 수정
	public int updateMultipleAnswer(String exampleNo, String multipleNo, String multipleAnswer) {
		Map<String, Object> list = new HashMap<>();
		list.put("examNo", exampleNo);
		list.put("multipleNo", multipleNo);
		list.put("multipleAnswer", multipleAnswer);
		int result = professorExMapper.updateMultipleAnswer(list);
		log.debug(TeamColor.KBW + "updateMultipleAnswer(service)");
		log.debug(TeamColor.KBW + "list(service)" + list);
		log.debug(TeamColor.KBW + "result(service)" + result);
		return result;
	}

	// 주관식 문제 수정
	public int updateSubContent(String examNo, String subjectiveContent, String subjectiveNo) {
		Map<String, Object> list = new HashMap<>();
		list.put("examNo", examNo);
		list.put("subjectiveContent", subjectiveContent);
		list.put("subjectiveNo", subjectiveNo);

		int result = professorExMapper.updateSubContent(list);
		log.debug(TeamColor.KBW + "updateSubjectiveContent(service)" + examNo + subjectiveNo + subjectiveContent);
		log.debug(TeamColor.KBW + "list(service)" + list);
		log.debug(TeamColor.KBW + "result(service)" + result);

		return result;
	}

	// 주관식 정답 수정
	public int updateSubAnswer(String examNo, String subjectiveAnswer, String subjectiveNo) {
		Map<String, Object> list = new HashMap<>();
		list.put("examNo", examNo);
		list.put("subjectiveAnswer", subjectiveAnswer);
		list.put("subjectiveNo", subjectiveNo);

		int result = professorExMapper.updateSubAnswer(list);
		log.debug(TeamColor.KBW + "updateSubAnswer(service)" + examNo + subjectiveAnswer + subjectiveNo);
		log.debug(TeamColor.KBW + "list(service)" + list);
		log.debug(TeamColor.KBW + "result" + result);

		return result;

	}

	// 시험지삭제
	public int deleteExamSheet(int examNo) {
		professorExMapper.deleteMultupleExample(examNo);
		professorExMapper.deleteMultipleQ(examNo);
		professorExMapper.deleteSubjectiveQ(examNo);
		professorExMapper.deleteExamSheet(examNo);

		log.debug(TeamColor.KBW + "deleteExamSheet(service)" + examNo);

		return examNo;
	}
	
	// 주관식 등록
	public int insertSubjective(String examNo, String subjectNo,String subjectContent,String subjectAnswer) {
		Map<String, Object> list = new HashMap<>();
		log.debug(TeamColor.KBW+"insertMultiple list(service) :" +list);		
		list.put("examNo", examNo);
		list.put("subjectNo", subjectNo);
		list.put("subjectContent", subjectContent);
		list.put("subjectAnswer", subjectAnswer);
		int result = professorExMapper.insertSubjective(list);

		
		return result;
	}

}