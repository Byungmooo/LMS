package com.gd.LMS.member.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProfessorMapper {

	//교수리스트
	List<Map<String, Object>> selectProfessorList();

	//교수 상세보기
	Map<String, Object> selectProfessorOne(int professorCode);

	//교수 수정 폼
	Map<String, Object> updateProfessorOne(int professorCode);
	//수정 액션
	int updateProfessor(Map<String, Object> map);
	//교수 삭제
	int deleteProfessorMember(String memberId);
	
	
	
}
