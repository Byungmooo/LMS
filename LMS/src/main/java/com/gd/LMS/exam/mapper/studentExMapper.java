package com.gd.LMS.exam.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.vo.ExamSheet;
import com.gd.LMS.vo.MultipleChoiceQuestion;
import com.gd.LMS.vo.MultipleExample;
import com.gd.LMS.vo.SubjectiveQuestion;

@Mapper
public interface studentExMapper {
	//시험지리스트
	public	List<Map<String, Object>> selectExList(int studentCode);
	public int selectExListCount();
	
	// 시험지 상세보기
	public ExamSheet selectExOne(int examNo);
	//상세보기에서 시험가능여부
	public List<Map<String, Object>> selectExPossible(Map<String, Object> map);
	
	// 시험지상세보기 : 객관식문제
	public List<MultipleChoiceQuestion> selectMultipleQ(int examNo);
	public List<MultipleExample> selectMultipleExample(int examNo); // 객관식문제보기

	// 시험지상세보기 : 주관식문제
	public List<SubjectiveQuestion> selectSubjectiveQ(int examNo);

	//시험지제출하기 
	public int updateScore(Map<String, Object> map);

}
