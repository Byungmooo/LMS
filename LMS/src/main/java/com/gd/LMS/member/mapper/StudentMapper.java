package com.gd.LMS.member.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.vo.Member;
import com.gd.LMS.vo.Professor;
import com.gd.LMS.vo.Student;

@Mapper
public interface StudentMapper {
	

	//총 학생 수
	int countStudent(Map<String, Object> map);
	
	// 페이징 처리 후 학생리스트
	List<Map<String, Object>> selectStudentList(Map<String, Object> map);
	
	//학생정보 상세보기
	Map<String, Object> selectStudentOne (int studentCode);
	
	//학생 추가하기
	int insertStudent(Map<String, Object> map);
	
	//수정 폼
	Map<String, Object> updateStudentOne(int studentCode);
	//수정 액션
	int updateStudent(Map<String, Object> map);
	
	//학생정보(member, student) 삭제
	int deleteStudentMember(String memberId);

	//코드 생성메서드
	String selectDateStudentCode(String memberId);
	

}
