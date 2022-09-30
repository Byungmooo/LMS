package com.gd.LMS.lecture.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LectureRegMapper {
	
	String selectDepartmentCodeByMemberCode(int memberCode);
	
	int selectTotalDepLectureCount(Map<String, Object> map);
	
	List<Map<String, Object>> selectTotalDepLectureList(Map<String, Object> map2);
	
	Map<String, Object> selectTotalDepLectureOne(int lectureCode);
}
