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

import ch.qos.logback.core.rolling.helper.IntegerTokenConverter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class MemberService {
	@Autowired
	MemberMapper memberMapper;
	@Autowired
	ProfessorMapper professorMapper;
	@Autowired
	StudentMapper studentMapper;
	@Autowired
	EmployeeMapper employeeMapper;

	// 회원로그인
	public Member getMemberLogin(Member paramMember) {
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "paramMember (service) > " + paramMember);

		// 매퍼메서드 호출 후 리턴값 디버깅
		Member resultMember = memberMapper.selectMemberLogin(paramMember);
		log.debug(TeamColor.LCH + "resultMember (service) > " + resultMember);

		// 활성화가 Y인 회원 최근 접속일 갱신
		if (resultMember != null) {
			if (resultMember.getActive().equals("Y")) {
				memberMapper.updateMemberLastLogin(resultMember.getMemberId());
			}
		}

		return resultMember;
	}
	
	// 회원 정보 학부 or 권한
	public String getDepartmentCodeOrLevel(int memberCode, String memberType) {
		if(memberType.equals("학생")) {
			String departmentName = memberMapper.selectDepNameByStudent(memberCode);
			return departmentName;
		} else if(memberType.equals("교수")) {
			String departmentName = memberMapper.selectDepNameByProfessor(memberCode);
			return departmentName;
		} else {
			String employeeLevel = memberMapper.selectEmpLevelByEmployee(memberCode);
			return employeeLevel;
		}
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
	
	// 전체부서리스트
	public List<Map<String, Object>> getTempDepList() {
		List<Map<String, Object>> list = memberMapper.selectTempDepList();
		return list;
	}
	
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
	public List<Map<String, Object>> activeMemberList(String searchType) {

		// 승인대기리스트
		List<Map<String, Object>> list = memberMapper.selectQueueLsit(searchType);
		log.debug(TeamColor.BJH + "list   서비스 담기=======>" + list);

		return list;
	}

	// 회원가입 승인
	public int modifyActiveMemberList(Member member) {
		Map<String, Object> map = new HashMap<>();
		String memberType = member.getMemberType();
		String memberId = member.getMemberId();
		String tempDep = member.getTempDep();
		
		// 디버깅
		log.debug(TeamColor.BJH + "회원가입 승인 memberId====>" + map);

		map.put("memberId", memberId);
		map.put("memberType", memberType);
		map.put("departmentCode", tempDep);
		log.debug(TeamColor.BJH + "map > " + map);
		
		int row = memberMapper.updateActiveMember(memberId);
		log.debug(TeamColor.BJH + "Y로 바꾼 row데이터???~?~?~?~???" + row);
		
		if (row != 0) {
			if (memberType.equals("교수")) {

				// 1.member테이블에서 create_date 셀렉트해와서 년도만 빼서 String값으로 갖고있어
				String createDate = professorMapper.selectDateProfessorCode(memberId);
				createDate = createDate.substring(0, 4);
				// 2. 교수 , 학생, 직원이 ex)교수(10번) 으로 분기처리를할수있는 코드와 타입을 String으로 갖고있어
				createDate = createDate + "10";// 교수는 10
				// 3. 001 +1 되게 쿼리를 짜도록..
				int professorMaxCode = professorMapper.selectMaxProfessorCode(createDate);
				log.debug(TeamColor.LCH + "professorMaxCode > " + professorMaxCode);
				
				if(professorMaxCode < 10) {
					createDate = createDate + "00" +professorMaxCode;
				} else if(professorMaxCode < 100) {
					createDate = createDate + "0" +professorMaxCode;
				} else {
					createDate = createDate + "" +professorMaxCode;
				}
				
				map.put("memberCode", createDate);
				row = professorMapper.insertProfessor(map);
			} else if (memberType.equals("학생")) {

				String createDate = studentMapper.selectDateStudentCode(memberId);
				createDate = createDate.substring(0, 4);
				createDate = createDate + "20"; // 학생은 20
				int studentMaxCode = studentMapper.selectMaxStudentCode(createDate);
				log.debug(TeamColor.LCH + "studentMaxCode > " + studentMaxCode);
				
				if(studentMaxCode < 10) {
					createDate = createDate + "00" +studentMaxCode;
				} else if(studentMaxCode < 100) {
					createDate = createDate + "0" +studentMaxCode;
				} else {
					createDate = createDate + "" +studentMaxCode;
				}
				map.put("memberCode", createDate);
				row = studentMapper.insertStudent(map);

			} else if (memberType.equals("직원")) {

				String createDate = employeeMapper.selectDateEmployeeCode(memberId);
				createDate = createDate.substring(0, 4);
				createDate = createDate + "00"; // 직원은 00
				int employeeMaxCode = employeeMapper.selectMaxEmployeeCode(createDate);
				log.debug(TeamColor.LCH + "employeeMaxCode > " + employeeMaxCode);
				
				if(employeeMaxCode < 10) {
					createDate = createDate + "00" +employeeMaxCode;
				} else if(employeeMaxCode < 100) {
					createDate = createDate + "0" +employeeMaxCode;
				} else {
					createDate = createDate + "" +employeeMaxCode;
				}
				map.put("memberCode", createDate);
				row = employeeMapper.insertEmployee(map);
			}
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
