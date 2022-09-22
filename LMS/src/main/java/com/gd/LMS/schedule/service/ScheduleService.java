package com.gd.LMS.schedule.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.LMS.schedule.mapper.ScheduleMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class ScheduleService {
	@Autowired ScheduleMapper scheduleMapper;
	
	public List<Map<String, Object>> getLectureSchedule() {
		
		List<Map<String, Object>> list = scheduleMapper.selectLectureSchedule();
		
		return list;
	}
}
