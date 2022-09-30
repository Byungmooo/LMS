package com.gd.LMS.lecture.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.LMS.lecture.mapper.LectureRegMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class LectureRegService {
	@Autowired LectureRegMapper lectureRegMapper;
	
	public String getDepartmentCodeByMemberCode(int memberCode) {
		return lectureRegMapper.selectDepartmentCodeByMemberCode(memberCode);
	}
	
	public int getTotalDepLectureCount(Map<String, Object> map) {
		
		return lectureRegMapper.selectTotalDepLectureCount(map);
	}
	
	public List<Map<String, Object>> getTotalDepLectureList(Map<String, Object> map2) {
		List<Map<String, Object>> list = lectureRegMapper.selectTotalDepLectureList(map2);
		return list;
	}
	
	public Map<String, Object> getTotalDepLectureOne(int lectureCode) {
		Map<String, Object> map = lectureRegMapper.selectTotalDepLectureOne(lectureCode);
		return map;
	}
}
