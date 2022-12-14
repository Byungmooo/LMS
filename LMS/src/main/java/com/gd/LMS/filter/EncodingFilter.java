package com.gd.LMS.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebFilter("/*")
public class EncodingFilter extends HttpFilter implements Filter {
   public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
      
      request.setCharacterEncoding("utf-8");
      // 디버깅
      // 너무 연속적으로 많이 나오는데 ;;;
      // log.debug(TeamColor.LCH + "---EncodingFilter utf-8---");
      
      chain.doFilter(request, response);
   }
}