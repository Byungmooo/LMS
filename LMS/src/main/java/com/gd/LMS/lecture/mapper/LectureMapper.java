package com.gd.LMS.lecture.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.Attendance;
import com.gd.LMS.vo.LectureAnswer;
import com.gd.LMS.vo.LectureQuestion;

@Mapper
public interface LectureMapper {

	// 수강리스트
	List<Map<String, Object>> selectStudentLectureList(int studentCode);
	
	// 진행강의리스트
	List<Map<String, Object>> selectProfessorLectureList(int professorCode);
	
	// 강의 상세보기
	Map<String, Object> selectOpenedLectureOne(int openedLecNo);

	// 학생 수강신청 (전체과목)
	List<Map<String, Object>> selectOpenedLectureList(PagingVo vo);

	// 학생 수강신청 (신청)
	int insertStudentLecture(List<Map<String, Object>> list);

	// 학생 수강신청 (장바구니)
	List<Map<String, Object>> selectStudentLectureCartList(int memberCode);

	// 학생 수강신청 (전체과목수)
	int selectOpenedLectureCount(String keyword);

	// 학생 수강신청 (수강담기)
	int studentCartInsert(Map<String, Object> map);

	// 학생 수강신청 (수강취소)
	int studentCartDelete(String cartNo);

	// 학생 장바구니 삭제
	int deleteStudentLectureCart(String studentCode);

	// 강의 출석 리스트
	Map<String, Object> selectLectureAttendanceList(int openedLecNo);

	// 학생이 보는 출석부
	List<Map<String, Object>> selectStudentAttendanceList(Map<String, Object> map);

	// 강의 출석부
	List<Map<String, Object>> selectLectureStudentList(Map<String, Object> map);

	// 출석부 존재 확인
	List<String> selectAttendanceCheck(String attendanceDate);

	// 강의 학생확인
	List<String> selectOpenLectureStudentList(int openedLecNo);

	// 출석부 생성
	int insertAttendanceByDate(List<Map<String, Object>> list);

	// 출석상태확인
	String selectAttendanceState(Attendance attendance);

	// 출석 상태 변경
	int updateAttendanceState(Attendance attendance);

	

}
