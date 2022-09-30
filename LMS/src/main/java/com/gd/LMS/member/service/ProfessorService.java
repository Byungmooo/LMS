package com.gd.LMS.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.LMS.assignment.test;
import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.member.mapper.ProfessorMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProfessorService {
	@Autowired  ProfessorMapper professorMapper;
	
	
	//교수 리스트 보기
	public List<Map<String, Object>> getProfessorList(){

		 log.debug(TeamColor.BJH + "ProfessorList 담겼음");
		 
		 List<Map<String, Object>> ProfessorList = professorMapper.selectProfessorList();
		 log.debug(TeamColor.BJH + "ProfessorList 넘겨");
		 
		 return ProfessorList;
	};
	
		
	
	//교수 상세보기
	public Map<String, Object> getProfessorOne(int professorCode) {
		// 파라미터 디버깅
		log.debug(TeamColor.BJH + "상세보기 (service) > " + professorCode);
		
		// 매퍼메서드 호출 후 리턴값 디버깅
		Map<String, Object> ProfessorOne = professorMapper.selectProfessorOne(professorCode);
		log.debug(TeamColor.BJH + "StudentOne (service) > " + ProfessorOne);
				
		 return ProfessorOne;
	}
	
	// 교수정보 수정 폼
	public Map<String, Object> getProfessor(int professorCode) {
		log.debug(TeamColor.BJH + "수정폼(service) > " + professorCode);
		
		Map<String, Object> updateOne = professorMapper.updateProfessorOne(professorCode);
		log.debug(TeamColor.BJH + "updateOne (service) > " + updateOne);
		return updateOne;
	}
	
    // 교수정보 수정액션
    public int modifyProfessor(Map<String, Object> map) {
    	
    	int row = professorMapper.updateProfessor(map);
    	log.debug(TeamColor.BJH + "교수정보 수정액션(map) =====> " + map);
    
        return row;
    }
    
    /*
    //교수정보 > 학과 자동설정 폼
    
    public Map<String, Object> addProfrossForm() {
		Map<String, Object> resultMap = new HashMap<>();
    
		List<Map<String, Object>> departmentList = departmentMapper.selectDepList();
		resultMap.put("d", departmentList);
		
		return resultMap;
    }
    
    
    */
   
    // 교수 삭제	
    public String removeProfessorMember(String memberId) {
    	
    	professorMapper.deleteProfessorMember(memberId);
        log.debug(TeamColor.BJH + "교수, 멤버테이블(삭제) > " + memberId);
    	
        return memberId;
        
    }
    
}
	
	