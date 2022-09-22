package com.gd.LMS.member.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.vo.Member;
import com.gd.LMS.vo.Student;

@Mapper
public interface StudentMapper {
	
	
	//학생리스트
	List<Map<String, Object>> selectStudentList ();
	
	//학생정보 상세보기
	Map<String, Object> selectStudentOne (int studentCode);
	
	//학생 추가

	int addStudent(Student student);
	Map<String, Object> addStudentForm();
	int addStudentAction(Student student);
	
	
	//수정 폼
	Map<String, Object> updateStudentOne(int studentCode);
	//수정 액션
	int updateStudent(Map<String, Object> map);
	
	
	//학생정보 삭제
	int deleteStudent(int studentCode);
	
	
	

}
