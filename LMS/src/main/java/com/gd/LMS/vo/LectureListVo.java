package com.gd.LMS.vo;

import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class LectureListVo {
	private String studentCode2;
	private String openedLecNo2;
	
	private List<Map<String, Object>> list;
	
}
