package com.gd.LMS.test.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.LMS.test.mapper.TestCalendarMapper;
import com.gd.LMS.utils.AttendanceVo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class TestCalendarService {
	@Autowired TestCalendarMapper testCalendarMapper;
	// 학생의 한 강좌 출석 리스트 불러오기
	public List<AttendanceVo> selectAttendanceList(Map<String, Object> map){
		return testCalendarMapper.selectAttendanceList(map);
	}
	
	// 학생의 한 강좌 출석률
	public double selectAttendancePercent(Map<String, Object> map) {
		return testCalendarMapper.selectAttendancePercent(map);
	}
}
