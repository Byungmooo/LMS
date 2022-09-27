package com.gd.LMS.lecture.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.LMS.lecture.mapper.TotalLectureMapper;
import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.TotalLecture;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class TotalLectureService {
	@Autowired TotalLectureMapper totalLectureMapper;
	
	// 전체과목수
	public int getTotalLectureCount(String keyword) {
		return totalLectureMapper.selectTotalLectureCount(keyword);
	}
	
	// 전체과목리스트
	public List<Map<String, Object>> getTotalLectureList(PagingVo vo) {
		List<Map<String, Object>> list = totalLectureMapper.selectTotalLectureList(vo);
		return list;
	}
	// 강의 상세보기
	public Map<String, Object> getTotalLectureOne(int lectureCode) {
		Map<String, Object> map = totalLectureMapper.selectTotalLectureOne(lectureCode);
		return map;
	}
	
	// 전체학부
	public List<Map<String, Object>> getTotalDepartmentName() {
		List<Map<String, Object>> map = totalLectureMapper.selectTotalDepartmentName();
		return map;
	}
	
	public int addTotalLectureOne(TotalLecture totalLecture) {
		totalLectureMapper.insertTotalLectureOne(totalLecture);
		
		// 상세보기로 바로 이동하기 위해 selectKey값으로 PK를 받아서 리턴시킴
		int key = totalLecture.getLectureCode();
		return key;
	}
	
	public int removeTotalLectureOne(int lectureCode) {
		return totalLectureMapper.deleteTotalLectureOne(lectureCode);
	}
}
