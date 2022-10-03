package com.gd.LMS.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	//학생 리스트 보기
	public List<Map<String,Object>> getStudentList(Map<String, Object> map){
		log.debug(TeamColor.BJH + "전체 학생 목록 서비스 진입==============");
		 
		 return studentMapper.selectStudentList(map);
	};
	
	// 총 학생 수
	public int countStudent(Map<String, Object> map) {
		log.debug(TeamColor.BJH + "전체 학생 수 카운트 서비스 진입==============");
		
		return studentMapper.countStudent(map);
	}
		

	//학생 상세보기
	public Map<String, Object> getStudentOne(int studentCode) {
		// 파라미터 디버깅
		log.debug(TeamColor.BJH + "학생 상세보기 서비스 진입 ================ " + studentCode);
		
		// 매퍼메서드 호출 후 리턴값 디버깅
		Map<String, Object> studentOne= studentMapper.selectStudentOne(studentCode);
		log.debug(TeamColor.BJH + "상세보기 studentOne 담기 >>>>>> " + studentOne);
				
		 return studentOne;
	}
	
	// 학생정보 수정 폼
	public Map<String, Object> getStudent(int studentCode) {
		log.debug(TeamColor.BJH + "student 수정폼 서비스 진입===========" + studentCode);
		
		Map<String, Object> updateOne = studentMapper.selectStudentOne(studentCode);
		log.debug(TeamColor.BJH + "updateOne (service) > " + updateOne);
		return updateOne;
	}
	
    // 학생정보 수정액션
    public int modifyStudent(Map<String, Object> map) {
    	
    	
    	int row = studentMapper.updateStudent(map);
    	if(row != 0) {
			log.debug(TeamColor.BJH + "학생정보 수정 성공" + map);
		}
		log.debug(TeamColor.BJH + "학생정보 수정 실패");
        return row;
    }
    
    
   
    // 학생 삭제	
    public String removeStudentMember(String memberId) {
    	
    	studentMapper.deleteStudentMember(memberId);
        log.debug(TeamColor.BJH + "학생, 멤버테이블(삭제) > " + memberId);
    	
        return memberId;
        
    }
    
    
    ////////////////////////승인관련
    
    // 학생 승인 대기 목록
 	public List<Member> getStudentQueueList(Map<String, Object> map){
 		return studentMapper.selectStudentQueueList(map);
 	}
 	
 	// 학생 승인 대기 페이징
 	public int getCountStudentQueue() {
 		return studentMapper.selectStudentQueueCount();
 	}
 	
	// 학생 승인 거절
	public void negativeStudent(String memberId) {
		// 계정 테이블 삭제
		studentMapper.deleteStudentQueue(memberId);
	}
	
	// 학생 승인
	public void accessStudent(String memberId) {
		Member member = new Member();
		member.setActive("Y");
		member.setMemberId(memberId);
		// 계정 정보 찾기
		member = studentMapper.selectStudentQueueOne(memberId);
		// 계정 상태 업데이트
		studentMapper.updateStudentState(member);
		
	}
		
	
    
}
	
	