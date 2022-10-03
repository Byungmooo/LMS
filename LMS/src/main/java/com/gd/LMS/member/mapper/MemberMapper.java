package com.gd.LMS.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.vo.Employee;
import com.gd.LMS.vo.Member;
import com.gd.LMS.vo.Professor;
import com.gd.LMS.vo.Student;

@Mapper
public interface MemberMapper {
	
	// 회원로그인
	Member selectMemberLogin(Member paramMember);
	
	// 회원가입
	int insertMemberRegister(Member paramMember);
	
	// 회원가입 Id 중복체크
	String selectMemberIdCheck(String checkId);
	
	// 회원 최근 접속일 갱신
	int updateMemberLastLogin(String memberId);
	
	// 회원상태 비활성화
	int updateMemberActiveN();
	
	// 회원상태 활성화
	int updateMemberActiveY(Member paramMember);
	
	// 학생코드
	int selectStudentCode(String memberId);
	
	// 교수코드
	int selectProfessorCode(String memberId);
	
	// 직원코드
	int selectEmployeeCode(String memberId);
	
	// 회원가입 교수 승인대기 리스트
	List<Member> selectQueueProfessorLsit();

	// 회원가입 학생 승인대기 리스트
	List<Member> selectQueueStudentLsit();
	
	// 회원가입 직원 승인대기 리스트
	List<Member> selectQueueEmployeeLsit();
	

	
	// 회원가입 승인 (직원만 가능)
	int updateActiveMemberList(String memberId);
	
	// 회원가입 거절 (직원만 가능)
	int updateInActiveMemberList(String memberId);
	
}
