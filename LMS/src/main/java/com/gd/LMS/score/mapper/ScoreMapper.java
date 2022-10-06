package com.gd.LMS.score.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ScoreMapper {
	
	// 수강리스트
	List<Map<String, Object>> selectStudentScoreList(int studentCode);
	//총출석일 
	List<Map<String, Object>> selectAttendanceTotal(int studentCode, int openedLecNo);
	//학생출석일
	List<Map<String, Object>> selectAttendance(int studentCode, int openedLecNo);
	
	//출석점수등록
	int updateAtt(int studentCod, int openedLecNo);
	
}
