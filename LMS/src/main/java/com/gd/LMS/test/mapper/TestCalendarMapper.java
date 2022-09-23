package com.gd.LMS.test.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.utils.AttendanceVo;

@Mapper
public interface TestCalendarMapper {
	// 학생의 한 강좌 출석 리스트 불러오기
	List<AttendanceVo> selectAttendanceList(Map<String, Object> map);
	// 학생의 한 강좌 출석률
	double selectAttendancePercent(Map<String, Object> map);
}
