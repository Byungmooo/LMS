package com.gd.LMS.exam.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.vo.ExamSheet;
import com.gd.LMS.vo.MultipleChoiceQuestion;
import com.gd.LMS.vo.MultipleExample;
import com.gd.LMS.vo.SubjectiveQuestion;

@Mapper
public interface professorExMapper {
	
	//시험지 리스트
	public List<Map<String, Object>> selectExList(int professorCode);
	public int selectExListCount();
	
	
	//시험지 상세보기
	public ExamSheet selectExOne(int examNo);

	//시험지상세보기 : 객관식문제
	public List<MultipleChoiceQuestion> selectMultipleQ(int examNo);
	public List<MultipleExample> selectMultipleExample(int examNo); //객관식문제보기
	
	//시험지상세보기 : 주관식문제
	public List<SubjectiveQuestion> selectSubjectiveQ(int examNo);
	
	
	//시험지추가하기
	
	//시험지수정
	public Map<String, Object> updateExamSheet(int examNo);
	int updateExamSheetName(String examNo,String examName);
	int updateMultipleContent(int examNo);
	int updateExampleContent(int examNo);
	int updateMultipleAnswer(int examNo);
	int updateSubjectiveContent(int examNo);
	int updateSubjectiveAnswer(int examNo);
	
	//시험지삭제
	int deleteMultupleExample(int examNo); 	//객관식예제삭제
	int deleteMultipleQ(int examNo);		//객관식문제삭제
	int deleteSubjectiveQ(int examNo);		//주관식문제삭제
	int deleteExamSheet(int examNo);		//시험지삭제
}
