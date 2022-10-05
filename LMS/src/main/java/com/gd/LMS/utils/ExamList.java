package com.gd.LMS.utils;

import org.springframework.web.bind.annotation.RequestParam;

import lombok.Data;

@Data
public class ExamList {
	private String exMq1;
	private String exMq2;
	private String exMq3;
	private String exMq4;
	private String exMq5;
	
	
	private String[] exSq;
	
}
