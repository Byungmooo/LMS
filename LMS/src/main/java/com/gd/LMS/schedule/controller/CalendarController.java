package com.gd.LMS.schedule.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.schedule.service.CalendarService;
import com.gd.LMS.schedule.service.ScheduleService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CalendarController {
	@Autowired CalendarService calendarService;
	@Autowired ScheduleService scheduleService;
	
	//calendarDayList 수강일정리스트(달력)
	@GetMapping("/member/calendar")
	public String calendarDayList(Model model
			, @RequestParam(name = "memberCode") int memberCode
			, @RequestParam(name = "departmentCode", defaultValue = "0") int departmentCode
			, @RequestParam(name = "year", defaultValue = "-1") int year
			, @RequestParam(name = "month", defaultValue = "-1") int month) {
		log.debug(TeamColor.KJS + "memberCode : " + memberCode);
		
		log.debug(TeamColor.KJS + "[CalendarController.getConsultReservationList] year : " + year);
		log.debug(TeamColor.KJS + "[CalendarController.getConsultReservationList] month : " + month);
	
		Map<String,Object> map = calendarService.getCalendarDayListByMonth(year,month);
		
		log.debug(TeamColor.KJS + "[CalendarController.getCalendarDayListByMonth] map : " + map);
		
		model.addAttribute("consultReservationListByMonth", map.get("consultReservationListByMonth"));
		model.addAttribute("startBlank", map.get("startBlank"));
		model.addAttribute("endDay", map.get("endDay"));
		model.addAttribute("endBlank", map.get("endBlank"));
		model.addAttribute("totalTd", map.get("totalTd"));
		model.addAttribute("year", map.get("year"));
		model.addAttribute("month", map.get("month"));
		
		// 강의리스트 (시간)
		List<Map<String, Object>> lectureTimeList = scheduleService.getLectureSchedule();
		
		log.debug(TeamColor.LCH + "lecTimeList > " +lectureTimeList);
		
		model.addAttribute("list", lectureTimeList);
		
		// 학부일정
		List<Map<String, Object>> depScheduleList = calendarService.getDepartmentSchedule();
		
		log.debug(TeamColor.LCH + "depSchedule" + depScheduleList);
		
		model.addAttribute("scheduleList", depScheduleList);
		
		return "/schedule/calendar";
	
	}

	
	
	
	
	  
	  
	  
	  
	  
	 
}
