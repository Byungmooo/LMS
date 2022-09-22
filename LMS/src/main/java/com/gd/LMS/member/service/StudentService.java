package com.gd.LMS.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.department.mapper.DepartmentMapper;
import com.gd.LMS.member.mapper.StudentMapper;
import com.gd.LMS.vo.Department;
import com.gd.LMS.vo.Member;
import com.gd.LMS.vo.Student;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class StudentService {
	@Autowired StudentMapper studentMapper;
	@Autowired DepartmentMapper departmentMapper;
	
	//학생 리스트 보기
	public List<Map<String, Object>> getStudentList(){

		 log.debug(TeamColor.BJH + "[지혜] getStudentList 담겼음");
		 
		 List<Map<String, Object>> studentList = studentMapper.selectStudentList();
		 log.debug(TeamColor.BJH + "[지혜] studentList service");
		 
		 return studentList;
	};
	
	
	//학생 상세보기
	public Map<String, Object> getStudentOne(int studentCode) {
		// 파라미터 디버깅
		log.debug(TeamColor.BJH + "상세보기 (service) > " + studentCode);
		
		// 매퍼메서드 호출 후 리턴값 디버깅
		Map<String, Object> StudentOne = studentMapper.selectStudentOne(studentCode);
		log.debug(TeamColor.BJH + "StudentOne (service) > " + StudentOne);
				
		 return StudentOne;
	}
	
	// 학생정보 수정 폼
	public Map<String, Object> getStudent(int studentCode) {
		log.debug(TeamColor.BJH + "수정폼(service) > " + studentCode);
		
		Map<String, Object> updateOne = studentMapper.updateStudentOne(studentCode);
		log.debug(TeamColor.BJH + "updateOne (service) > " + updateOne);
		return updateOne;
	}
	
    // 학생정보 수정액션
    public int modifyStudent(Map<String, Object> map) {
    	
    	int row = studentMapper.updateStudent(map);
    	//log.debug(TeamColor.BJH + "수정액션(service) > " + map);
    
        return row;
    }
    
    
    //학생정보 > 학과 자동설정 폼
    
    public Map<String, Object> addStudentForm() {
		Map<String, Object> resultMap = new HashMap<>();
    
		List<Map<String, Object>> departmentList = departmentMapper.selectDepList();
		resultMap.put("d", departmentList);
		
		return resultMap;
    }
    
    
    
    
    // 학생 삭제	
    public int removeStudent(int studentCode) {

    	log.debug(TeamColor.BJH + "modifyStudent(service) > " + studentCode);
		
        return studentMapper.deleteStudent(studentCode);
    }
	
	
	
}
