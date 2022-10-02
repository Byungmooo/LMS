package com.gd.LMS.department.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.department.mapper.DepartmentMapper;
import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.Department;
import com.gd.LMS.vo.TotalNotice;

import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class DepartmentService {
	
	@Autowired DepartmentMapper departmentMapper;
	
	// 전체공지사항 목록 리스트
	public List<Department> getDepartmentList(Map<String, Object> map) {
		return departmentMapper.selectDepartment(map);
	}
	
	// 학부 총 개수
	public int countDepartment(Map<String, Object> map) {
		return departmentMapper.countDepartment(map);
	}
	
	//학부정보 상세보기
	public Department getDepartMentOne(String departmentCode) {
		log.debug(TeamColor.BJH + "학부정보 상세보기 서비스 진입 ================");
	
		return departmentMapper.selectDepartMentOne(departmentCode);
		
	}
	
	
	//학부 추가 
	public int addDepartMent (Department department) {
		
		log.debug(TeamColor.BJH + "학부추가 서비스 진입===============");
		
		return departmentMapper.insertDepartment(department);
	}
	
	
	//학부 수정 폼
	public Department modeifyDepartMentOne (int departmentCode) {
		
		log.debug(TeamColor.BJH + "학부수정 폼 서비스 진입===============");
		
		return departmentMapper.updateDepartment(departmentCode);
	}
	
	//학부 수정 액션
	public int modeifyDepartMentOne (Department department) {
		
		log.debug(TeamColor.BJH + "학부수정 액션 서비스 진입===============");
		
		int row = departmentMapper.updateDepartmentAction(department);
		if(row != 0) {
			log.debug(TeamColor.BJH + "학부 수정 성공");
		}
		log.debug(TeamColor.BJH + "학부 수정 실패");
		
		return row;
	}
		
	//학부 삭제
	
	public int removeDepartMent (int departmentCode) {
		log.debug(TeamColor.BJH + "학부 삭제 서비스 진입===========");
		
		int row = departmentMapper.deleteDepartment(departmentCode);
		if(row != 0) {
			log.debug(TeamColor.BJH + "학부 수정 성공");
		}
		log.debug(TeamColor.BJH + "학부 수정 실패");
		
		return row;
	}
	

}
