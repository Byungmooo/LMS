package com.gd.LMS.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class MultipleChoiceQuestion {  
	
	
	
	private int openedLecNo;				//열린강의번호
	private int examNo;						//시험지번호
	private String multipleNo; 				//객관식문제번호(1~5번문제)
	private String multipleContent;			//객관식문제내용
	private String multipleAnswer;			//객관식문제정답
	private int questionPoint;				//문제 점수
	private String createDate;				//등록일
	private String updateDate;				//수정일
	private String arrayUs="";
	
	private List<String> exampleList;
	




}
