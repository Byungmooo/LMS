package com.gd.LMS.member.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.vo.Professor;

@Mapper
public interface ProfessorMapper {

	
	//총 교수 수
	int countProfessor(Map<String, Object> map);
	
	//교수리스트
	List<Professor> selectProfessorList();
	
	//교수 상세보기
	Map<String, Object> selectProfessorOne(int professorCode);

	//교수 수정 폼
	Map<String, Object> updateProfessorOne(int professorCode);
	//수정 액션
	int updateProfessor(Map<String, Object> map);
	
	//교수 삭제
	int deleteProfessorMember(String memberId);
	
	
	
}
