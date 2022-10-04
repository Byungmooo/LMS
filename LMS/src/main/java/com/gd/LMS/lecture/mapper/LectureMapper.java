package com.gd.LMS.lecture.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.Attendance;
import com.gd.LMS.vo.LectureAnswer;
import com.gd.LMS.vo.LectureQuestion;

@Mapper
public interface LectureMapper {

	// 수강리스트
	List<Map<String, Object>> selectStudentLectureList(int studentCode);
	
	// 진행강의리스트
	List<Map<String, Object>> selectProfessorLectureList(int professorCode);
	
	// 강의 상세보기
	Map<String, Object> selectOpenedLectureOne(int openedLecNo);

	

}
