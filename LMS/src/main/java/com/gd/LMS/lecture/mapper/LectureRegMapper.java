package com.gd.LMS.lecture.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.LectureTime;
import com.gd.LMS.vo.OpenedLecture;

@Mapper
public interface LectureRegMapper {
	
	/********** 교수 강의등록 ***********/
	// 해당 멤버코드 학부코드 받아오기
	String selectDepartmentCodeByProfessorCode(int memberCode);
	
	// 전체 학부강의 개수
	int selectTotalDepLectureCount(Map<String, Object> map);
	
	// 전체 학부강의 리스트
	List<Map<String, Object>> selectTotalDepLectureList(Map<String, Object> map2);
	
	// 선택강의 정보 
	Map<String, Object> selectTotalDepLectureOne(int lectureCode);
	
	// 건물 리스트
	List<Map<String, Object>> selectBuildingList();
	
	// 호수 리스트
	List<Map<String, Object>> selectClassroomList(int buildingNo);
	
	// 중복강의확인
	List<Map<String, Object>> selectProfessorLectureCheck(Map<String, Object> map);
	
	// 교수 강의신청 액션 (결과값 생긴 강의코드번호)
	int professorInsetLectureOne(OpenedLecture openedLecture);
	
	// 강의 시간표 생성
	int insertLectureTime(LectureTime lectureTime);
	
	/********** 학생 강의등록 ***********/
	// 해당 멤버코드 학부코드 받아오기
	String selectDepartmentCodeByStudentCode(int memberCode);
	
	// 진행강의 리스트
	List<Map<String, Object>> selectOpenedLectureList(Map<String, Object> map);
	
	// 진행강의 리스트 개수
	int selectOpenedLectureCount(Map<String, Object> map);
	
	// 장바구니 리스트
	List<Map<String, Object>> selectStudentLectureCartList(int memberCode);
	
	// 장바구니 담기
	int studentCartInsert(Map<String, Object> map);
	
	// 장바구니 중복 확인
	List<Map<String, Object>> selectStudentCartCheck(Map<String, Object> map);
	
	// 장바구니 빼기
	int studentCartDelete(String cartNo);
	
	// 수강신청 중복확인
	List<Map<String, Object>> selectStudentLectureCheck(Map<String, Object> map);
	
	// 수강신청
	int insertStudentLecture(List<Map<String, Object>> list);

	// 신청완료 시 장바구니 삭제
	int deleteStudentLectureCart(String studentCode);
}
