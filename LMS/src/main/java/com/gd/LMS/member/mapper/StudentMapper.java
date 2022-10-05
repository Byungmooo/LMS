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
	public int countStudent(Map<String, Object> map);
	
	//학생리스트
	public List<Map<String, Object>> selectStudentList(Map<String, Object> map);
	
	//학생정보 상세보기
	public Map<String, Object> selectStudentOne (int studentCode);
	
	//학생 추가하기
	public int insertStudent(Map<String, Object> map);
	
	//학생정보 수정
	public int updateStudent(Map<String, Object> map);
	
	//학생정보(member, student) 삭제
	public int deleteStudentMember(String memberId);

	//코드 생성메서드
	public String selectDateStudentCode(String memberId);
	

}
