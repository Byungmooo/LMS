package com.gd.LMS.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.member.mapper.MemberMapper;
import com.gd.LMS.member.service.MemberService;
import com.gd.LMS.vo.Member;
import com.gd.LMS.vo.Student;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class MemberService {
	@Autowired MemberMapper memberMapper;
	
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
	public int getStudentCode(String memberId) {
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "memberId (service) > " + memberId);
		
		// 매퍼메서드 호출 후 리턴값 디버깅
		int memberCode = memberMapper.selectStudentCode(memberId);
		
		return memberCode;
	}
	
	// 교수코드
	public int getProfessorCode(String memberId) {
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "memberId (service) > " + memberId);
		
		// 매퍼메서드 호출 후 리턴값 디버깅
		int memberCode = memberMapper.selectProfessorCode(memberId);
		
		return memberCode;
	}
	
	// 직원코드
	public int getEmployeeCode(String memberId) {
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "memberId (service) > " + memberId);
		
		// 매퍼메서드 호출 후 리턴값 디버깅
		int memberCode = memberMapper.selectEmployeeCode(memberId);
		
		return memberCode;
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
		log.debug(TeamColor.BJH + "teacher : " + map.get("teacherList"));
		log.debug(TeamColor.BJH + "manager : " + map.get("managerList"));
		
		return map;
	}
	
	// 회원가입 승인
	public int modifyActiveMemberList(String memberId) {
		
		// 디버깅
		log.debug(TeamColor.BJH + "회원가입 승인 memberId====>" +memberId);
		
		int row = memberMapper.updateActiveMemberList(memberId);
		// 디버깅
		log.debug(TeamColor.BJH + "row=====>" + row);
		
		return row;
	}
	
	// 회원가입 거절
	public int modifyInActiveMemberList(String memberId) {
		
		// 디버깅
		log.debug(TeamColor.BJH + "회원가입 거절 memberId====>" + memberId);
		
		int row = memberMapper.updateInActiveMemberList(memberId);
		// 디버깅
		log.debug(TeamColor.BJH + "row======>" + row);
		
		return row;
	}

}
