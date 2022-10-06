package com.gd.LMS.commons;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebListener
public class HttpSessionListner implements HttpSessionListener {
	private static final Map<String, HttpSession> sessions = new HashMap<String, HttpSession>();
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		sessions.put(session.getId(), session);
		log.debug(TeamColor.LCH + "session.getId > " + session.getId());
		log.debug(TeamColor.LCH + "Created Session > " + session);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		log.debug(TeamColor.LCH + "Destroyed Session > " + se.getSession().getId());
		sessions.remove(se.getSession().getId());
	}
	
}
