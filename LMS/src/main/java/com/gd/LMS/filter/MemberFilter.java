package com.gd.LMS.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.member.service.MemberService;
import com.gd.LMS.vo.Employee;
import com.gd.LMS.vo.Professor;
import com.gd.LMS.vo.Student;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebFilter("/member/*")
public class MemberFilter implements Filter {
	@Autowired MemberService memberService;
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		log.debug(TeamColor.LCH + "--- MemberFilter ---");
		
		HttpSession session = null;
		if (request instanceof HttpServletRequest) {
			session = ((HttpServletRequest)request).getSession();
			if (session.getAttribute("memberId") == null) {
				((HttpServletResponse)response).sendRedirect(((HttpServletRequest)request).getContextPath()+"/memberLogin");
				return;
			} else {
				// student / professor / employee Code메서드 호출 후 세션에 저장
				if (session.getAttribute("memberCode") == null) {
					String memberId = (String)session.getAttribute("memberId"); 
					String memberType = (String)session.getAttribute("memberType");
					if (memberType.equals("학생")) {
						Student student = memberService.getStudentCodeById(memberId);
						log.debug(TeamColor.LCH + "studentInfo > " + student);
	
						session.setAttribute("memberCode", student.getStudentCode());
						session.setAttribute("departmentCode", student.getDepartmentCode());
					} else if (memberType.equals("교수")) {
						Professor professor = memberService.getProfessorCodeById(memberId);
						log.debug(TeamColor.LCH + "professorInfo > " + professor);
						
						session.setAttribute("memberCode", professor.getProfessorCode());
						session.setAttribute("departmentCode", professor.getDepartmentCode());
					} else if (memberType.equals("직원")) {
						Employee employee = memberService.getEmployeeCodeById(memberId);
						log.debug(TeamColor.LCH + "employeeInfo > " + employee);
						
						session.setAttribute("memberCode", employee.getEmployeeCode());
					}
				}
				log.debug(TeamColor.LCH + "통과");
			}
		} else {
			log.debug("웹 요청이 아닙니다.");
			// redirect... 404 Page??
		}
		
		chain.doFilter(request, response);
		
	}
}