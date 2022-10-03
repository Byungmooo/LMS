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
	
	//수정 폼
	Map<String, Object> updateStudentOne(int studentCode);
	//수정 액션
	int updateStudent(Map<String, Object> map);
	
	//학생정보(member, student) 삭제
	int deleteStudentMember(String memberId);
	
	
	
	///////////////////////////////승인
	
	// 학생 승인 대기 목록
	// map에 member객체/페이징객체 담아야함
	List<Member> selectStudentQueueList(Map<String,Object> map);
	
	// 학생 테이블 추가
	int insertStudent(Student student);
	
	// 학생 승인 거절
	int deleteStudentQueue(String memberId);
	
	// 학생 승인과 상태 업데이트
	int updateStudentState(Member member); 
	
	// 학생 승인대기 상세
	Member selectStudentQueueOne(String memberId);

	//승인 카운트 페이징
	int selectStudentQueueCount();
	
	
	
	

}
