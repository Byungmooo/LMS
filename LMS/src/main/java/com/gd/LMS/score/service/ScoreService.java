package com.gd.LMS.score.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.lecture.service.LectureService;
import com.gd.LMS.score.mapper.ScoreMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class ScoreService {
	@Autowired ScoreMapper scoreMapper;
	
	public List<Map<String, Object>> getStudentScoreList(int studentCode) {
		// 파라미터 디버깅
		log.debug(TeamColor.KBW + "studentCode (service) > " + studentCode);

		// 매퍼메서드 호출 후 리턴값 디버깅
		List<Map<String, Object>> studentScoreList = scoreMapper.selectStudentScoreList(studentCode);
		log.debug(TeamColor.KBW + "studentScoreList (service) > " + studentScoreList);

		return studentScoreList;
	}
	
}
