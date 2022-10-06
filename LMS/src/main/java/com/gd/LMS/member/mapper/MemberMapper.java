package com.gd.LMS.member.mapper;

import java.util.List;
import java.util.Map;

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
	
	// 전체부서리스트
	List<Map<String, Object>> selectTempDepList();
	
	// 회원 최근 접속일 갱신
	int updateMemberLastLogin(String memberId);
	
	// 회원상태 비활성화
	int updateMemberActiveN();
	
	// 회원상태 활성화
	int updateMemberActiveY(Member paramMember);
	
	// 인덱스에 필요한 정보 -------------------------
	String selectDepNameByStudent(int memberCode);
	
	String selectDepNameByProfessor(int memberCode);
	
	String selectEmpLevelByEmployee(int memberCode);
	
	// ----------------------------------------
	
	// 학생코드
	Student selectStudentCodeById(String memberId);
   
	// 교수코드
	Professor selectProfessorCodeById(String memberId);
   
	// 직원코드
	Employee selectEmployeeCodeById(String memberId);
	
	// 회원가입 교수 승인대기 리스트
	List<Map<String, Object>> selectQueueLsit(String searchType);
	
	// 회원가입 승인 (직원만 가능)
	int updateActiveMember(String memberId);
	
	// 회원가입 거절 (직원만 가능)
	int updateInActiveMember(String memberId);
	
}
