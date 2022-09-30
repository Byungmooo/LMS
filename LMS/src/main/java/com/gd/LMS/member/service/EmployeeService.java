package com.gd.LMS.member.service;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.member.mapper.EmployeeMapper;
import com.gd.LMS.vo.Department;
import com.gd.LMS.vo.Employee;
import com.gd.LMS.vo.Student;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class EmployeeService {
	@Autowired EmployeeMapper employeeMapper;
	
	
	
	// 전체 직원 목록 리스트
	public List<Map<String, Object>> selectEmployeeList(Map<String, Object> map) {
		log.debug(TeamColor.BJH + "전체직원 목록 서비스 진입==============");
		return employeeMapper.selectEmployeeList(map);
	}
	
	
	// 학부 총 개수
	public int countEmployee(Map<String, Object> map) {
		log.debug(TeamColor.BJH + "전체직원 카운트 서비스 진입==============");
		return employeeMapper.countEmployee(map);
	}
	

	//직원 상세보기
	public Map<String, Object> getEmployeeOne(int employeeCode) {
		// 파라미터 디버깅
		log.debug(TeamColor.BJH + "직원 상세보기 서비스 진입 ================ " + employeeCode);
		
		// 매퍼메서드 호출 후 리턴값 디버깅
		Map<String, Object> employeeOne = employeeMapper.selectEmployeeOne(employeeCode);
		log.debug(TeamColor.BJH + "상세보기 employeeOne 담기 >>>>>>" + employeeCode);
				
		 return employeeOne;
	}
	
	// 직원정보 수정 폼
	public Map<String, Object> getEmployee(int employeeCode) {
		log.debug(TeamColor.BJH + "emlpoyee 수정폼 서비스 진입===========" + employeeCode);
		
		Map<String, Object> updateOne = employeeMapper.updateEmployeeOne(employeeCode);
		log.debug(TeamColor.BJH + "updateOne에 담음=========" + updateOne);
		return updateOne;
	}
	
    // 직원정보 수정액션
    public int modifyEmployee(Map<String, Object> map) {
    	
    	//log.debug(TeamColor.BJH + "map studentYear ==> " + map.get("studentYear"));
    	int row = employeeMapper.updateEmployee(map);
    	if(row != 0) {
			log.debug(TeamColor.BJH + "직원정보 수정 성공");
		}
		log.debug(TeamColor.BJH + "직원정보 수정 실패");

    
        return row;
    }
	    

    // 직원 삭제	
    public String removeEmployeeMember(String memberId) {
    	
    	employeeMapper.deleteEmployeeMember(memberId);
        log.debug(TeamColor.BJH + "직원, 멤버테이블 데이터(삭제) > " + memberId);
    	
        return memberId;
        
    }
	

}
