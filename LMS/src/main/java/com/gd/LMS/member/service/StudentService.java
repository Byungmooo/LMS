package com.gd.LMS.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.member.mapper.StudentMapper;
import com.gd.LMS.vo.Student;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
public class StudentService {
	@Autowired StudentMapper studentMapper;
	
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
		log.debug(TeamColor.BJH + "studentCode (service) > " + studentCode);
		
		// 매퍼메서드 호출 후 리턴값 디버깅
		Map<String, Object> StudentOne = studentMapper.selectStudentOne(studentCode);
		log.debug(TeamColor.BJH + "getStudentOne (service) > " + StudentOne);
				
		 return StudentOne;
	}
		
	// 학생정보 수정 폼
	public Student getStudent(int studentCode) {
		log.debug(TeamColor.BJH + "getStudent(service) > " + studentCode);
		
		return studentMapper.updateStudentOne(studentCode);
	}
    
    // 학생정보 수정액션
    public int modifyStudent(Student student) {
    	
    	log.debug(TeamColor.BJH + "modifyStudent(service) > " + student);
		
        return studentMapper.updateStudent(student);
    }
    
    
    // 학생 삭제	
    public int removeStudent(int studentCode) {

    	log.debug(TeamColor.BJH + "modifyStudent(service) > " + studentCode);
		
        return studentMapper.deleteStudent(studentCode);
    }
	
	
	
}
