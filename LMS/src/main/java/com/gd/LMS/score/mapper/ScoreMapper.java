package com.gd.LMS.score.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ScoreMapper {
	
	// 점수리스트
	List<Map<String, Object>> selectStudentScoreList(int studentCode);
}
