package com.gd.LMS.lecture.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.lecture.mapper.LectureAttendanceMapper;
import com.gd.LMS.schedule.mapper.ScheduleMapper;
import com.gd.LMS.vo.Attendance;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class LectureAttendanceService {
	@Autowired LectureAttendanceMapper lectureAttendanceMapper;
	@Autowired ScheduleMapper scheduleMapper;
	
	// 강의 날짜 계산
	public List<Map<String, Object>> calcLectureDate(int openedLecNo) {
		List<Map<String, Object>> list = null;
		Map<String, Object> map = null;
		
		// openedNo 요일 리스트
		List<Map<String, Object>> yoilList = scheduleMapper.selectLectureTime(openedLecNo);
		
		// year, openMonth, closeMonth 기준 달력 데이터 리스트
		Map<String, Object> lectureAttendanceList = lectureAttendanceMapper.selectLectureAttendanceList(openedLecNo);
		
		// Object타입 (int) 형 변환시 에러발생하여 String to Integer로 변경
		int openYear = Integer.valueOf(String.valueOf(lectureAttendanceList.get("openYear")));
		int closeYear = Integer.valueOf(String.valueOf(lectureAttendanceList.get("closeYear")));
		int openMonth = Integer.valueOf(String.valueOf(lectureAttendanceList.get("openMonth")));
		int closeMonth = Integer.valueOf(String.valueOf(lectureAttendanceList.get("closeMonth")));
		int openDay = Integer.valueOf(String.valueOf(lectureAttendanceList.get("openDay")));
		int closeDay = Integer.valueOf(String.valueOf(lectureAttendanceList.get("closeDay")));
		Calendar firstDay = Calendar.getInstance();
		
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + ". openedLecNo > " + openedLecNo);
		log.debug(TeamColor.LCH + " yoilList > " + yoilList);
		log.debug(TeamColor.LCH + " parameter > " + openYear + " / " + closeYear + " / " + openMonth + " / " + closeMonth + " / " + openDay + " / " + closeDay);
		
		// 강의 요일이 2개일 경우 각 요일에 대한 날짜 리스트를 구하기 위해 for문
		list = new ArrayList<Map<String, Object>>();
		for(int i=0; i<yoilList.size(); i++) {
			// 요일에 대한 정보 파라미터로 지정
			int yoil =  Integer.valueOf(String.valueOf(yoilList.get(i).get("lectureYoil")));
			
			// 시작하는 달부터 끝나는 달 까지 (년도는 일단 고려 x)
			for (int j=openMonth; j<=closeMonth; j++) {
				// Calendar함수로 날짜 데이터 가져오기
				firstDay.set(Calendar.YEAR, openYear);
				firstDay.set(Calendar.DATE, 1);
				firstDay.set(Calendar.MONTH, j - 1);
				int endDay = firstDay.getActualMaximum(Calendar.DATE);
				int dayOfWeek = firstDay.get(Calendar.DAY_OF_WEEK); // 
				log.debug(TeamColor.LCH + " Calendar > " + j + " / " + endDay + " / week > " + dayOfWeek);
				
				// 달력의 시작지점을 1부터 끝나는 날짜까지 for문
				for(int k=1; k<=(endDay+dayOfWeek-1); k++) {
					map = new HashMap<String, Object>();
					String year = "" + openYear;
					String month = "";
					String day = "";
					
					// 시작하는 달과 끝나는 달은 날짜를 따로 지정 
					if(j == openMonth) {
						// k변수는 시작지점 dayOfWeek는 시작날짜를 정하기 위한 변수
						if(k>=(dayOfWeek+openDay-1) && (k%7 == (yoil+1))) {					
							// 데이터 타입을 위해 10보다 작은 숫자는 0을 붙임
							if(j<10) { month = "0"+j; } 
							else { month = ""+j; }
							if((k-dayOfWeek+1)<10) { day = "0"+(k-dayOfWeek+1); } 
							else { day = ""+(k-dayOfWeek+1); }
							String attendanceDate = year + month + day;
							map.put("attendanceDate", attendanceDate);
							list.add(map);
						}						
					} else if(j == closeMonth) {
						if(k>=dayOfWeek && k<=(dayOfWeek+closeDay-1) && (k%7 == (yoil+1))) {
							if(j<10) { month = "0"+j; } 
							else { month = ""+j; }
							if((k-dayOfWeek+1)<10) { day = "0"+(k-dayOfWeek+1); } 
							else { day = ""+(k-dayOfWeek+1); }
							String attendanceDate = year + month + day;
							map.put("attendanceDate", attendanceDate);
							list.add(map);
						}						
					} else {
						if(k>=dayOfWeek && (k%7 == (yoil+1))) {			
							if(j<10) { month = "0"+j; } 
							else { month = ""+j; }
							if((k-dayOfWeek+1)<10) { day = "0"+(k-dayOfWeek+1); } 
							else { day = ""+(k-dayOfWeek+1); }
							String attendanceDate = year + month + day;
							map.put("attendanceDate", attendanceDate);
							list.add(map);
						}						
					}
				}
			}
		}		
		return list;
	}
	
	// 학생 출석부 자동등록
	public int addAttendanceByList(List<Map<String, Object>> paramList) {
		// 계산에 필요한 List와 Map 지정
		List<Map<String, Object>> resultList = null;
		Map<String, Object> resultMap = null;
		Map<String, Object> studentMap = null;
		int result = 0;
		
		// 수강신청한 학생코드와 openedLecNo 강의번호리스트
		log.debug(TeamColor.LCH + "paramList > " + paramList);
		
		for(int i=0; i<paramList.size(); i++) {
			// 파라미터 생성
			resultList = new ArrayList<Map<String, Object>>();
			int openedLecNo = Integer.parseInt(String.valueOf(paramList.get(i).get("openedLecNo")));
			int studentCode = Integer.parseInt(String.valueOf(paramList.get(i).get("studentCode")));
			
			// studentLectureNo코드 가져오기
			studentMap = new HashMap<String, Object>();
			studentMap.put("openedLecNo", openedLecNo);
			studentMap.put("studentCode", studentCode);
			int studentLecNo = lectureAttendanceMapper.selectStudentLectureNo(studentMap);
			log.debug(TeamColor.LCH + "studentLecNo > " + studentLecNo);
			
			// 강의날짜 메서드 호출
			List<Map<String, Object>> list = calcLectureDate(openedLecNo);
			
			// 출석부에 필요한 파라미터 리스트 생성
			for(int j=0; j<list.size(); j++) {
				resultMap = new HashMap<String, Object>();
				resultMap = list.get(j);
				resultMap.put("studentLecNo", studentLecNo);
				
				resultList.add(resultMap);
			}
			log.debug(TeamColor.LCH + "resultList > " + resultList);
			
			// 수업 날짜 리스트로 출석부 insert
			int addAttendance = lectureAttendanceMapper.insertAttendanceListByDateAndLecNo(resultList);
			
			log.debug(TeamColor.LCH + studentCode + " > " + addAttendance + "개의 출석부 생성");
			result += addAttendance;
			
		}		
		return result;
	}
	
	// 학생이 보는 출석부
	public List<Map<String, Object>> getStudentAttendanceList(Map<String, Object> map) {
		List<Map<String, Object>> list = lectureAttendanceMapper.selectStudentAttendanceList(map);
		return list;
	}

	// 강의 출석부
	public List<Map<String, Object>> getLectureStudentList(int openedLecNo, String attendanceDate) {
		Map<String, Object> map = new HashMap<>();
		map.put("openedLecNo", openedLecNo);
		map.put("attendanceDate", attendanceDate);

		List<Map<String, Object>> list = lectureAttendanceMapper.selectLectureStudentList(map);

		return list;
	}
	
	// 출석상태확인
	public String getAttendanceState(Attendance attendance) {
		return lectureAttendanceMapper.selectAttendanceState(attendance);
	}

	// 출석 상태 변경
	public int modifyAttendanceState(Attendance attendance) {
		return lectureAttendanceMapper.updateAttendanceState(attendance);
	}
}
