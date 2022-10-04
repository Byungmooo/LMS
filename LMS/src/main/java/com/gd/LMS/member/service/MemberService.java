package com.gd.LMS.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.member.mapper.EmployeeMapper;
import com.gd.LMS.member.mapper.MemberMapper;
import com.gd.LMS.member.mapper.ProfessorMapper;
import com.gd.LMS.member.mapper.StudentMapper;
import com.gd.LMS.member.service.MemberService;
import com.gd.LMS.vo.Employee;
import com.gd.LMS.vo.Member;
import com.gd.LMS.vo.Professor;
import com.gd.LMS.vo.Student;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class MemberService {
	@Autowired MemberMapper memberMapper;
	@Autowired ProfessorMapper professorMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired EmployeeMapper employeeMapper;
	
	
	// 회원로그인
	public Member getMemberLogin(Member paramMember) {	
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "paramMember (service) > " + paramMember);
		
		// 매퍼메서드 호출 후 리턴값 디버깅
		Member resultMember = memberMapper.selectMemberLogin(paramMember);
		log.debug(TeamColor.LCH + "resultMember (service) > " + resultMember);
		
		// 활성화가 Y인 회원 최근 접속일 갱신
		if(resultMember != null) {
			if(resultMember.getActive().equals("Y")) {
				memberMapper.updateMemberLastLogin(resultMember.getMemberId());
			}
		}
		
		return resultMember;
	}
	
	
	// 회원가입
	public int addMemberRegister(Member paramMember) {
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "paramMember (service) > " + paramMember);
		
		// 매퍼메서드 호출 후 리턴값 디버깅
		int result = memberMapper.insertMemberRegister(paramMember);
		log.debug(TeamColor.LCH + "result (service) > " + result);
		
		return result;
	}
	
	// 회원가입 Id중복체크
	public String getMemberIdCheck(String checkId) {
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "checkId (service) > " + checkId);
		
		// 결과값 String에 담아 리턴 null일 경우 사용 가능
		String result = null;		
		result = memberMapper.selectMemberIdCheck(checkId);
		
		// 리턴값 디버깅
		log.debug(TeamColor.LCH + "result (service) > " + result);
		
		return result;
	};
	
	// 회원상태 비활성화 (장기미접속)
	public int modifyMemberActiveN() {
		// 매퍼쿼리 실행 후 리턴값 확인
		int row = memberMapper.updateMemberActiveN();
		log.debug(TeamColor.LCH + "row (service) > " + row);
				
		return row;
	}
	
	// 회원상태 활성화 (휴면계정 잠금 해제)
	public int modifyMemberActiveY(Member paramMember) {
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "member (service) > " + paramMember);
		
		// 메서드 호출 후 리턴값 디버깅
		int result = memberMapper.updateMemberActiveY(paramMember);
		log.debug(TeamColor.LCH + "result (service) > " + result);
		
		return result;
	}
	// 학생코드
	   public Student getStudentCodeById(String memberId) {
	      // 파라미터 디버깅
	      log.debug(TeamColor.LCH + "memberId (service) > " + memberId);
	      
	      // 매퍼메서드 호출 후 리턴값 디버깅
	      Student student = memberMapper.selectStudentCodeById(memberId);
	      
	      return student;
	   }
	   
	   // 교수코드
	   public Professor getProfessorCodeById(String memberId) {
	      // 파라미터 디버깅
	      log.debug(TeamColor.LCH + "memberId (service) > " + memberId);
	      
	      // 매퍼메서드 호출 후 리턴값 디버깅
	      Professor professor = memberMapper.selectProfessorCodeById(memberId);
	      
	      return professor;
	   }
	   
	   // 직원코드
	   public Employee getEmployeeCodeById(String memberId) {
	      // 파라미터 디버깅
	      log.debug(TeamColor.LCH + "memberId (service) > " + memberId);
	      
	      // 매퍼메서드 호출 후 리턴값 디버깅
	      Employee employee = memberMapper.selectEmployeeCodeById(memberId);
	      
	      return employee;
	   }
	
	// 회원가입 승인대기리스트
	public Map<String,Object> activeMemberList(){
		
		// 학생 대기리스트
		List<Member> studentList = memberMapper.selectQueueStudentLsit();
		// 교수 대기리스트
		List<Member> professorList = memberMapper.selectQueueProfessorLsit();
		// 직원 대기리스트
		List<Member> employeeList = memberMapper.selectQueueEmployeeLsit();
		
		// 디버깅
		log.debug(TeamColor.BJH + "studentList   서비스 담기=======>" + studentList);
		log.debug(TeamColor.BJH + "professorList 서비스 담기=======>" + professorList);
		log.debug(TeamColor.BJH + "employeeList  서비스 담기=======>" + employeeList);
		
		//맵에 넣어주기
		Map<String,Object> map = new HashMap<>();
		map.put("studentList", studentList);
		map.put("professorList", professorList);
		map.put("employeeList", employeeList);
		
		// 디버깅
		log.debug(TeamColor.BJH + "student : " + map.get("studentList"));
		log.debug(TeamColor.BJH + "professor : " + map.get("professorList"));
		log.debug(TeamColor.BJH + "employee : " + map.get("employeeList"));
		
		return map;
	}
	
	// 회원가입 승인
	public int modifyActiveMemberList(Member member) {
		
		Map<String, Object> map = new HashMap<>();
		
		// 디버깅
		log.debug(TeamColor.BJH + "회원가입 승인 memberId====>" +map);
		
		map.put("memberId",member.getMemberId());
		map.put("memberType",member.getMemberType()); 
		
		int row = memberMapper.updateActiveMember(map);
		if(row != 0) {
			if(member.getMemberType().equals("교수")) {
				row = professorMapper.insertProfessor(map);
				log.debug(TeamColor.BJH + "교수 인서트로 map 담아서 이동>>>>>>" + map);
				
			} else if(member.getMemberType().equals("학생")) {
				row =  studentMapper.insertStudent(map);
				log.debug(TeamColor.BJH + "학생 인서트로 map 담아서 이동>>>>>>" + map);
				
			} else if(member.getMemberType().equals("직원")) {
				row =  employeeMapper.insertEmployee(map);

				log.debug(TeamColor.BJH + "직원 인서트로 map 담아서 이동>>>>>>" + map);
			} return row;
		}
		
		return row;
	}
	
	// 회원가입 거절
	public int modifyInActiveMemberList(String memberId) {
		
		// 디버깅
		log.debug(TeamColor.BJH + "회원가입 거절 memberId====>" + memberId);
		
		int row = memberMapper.updateInActiveMember(memberId);
		// 디버깅
		log.debug(TeamColor.BJH + "row======>" + row);
		
		return row;
	}

}
