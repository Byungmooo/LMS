package com.gd.LMS.vo;

import lombok.Data;

@Data
public class Classroom {  //강의실 
	private int classroomNo;		//강의실번호
	private int buildingNo;			//강의실건물번호
	private String classroomName;	//강의실이름
	private int maxPeople;			//수용인원
	private String availability;	//사용가능여부 'Y','N'
	private String createDate;		//생성날짜
	private String updateDate;		//수정날짜
}
