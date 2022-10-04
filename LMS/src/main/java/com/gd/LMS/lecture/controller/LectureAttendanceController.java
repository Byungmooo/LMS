package com.gd.LMS.lecture.controller;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.lecture.service.LectureAttendanceService;
import com.gd.LMS.schedule.service.ScheduleService;
import com.gd.LMS.vo.Attendance;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LectureAttendanceController {
	@Autowired LectureAttendanceService lectureAttendanceService;
	@Autowired ScheduleService scheduleService;
	
	// 강의 출석 리스트
	@GetMapping({"/professor/lectureAttendanceList", "/student/lectureAttendanceList"})
	public String lectureAttendanceList(Model model, Map<String, Object> map
			, @RequestParam (value = "openedLecNo") int openedLecNo
			, @RequestParam (value = "memberCode") int memberCode) {
		log.debug(TeamColor.LCH + "--- lectureAttendanceList Controller GetMapping ---");
		
		// 강의 날짜관련 데이터 갖고오기
		List<Map<String, Object>> lectureTimeList = lectureAttendanceService.calcLectureDate(openedLecNo);
		log.debug(TeamColor.LCH + "lectureTimeList > " + lectureTimeList);
		
		// 리스트 정렬
		Collections.sort(lectureTimeList, new Comparator<Map<String, Object>>() {
			@Override
			public int compare(Map<String, Object> o1, Map<String, Object> o2) {
				Integer date1 = Integer.parseInt(String.valueOf(o1.get("attendanceDate")));
				Integer date2 = Integer.parseInt(String.valueOf(o2.get("attendanceDate")));
				return date1.compareTo(date2);
			}
		});
		
		// 학생 출석 정보 가져오기
		map.put("openedLecNo", openedLecNo);
		map.put("studentCode", memberCode);
		List<Map<String, Object>> studentAttendanceList = lectureAttendanceService.getStudentAttendanceList(map);
				
		model.addAttribute("studentAttendance", studentAttendanceList);		
		model.addAttribute("lectureTime", lectureTimeList);
		
		return "lecture/lectureAttendance/lectureAttendanceList";
	}
	
	// 강의 출석부
	@GetMapping("/professor/lectureAttendance")
	public String lectureAttendane(Model model, @RequestParam(value = "openedLecNo") int openedLecNo
			, @RequestParam(value = "attendanceDate") String attendanceDate) {
		log.debug(TeamColor.LCH + "--- lectureAttendane Controller GetMapping ---");
		log.debug(TeamColor.LCH + "attendanceDate > " + attendanceDate);
		
		// 강의 학생 리스트
		List<Map<String, Object>> lectureStudentList = lectureAttendanceService.getLectureStudentList(openedLecNo, attendanceDate);
		log.debug(TeamColor.LCH + "lectureStudentList > " + lectureStudentList);

		model.addAttribute("date", attendanceDate);
		model.addAttribute("list", lectureStudentList);

		return "lecture/lectureAttendance/lectureAttendance";
	}

	// 출석 상태 변경
	@PostMapping("/professor/lectureAttendance")
	public String attendanceState(Model model, Attendance attendance,
			@RequestParam(value = "openedLecNo") int openedLecNo, RedirectAttributes redirectAttributes) {
		log.debug(TeamColor.LCH + "--- attendanceState Controller PostMapping ---");
		log.debug(TeamColor.LCH + "attendance > " + attendance);
		log.debug(TeamColor.LCH + "openedLecNo > " + openedLecNo);

		String checkAttendanceState = lectureAttendanceService.getAttendanceState(attendance);
		log.debug(TeamColor.LCH + "checkAttendanceState > " + checkAttendanceState);

		// 변경이력 확인 (없을 시 변경)
		if (checkAttendanceState.equals("대기중")) {
			int attendanceState = lectureAttendanceService.modifyAttendanceState(attendance);
			log.debug(TeamColor.LCH + "attendanceState > " + attendanceState);
		}

		redirectAttributes.addAttribute("attendanceDate", attendance.getAttendanceDate());
		redirectAttributes.addAttribute("openedLecNo", openedLecNo);
		return "redirect:/professor/lectureAttendance";
	}
}
