package com.gd.LMS.student.Service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.LMS.student.Mapper.StudentMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class StudentService {
	@Autowired StudentMapper studentMapper;
	
	public List<Map<String, Object>> getStudentLectureList(String studentCode) {
		
		List<Map<String, Object>> studentLectureList = studentMapper.selectStudentLectureList(studentCode);
		
		return studentLectureList;
	}

}
