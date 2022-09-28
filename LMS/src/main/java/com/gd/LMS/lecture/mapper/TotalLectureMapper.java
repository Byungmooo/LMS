package com.gd.LMS.lecture.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.TotalLecture;

@Mapper
public interface TotalLectureMapper {
	
	// 전체과목수
	int selectTotalLectureCount(Map<String, Object> map);

	// 전체과목리스트
	List<Map<String, Object>> selectTotalLectureList(PagingVo vo);
	
	// 강의 상세보기
	Map<String, Object> selectTotalLectureOne(int lectureCode);
	
	// 전체 학부 리스트
	List<Map<String, Object>> selectTotalDepartmentName();
	
	int updateTotalLectureOne(TotalLecture totalLecture);
	
	// 강의 추가
	int insertTotalLectureOne(TotalLecture totalLecture);
	
	int deleteTotalLectureOne(int lectureCode);
	
	List<String> selectCheckFkOpenedLecture(int lectureCode);
}
