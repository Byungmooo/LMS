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
import com.gd.LMS.lecture.mapper.LectureMapper;
import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.Attendance;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class LectureService {
	@Autowired
	LectureMapper lectureMapper;

	// 수강리스트
	public List<Map<String, Object>> getStudentLectureList(int studentCode) {
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "studentCode (service) > " + studentCode);

		// 매퍼메서드 호출 후 리턴값 디버깅
		List<Map<String, Object>> studentLectureList = lectureMapper.selectStudentLectureList(studentCode);
		log.debug(TeamColor.LCH + "studentLectureList (service) > " + studentLectureList);

		return studentLectureList;
	}
	
	// 진행강의리스트
	public List<Map<String, Object>> getProfessorLectureList(int professorCode) {
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "professorCode (service) > " + professorCode);

		// 매퍼메서드 호출 후 리턴값 디버깅
		List<Map<String, Object>> professorLectureList = lectureMapper.selectProfessorLectureList(professorCode);
		log.debug(TeamColor.LCH + "professorLectureList (service) > " + professorLectureList);

		return professorLectureList;
	}
	
	// 강의 상세보기
	public Map<String, Object> getOpenedLectureOne(int openedLecNo) {
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "openedLecNo (service) > " + openedLecNo);

		// 매퍼메서드 호출 후 리턴값 디버깅
		Map<String, Object> openedLectureOne = lectureMapper.selectOpenedLectureOne(openedLecNo);
		log.debug(TeamColor.LCH + "studentLectureOne (service) > " + openedLectureOne);

		return openedLectureOne;
	}

	// 학생 수강신청 (전체 과목 리스트)
	public List<Map<String, Object>> getOpenedLectureList(PagingVo vo) {

		List<Map<String, Object>> totalLectureList = lectureMapper.selectOpenedLectureList(vo);

		return totalLectureList;
	}

	// 학생 수강신청 (신청하기)
	public int addStudentLeture(List<Map<String, Object>> list) {
		int row = lectureMapper.insertStudentLecture(list);
		return row;
	}

	// 학생 수강신청 (장바구니)
	public List<Map<String, Object>> getStudentLectureCartList(int memberCode) {

		List<Map<String, Object>> studentLectureCartList = lectureMapper.selectStudentLectureCartList(memberCode);

		return studentLectureCartList;
	}

	// 학생 수강신청 (전체과목개수)
	public int getOpenedLectureCount(String keyword) {
		return lectureMapper.selectOpenedLectureCount(keyword);
	}

	// 학생 수강신청 (수강담기)
	public int studentCartAdd(Map<String, Object> map) {
		return lectureMapper.studentCartInsert(map);
	}

	// 학생 수강신청 (수강취소)
	public int studentCartRemove(String cartNo) {
		return lectureMapper.studentCartDelete(cartNo);
	}

	// 장바구니 강의 삭제
	public int removeStudentLectureCart(String studentCode) {
		return lectureMapper.deleteStudentLectureCart(studentCode);
	}

	// 강의 출석 리스트
	public Map<String, Object> getLectureAttendanceList(int openedLecNo) {
		Map<String, Object> lectureAttendanceList = lectureMapper.selectLectureAttendanceList(openedLecNo);
		return lectureAttendanceList;
	}

	// 강의 날짜 구하기 (매퍼없이 계산만 해서 리턴)
	public List<Map<String, Object>> calcLectureCalendar(int year, int openMonth, int closeMonth) {
		log.debug(TeamColor.LCH + " parameter > " + year + " / " + openMonth + " / " + closeMonth);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = null;
		Calendar firstDay = Calendar.getInstance();

		for (int i = openMonth; i <= closeMonth; i++) {
			map = new HashMap<String, Object>();
			firstDay.set(Calendar.YEAR, year);
			firstDay.set(Calendar.DATE, 1);
			firstDay.set(Calendar.MONTH, i - 1);
			int endDay = firstDay.getActualMaximum(Calendar.DATE);
			int dayOfWeek = firstDay.get(Calendar.DAY_OF_WEEK);

			map.put("endDay", endDay);
			map.put("year", year);
			map.put("month", i);
			map.put("week", dayOfWeek);

			list.add(map);
		}

		return list;
	}

	// 학생이 보는 출석부
	public List<Map<String, Object>> getStudentAttendanceList(Map<String, Object> map) {
		List<Map<String, Object>> list = lectureMapper.selectStudentAttendanceList(map);
		return list;
	}

	// 강의 출석부
	public List<Map<String, Object>> getLectureStudentList(int openedLecNo, String attendanceDate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("openedLecNo", openedLecNo);
		map.put("attendanceDate", attendanceDate);

		List<Map<String, Object>> list = lectureMapper.selectLectureStudentList(map);

		return list;
	}

	// 해당일에 출석부가 없을 시 학생출석부 기본데이터 생성
	public boolean getAttendanceCheck(String attendanceDate, int openedLecNo) {
		boolean checkAttendance = false;

		List<String> checkList = lectureMapper.selectAttendanceCheck(attendanceDate);
		log.debug(TeamColor.LCH + "checkList > " + checkList);

		// 출석부가 없을 시
		if (checkList.size() == 0) {
			Map<String, Object> map = null;
			List<Map<String, Object>> list = new ArrayList<>();

			// 해당 강의 학생 데이터
			List<String> studentLecNoList = lectureMapper.selectOpenLectureStudentList(openedLecNo);
			log.debug(TeamColor.LCH + "studentLecNoList > " + studentLecNoList);

			// 리스트에 출석부 생성에 필요한 파라미터를 담아 리스트로 저장
			int size = studentLecNoList.size();
			for (int i = 0; i < size; i++) {
				map = new HashMap<>();
				map.put("studentLecNo", studentLecNoList.get(i));
				map.put("attendanceDate", attendanceDate);
				list.add(map);
			}
			log.debug(TeamColor.LCH + "list > " + list);

			// 출석부 생성
			int result = lectureMapper.insertAttendanceByDate(list);

			if (result != 0) {
				checkAttendance = true;
			}
		}
		return checkAttendance;
	}

	// 출석상태확인
	public String getAttendanceState(Attendance attendance) {
		return lectureMapper.selectAttendanceState(attendance);
	}

	// 출석 상태 변경
	public int modifyAttendanceState(Attendance attendance) {
		return lectureMapper.updateAttendanceState(attendance);
	}

	

}
