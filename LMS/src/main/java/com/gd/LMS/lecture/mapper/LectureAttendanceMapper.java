package com.gd.LMS.lecture.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.vo.Attendance;

@Mapper
public interface LectureAttendanceMapper {
	// 강의 출석 리스트
	Map<String, Object> selectLectureAttendanceList(int openedLecNo);

	// 학생강의코드
	int selectStudentLectureNo(Map<String, Object> studentMap);
	
	// 학생 출석부 생성
	int insertAttendanceListByDateAndLecNo(List<Map<String, Object>> list);
	
	// 학생이 보는 출석부
	List<Map<String, Object>> selectStudentAttendanceList(Map<String, Object> map);

	// 강의 출석부
	List<Map<String, Object>> selectLectureStudentList(Map<String, Object> map);

	// 출석상태확인
	String selectAttendanceState(Attendance attendance);

	// 출석 상태 변경
	int updateAttendanceState(Attendance attendance);
	
	
}
