package com.gd.LMS.schedule.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.schedule.service.ScheduleService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ScheduleController {
	@Autowired ScheduleService scheduleService;
	
	// 강의 시간표
	@GetMapping("/student/lectureSchedule")
	public String lectureSchedule(Model model
			, @RequestParam(value = "memberCode") int memberCode) {
		log.debug(TeamColor.LCH + this.getClass());
		
		List<Map<String, Object>> list = scheduleService.getLectureSchedule();
		
		log.debug(TeamColor.LCH + list);
		
		model.addAttribute("list", list);
		
		return "schedule/lectureSchedule";
	}
}
