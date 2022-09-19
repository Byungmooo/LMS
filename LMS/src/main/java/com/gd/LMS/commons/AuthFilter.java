package com.gd.LMS.commons;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebFilter("/LMS/*")
public class AuthFilter implements Filter {
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpSession session = null;
		if(request instanceof HttpServletRequest) {
		session = ((HttpServletRequest) request).getSession();
			/*	
			if ((session.getAttribute("인증속성").getLevel == null) { // 인정범위에 따라 level<3 ... 
					return
			}else {
				log.debug("웹 요청이 아닙니다.");
				// redirect...
				return;
			}
			*/
		}
		
		chain.doFilter(request, response);
		
	}
	
	
}
