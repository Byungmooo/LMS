package com.gd.LMS.commons;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;

import lombok.extern.slf4j.Slf4j;

@Slf4j // Simple Logging Facade for Java, 로깅에 대한 인터페이스 모음
@WebFilter("/*")
public class EncodingFilter extends HttpFilter implements Filter {
   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
      
      request.setCharacterEncoding("utf-8");
      // 디버깅
      log.debug(TeamColor.debuging + "===EncodingFilter utf-8 인코딩 실행===" +TeamColor.RESET);
      // pass the request along the filter chain
      chain.doFilter(request, response);
   }

}