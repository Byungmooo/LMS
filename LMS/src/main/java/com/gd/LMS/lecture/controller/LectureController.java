package com.gd.LMS.lecture.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.lecture.service.LectureService;
import com.gd.LMS.schedule.service.ScheduleService;
import com.gd.LMS.utils.LectureListVo;
import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.Attendance;
import com.gd.LMS.vo.LectureAnswer;
import com.gd.LMS.vo.LectureQuestion;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LectureController {
	@Autowired LectureService lectureService;
	@Autowired ScheduleService scheduleService;

	// 학생이 수강중인 강의리스트
	@GetMapping("/student/studentLectureList")
	public String studentLectureList(Model model, HttpSession session,
			@RequestParam(value = "memberCode") int memberCode) {
		log.debug(TeamColor.LCH + "--- studentLectureList Controller GetMapping ---");

		// 학생수강리스트 메서드 호출 후 리턴값 디버깅
		List<Map<String, Object>> studentLectureList = lectureService.getStudentLectureList(memberCode);
		log.debug(TeamColor.LCH + "studentLectureList (controller) > " + studentLectureList);

		session.setAttribute("memberCode", memberCode);
		model.addAttribute("list", studentLectureList);
		return "lecture/studentLectureList";
	}

	// 강의 상세보기
	@GetMapping("/student/openedLectureOne")
	public String openedLectureOne(Model model, @RequestParam(value = "openedLecNo") int openedLecNo,
			HttpSession session) {
		log.debug(TeamColor.LCH + "--- openedLectureOne Controller GetMapping ---");

		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "openedLecNo (controller) > " + openedLecNo);

		// 학생수강리스트 메서드 호출 후 리턴값 디버깅
		Map<String, Object> openedLectureOne = lectureService.getOpenedLectureOne(openedLecNo);
		log.debug(TeamColor.LCH + "openedLectureOne (controller) > " + openedLectureOne);

		model.addAttribute("map", openedLectureOne);
		session.setAttribute("openedLecNo", openedLecNo);
		return "lecture/openedLectureOne";
	}	

	// 학생 수강신청 화면
	@GetMapping("/student/studentLectureReg")
	public String studentLectureReg(PagingVo vo, Model model
			, @RequestParam(value="memberCode") int memberCode
			, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
			, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage
			, @RequestParam(value="keyword", defaultValue = "") String keyword) {
		
		int totalLectureCount = lectureService.getOpenedLectureCount(keyword);
		vo = new PagingVo(currentPage, totalLectureCount, rowPerPage, keyword, null);
		
		log.debug(TeamColor.LCH + "count > " + totalLectureCount);
		log.debug(TeamColor.LCH + "vo > " + vo);
		
		List<Map<String, Object>> openedLectureList = lectureService.getOpenedLectureList(vo);
		log.debug(TeamColor.LCH + "openedLectureList > " + openedLectureList);
		
		List<Map<String, Object>> studentLectureCartList = lectureService.getStudentLectureCartList(memberCode);
		int size = 9 - studentLectureCartList.size();
		
		if(size < 0 ) { size = 0;}
		
		model.addAttribute("openedList", openedLectureList);
		model.addAttribute("paging", vo);
		model.addAttribute("size", size);
		model.addAttribute("cartList", studentLectureCartList);
		
		return "lecture/studentLectureReg";
	}

	// 학생 수강신청 액션
	@PostMapping("/student/studentLectureReg")
	public String studentLectureReg(LectureListVo lectureList, RedirectAttributes redirectAttributes) {
		log.debug(TeamColor.LCH + "lectureList > " + lectureList);
		
		Map<String, Object> map = null;
		List<Map<String, Object>> list = new ArrayList<>();
		
		int length = lectureList.getOpenedLecNo2().length;
		
		for(int i=0; i<length; i++) {
			map = new HashMap<>();
			map.put("studentCode", lectureList.getStudentCode2()[i]);
			map.put("openedLecNo", lectureList.getOpenedLecNo2()[i]);
			list.add(map);
		}
		
		log.debug(TeamColor.LCH + "size > " + lectureList.getOpenedLecNo2().length);		
		log.debug(TeamColor.LCH + "map > " + map);		
		log.debug(TeamColor.LCH + "list > " + list);		
		
		int result = lectureService.addStudentLeture(list);
		
		if(result != 0) {
			// 수강신청 성공 시 장바구니강의 삭제
			String studentCode = (String) list.get(0).get("studentCode");
			int row = lectureService.removeStudentLectureCart(studentCode);
			if(row==0) {
				log.debug(TeamColor.LCH + "실패 row > " + row);
				return "redirect:/studentLectureReg";
			}
			log.debug(TeamColor.LCH + row + "개의 강의 삭제성공");
		}
		
		redirectAttributes.addAttribute("memberCode", list.get(0).get("studentCode"));
		return "redirect:/student/studentLectureReg";
	}

	// 학생 장바구니 담기
	@PostMapping("/student/cartAdd")
	public @ResponseBody String cartAdd(Map<String, Object> map,
			@RequestParam (value = "openedLecNo") String openedLecNo,
			@RequestParam (value = "studentCode") String studentCode) {
		log.debug(TeamColor.LCH + "--- cartAdd Controller PostMapping ---");
		
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "openedLecNo (controller) > " + openedLecNo);
		log.debug(TeamColor.LCH + "studentCode (controller) > " + studentCode);
		
		map.put("openedLecNo", openedLecNo);
		map.put("studentCode", studentCode);
		log.debug(TeamColor.LCH + "map (controller) > " + map);
		
		// 리턴값 디버깅
		int result = lectureService.studentCartAdd(map);
		log.debug(TeamColor.LCH + "result (controller) > " + result);
		
		// ajax Json에 보낼 메시지
		String returnJson;
		
		// 리턴값이 null일 경우 사용가능한 아이디
		if(result != 0) {
			returnJson = "y";
		} else {
			returnJson = "n";
		}
		
		return returnJson;
	}
	
	// 학생 장바구니 빼기
	@PostMapping("/student/cartRemove")
	public @ResponseBody String cartRemove(@RequestParam (value = "cartNo") String cartNo) {
		log.debug(TeamColor.LCH + "--- cartDelete Controller PostMapping ---");
		
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "cartNo (controller) > " + cartNo);
		
		// 리턴값 디버깅
		int result = lectureService.studentCartRemove(cartNo);
		log.debug(TeamColor.LCH + "result (controller) > " + result);
		
		// ajax Json에 보낼 메시지
		String returnJson;
		
		// 리턴값이 null일 경우 사용가능한 아이디
		if(result != 0) {
			returnJson = "y";
		} else {
			returnJson = "n";
		}
		
		return returnJson;
	}
	
	// 강의 출석 리스트
	@GetMapping("/student/lectureAttendanceList")
	public String lectureAttendanceList(Model model, Map<String, Object> map
			, @RequestParam (value = "openedLecNo") int openedLecNo
			, @RequestParam (value = "memberCode") int memberCode) {
		log.debug(TeamColor.LCH + "--- lectureAttendanceList Controller GetMapping ---");
		
		// 강의 날짜관련 데이터 갖고오기
		Map<String, Object> lectureAttendanceList = lectureService.getLectureAttendanceList(openedLecNo);
		log.debug(TeamColor.LCH + "lectureAttendanceList > " + lectureAttendanceList);
		
		// Object타입 (int) 형 변환시 에러발생하여 String to Integer로 변경
		int year = (Integer.valueOf(String.valueOf(lectureAttendanceList.get("openYear"))));
		int openMonth = (Integer.valueOf(String.valueOf(lectureAttendanceList.get("openMonth"))));
		int closeMonth = (Integer.valueOf(String.valueOf(lectureAttendanceList.get("closeMonth"))));
		log.debug(TeamColor.LCH + " parameter > " + year + " / " + openMonth + " / " + closeMonth);
		
		// 해당 강의 요일데이터
		List<Map<String, Object>> lectureTimeList = scheduleService.getLectureTime(openedLecNo);
		log.debug(TeamColor.LCH + "lectureTimeList > " + lectureTimeList);
		
		// 날짜 데이터 가져오기
		List<Map<String,Object>> day = lectureService.calcLectureCalendar(year, openMonth, closeMonth);
		log.debug(TeamColor.LCH + " calc > " + day);
		
		// 학생 출석 정보 가져오기
		map.put("openedLecNo", openedLecNo);
		map.put("studentCode", memberCode);
		List<Map<String, Object>> studentAttendanceList = lectureService.getStudentAttendanceList(map);
		log.debug(TeamColor.LCH + "studentAttendanceList > " + studentAttendanceList);
		
		model.addAttribute("studentAttendance", studentAttendanceList);
		model.addAttribute("lectureTime", lectureTimeList);
		model.addAttribute("day", day);
		model.addAttribute("list", lectureAttendanceList);
		
		return "lecture/lectureAttendanceList";
	}

	// 강의 출석부
	@GetMapping("/lectureAttendance")
	public String lectureAttendane(Model model, @RequestParam(value = "openedLecNo") int openedLecNo,
			@RequestParam(value = "year", defaultValue = "-1") String year,
			@RequestParam(value = "month", defaultValue = "-1") String month,
			@RequestParam(value = "day", defaultValue = "-1") String day,
			@RequestParam(value = "attendanceDate", defaultValue = "") String attendanceDate) {
		log.debug(TeamColor.LCH + "--- lectureAttendane Controller GetMapping ---");

		if (attendanceDate.equals("")) {
			if (Integer.parseInt(month) < 10) {
				month = "0" + month;
				if (Integer.parseInt(day) < 10) {
					day = "0" + day;
				}
			}
			attendanceDate = year + month + day;
		}
		log.debug(TeamColor.LCH + "attendanceDate > " + attendanceDate);

		// 해당날짜 출석부 확인
		boolean checkAttendance = lectureService.getAttendanceCheck(attendanceDate, openedLecNo);
		if (checkAttendance) {
			log.debug(TeamColor.LCH + attendanceDate + "일 자 출석부 생성");
		}

		List<Map<String, Object>> lectureStudentList = lectureService.getLectureStudentList(openedLecNo,
				attendanceDate);

		log.debug(TeamColor.LCH + "lectureStudentList > " + lectureStudentList);

		model.addAttribute("date", attendanceDate);
		model.addAttribute("list", lectureStudentList);

		return "lecture/lectureAttendance";
	}

	// 출석 상태 변경
	@PostMapping("/lectureAttendance")
	public String attendanceState(Model model, Attendance attendance,
			@RequestParam(value = "openedLecNo") int openedLecNo, RedirectAttributes redirectAttributes) {
		log.debug(TeamColor.LCH + "--- attendanceState Controller GetMapping ---");
		log.debug(TeamColor.LCH + "studentLecNo > " + attendance.getStudentLecNo());
		log.debug(TeamColor.LCH + "attendanceState > " + attendance.getAttendanceState());
		log.debug(TeamColor.LCH + "attendanceDate > " + attendance.getAttendanceDate());
		log.debug(TeamColor.LCH + "openedLecNo > " + openedLecNo);

		String checkAttendanceState = lectureService.getAttendanceState(attendance);
		log.debug(TeamColor.LCH + "checkAttendanceState > " + checkAttendanceState);

		// 변경이력 확인 (없을 시 변경)
		if (checkAttendanceState.equals("대기중")) {
			int attendanceState = lectureService.modifyAttendanceState(attendance);
			log.debug(TeamColor.LCH + "attendanceState > " + attendanceState);
		}

		redirectAttributes.addAttribute("attendanceDate", attendance.getAttendanceDate());
		redirectAttributes.addAttribute("openedLecNo", openedLecNo);
		return "redirect:/lectureAttendance";
	}

	

	// 지울거임
	@GetMapping("/result")
	public String resultPage() {
		return "resultPage";
	}

}
