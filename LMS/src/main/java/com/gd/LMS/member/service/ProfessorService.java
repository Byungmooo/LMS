package com.gd.LMS.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.LMS.assignment.test;
import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.member.mapper.ProfessorMapper;
import com.gd.LMS.vo.Employee;
import com.gd.LMS.vo.Professor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProfessorService {
	@Autowired  ProfessorMapper professorMapper;
	
	
	
	// 전체 교수 목록 리스트
	public List<Professor> selectProfessorList(Map<String, Object> map) {
		log.debug(TeamColor.BJH + "전체 교수 목록 서비스 진입==============");
		return professorMapper.selectProfessorList(map);
	}
	
	// 총 교수 수
	public int countProfessor(Map<String, Object> map) {
		log.debug(TeamColor.BJH + "전체 교수 카운트 서비스 진입==============");
		return professorMapper.countProfessor(map);
	}
		
	
	//교수 상세보기
	public Map<String, Object> getProfessorOne(int professorCode) {
		// 파라미터 디버깅
		log.debug(TeamColor.BJH + "교수 상세보기 서비스 진입 ================ " + professorCode);
		
		// 매퍼메서드 호출 후 리턴값 디버깅
		Map<String, Object> professorOne = professorMapper.selectProfessorOne(professorCode);
		log.debug(TeamColor.BJH + "상세보기 professorOne 담기 >>>>>> " + professorOne);
				
		 return professorOne;
	}
	
	// 교수정보 수정 폼
	public Map<String, Object> getProfessor(int professorCode) {
		log.debug(TeamColor.BJH + "Professor 수정폼 서비스 진입===========" + professorCode);
		
		Map<String, Object> updateOne = professorMapper.updateProfessorOne(professorCode);
		log.debug(TeamColor.BJH + "updateOne (service) > " + updateOne);
		return updateOne;
	}
	
    // 교수정보 수정액션
    public int modifyProfessor(Map<String, Object> map) {
    	
    	int row = professorMapper.updateProfessor(map);
    	if(row != 0) {
			log.debug(TeamColor.BJH + "교수정보 수정 성공");
		}
		log.debug(TeamColor.BJH + "교수정보 수정 실패");

        return row;
    }
       
    // 교수 삭제	
    public String removeProfessorMember(String memberId) {
    	
    	professorMapper.deleteProfessorMember(memberId);
        log.debug(TeamColor.BJH + "교수, 멤버테이블(삭제) > " + memberId);
    	
        return memberId;
        
    }
    
}
	
	