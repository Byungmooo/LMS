package com.gd.LMS.member.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.Student;

@Mapper
public interface StudentMapper {
	
	
	//학생리스트
	List<Map<String, Object>> selectStudentList ();
	
	//학생정보 상세보기
	Map<String, Object> selectStudentOne (int studentCode);
	
	//학생정보 수정
	Student updateStudentOne(int studentCode);
	int updateStudent(Student student);
	
	
	//학생정보 삭제
	int deleteStudent(int studentCode);
	
	
	

}
