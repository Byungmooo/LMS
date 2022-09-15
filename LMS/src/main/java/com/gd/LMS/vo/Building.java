package com.gd.LMS.vo;

import lombok.Data;

@Data
public class Building { //강의건물
	private int buildingNo;			//강의실건물번호
	private String buildingName;	//강의실건물이름
	private String createDate;		//생성날짜
	private String updateDate;		//수정날짜
}
