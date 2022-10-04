package com.gd.LMS.lecture.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.lecture.mapper.LectureRegMapper;
import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.LectureTime;
import com.gd.LMS.vo.OpenedLecture;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class LectureRegService {
	@Autowired LectureRegMapper lectureRegMapper;
	
	/********** 교수 강의등록 ***********/
	// 해당 멤버코드 학부코드 받아오기
	public String getDepartmentCodeByProfessorCode(int memberCode) {
		return lectureRegMapper.selectDepartmentCodeByProfessorCode(memberCode);
	}
	
	// 전체 학부강의 개수
	public int getTotalDepLectureCount(Map<String, Object> map) {
		return lectureRegMapper.selectTotalDepLectureCount(map);
	}
	
	// 전체 학부강의 리스트
	public List<Map<String, Object>> getTotalDepLectureList(Map<String, Object> map2) {
		List<Map<String, Object>> list = lectureRegMapper.selectTotalDepLectureList(map2);
		return list;
	}
	
	// 선택강의 정보 
	public Map<String, Object> getTotalDepLectureOne(int lectureCode) {
		Map<String, Object> map = lectureRegMapper.selectTotalDepLectureOne(lectureCode);
		return map;
	}
	
	// 건물 리스트
	public List<Map<String, Object>> getBuildingList() {
		List<Map<String, Object>> list = lectureRegMapper.selectBuildingList();
		return list;
	}
	
	// 호수 리스트
	public List<Map<String, Object>> getClassroomList(int buildingNo) {
		List<Map<String, Object>> list = lectureRegMapper.selectClassroomList(buildingNo);
		return list;
	}
	
	// 중복강의확인
	public boolean getProfessorLectureCheck(int professorCode, int lectureCode) {
		boolean result = false;
		
		// 파라미터 세팅
		Map<String, Object> map = new HashMap<>();
		map.put("professorCode", professorCode);
		map.put("lectureCode", lectureCode);
		log.debug(TeamColor.LCH + "map > " + map);
		
		// 중복체크 (존재할 시 result = true)
		List<Map<String, Object>> list = lectureRegMapper.selectProfessorLectureCheck(map);
		if(list.size() != 0) {
			result = true;
		}
		return result;
	}
	
	// 강의등록 액션 (결과값 생긴 강의코드번호)
	public int professorAddLectureOne(OpenedLecture openedLecture) {
		lectureRegMapper.professorInsetLectureOne(openedLecture);
		// 만들어진 PK받아오기
		int key = openedLecture.getOpenedLecNo();
		return key;
	}
	
	// 강의시간표 생성
	public int addLectureTime(LectureTime lectureTime) {
		return lectureRegMapper.insertLectureTime(lectureTime);
	}
	
	/********** 학생 강의등록 ***********/
	// 해당 멤버코드 학부코드 받아오기
	public String getDepartmentCodeByStudentCode(int memberCode) {
		return lectureRegMapper.selectDepartmentCodeByStudentCode(memberCode);
	}
		
	// 진행중인 과목 리스트
	public List<Map<String, Object>> getOpenedLectureList(Map<String, Object> map) {
		List<Map<String, Object>> totalLectureList = lectureRegMapper.selectOpenedLectureList(map);
		return totalLectureList;
	}
	
	// 수강신청 중복 확인
	public boolean getStudentLectureCheck(Map<String, Object> map) {
		boolean result = false;
		
		// 중복체크 (존재할 시 result = true)
		List<Map<String, Object>> list = lectureRegMapper.selectStudentLectureCheck(map);
		if(list.size() > 0) {
			result = true;
		}		
		return result;
	}
	
	// 수강신청 액션
	public int addStudentLeture(List<Map<String, Object>> list) {
		int row = lectureRegMapper.insertStudentLecture(list);
		return row;
	}

	// 장바구니 리스트
	public List<Map<String, Object>> getStudentLectureCartList(int memberCode) {
		List<Map<String, Object>> studentLectureCartList = lectureRegMapper.selectStudentLectureCartList(memberCode);

		return studentLectureCartList;
	}

	// 진행과목개수
	public int getOpenedLectureCount(Map<String, Object> map) {
		return lectureRegMapper.selectOpenedLectureCount(map);
	}

	// 장바구니 담기
	public boolean studentCartAdd(Map<String, Object> map) {
		boolean check = false;
		
		// 장바구니 중복체크
		List<Map<String, Object>> list = lectureRegMapper.selectStudentCartCheck(map);
		if(list.size() == 0) {
			lectureRegMapper.studentCartInsert(map);
		} else {
			check = true;
		}		
		return check;
	}

	// 장바구니 빼기
	public int studentCartRemove(String cartNo) {
		return lectureRegMapper.studentCartDelete(cartNo);
	}

	// 장바구니 강의 삭제
	public int removeStudentLectureCart(String studentCode) {
		return lectureRegMapper.deleteStudentLectureCart(studentCode);
	}
}
