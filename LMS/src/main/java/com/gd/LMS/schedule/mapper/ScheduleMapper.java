package com.gd.LMS.schedule.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ScheduleMapper {
	List<Map<String, Object>> selectLectureSchedule(int memberCode);
	
	List<Map<String, Object>> selectOpenLectureSchedule(int memberCode);
	
	List<Map<String, Object>> selectLectureTime(int openedLecNo);
}
