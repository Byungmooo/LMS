package com.gd.LMS.schedule.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gd.LMS.vo.CalendarDayList;


@Mapper
public interface CalendarMapper {
	//CalendarDayList 일정표리스트(달력)
	List<CalendarDayList> selectCalendarDayListByMonth(int year, int month);
	
	// 학부일정
	List<Map<String, Object>> selectDepartmentSchedule();
	
}
