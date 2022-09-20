package com.gd.LMS.commons;

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

import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebFilter("/professor/*")
public class ProfessorFilter implements Filter {
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		log.debug(TeamColor.LCH + "--- ProfessorFilter ---");
		
		HttpSession session = null;
		if(request instanceof HttpServletRequest) {
			session = ((HttpServletRequest) request).getSession();
			if (session.getAttribute("memberId") == null || session.getAttribute("memberType") != "교수") {
				((HttpServletResponse)response).sendRedirect(((HttpServletRequest)request).getContextPath()+"/login");
				return;
			} 
		} else {
			log.debug("웹 요청이 아닙니다.");
			// redirect... 404 Page??
		}
		
		chain.doFilter(request, response);
		
	}
}