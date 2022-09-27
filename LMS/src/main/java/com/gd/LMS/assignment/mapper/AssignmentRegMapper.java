package com.gd.LMS.assignment.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.vo.AssignmentReg;
import com.gd.LMS.vo.AssignmentRegForm;
import com.gd.LMS.vo.AssignmentRegImg;


@Mapper
public interface AssignmentRegMapper {
	
	
	// 제출한 과제 전체 리스트 조회 메소드
	// 파라미터 : X
	// 리턴값 : List<Map<String,Object>>
	List<AssignmentReg> selectAssignmentRegList();
	
	// 학생별 제출한 과제 리스트 조회 메소드
	// 파라미터 : openedLecNo
	// 리턴값 : List<Map<String,Object>>
	Map<String, Object> selectAssignmentRegListById(Map<String, Object> paramMap);

	// 강좌별 제출한 과제 리스트 조회 메소드
	// 파라미터 : educationNo
	// 리턴값 : List<Map<String,Object>>
	List<AssignmentReg> selectAssignmentRegListByOpenedLec(int openedLecNo);

	// 과제 제출하기 메소드 Form
	// 파라미터: X
	// 리턴값 : int
	AssignmentReg addAssignmentRegForm(int assignmentNo);

	// 과제 제출하기 메소드 Action
	// 파라미터 : assignmentNo (과제번호
	// 리턴값 : int
	int insertAssignmentReg(AssignmentReg assignmentReg);

	// 과제 첨부파일 제출하기 메소드 Action
	int insertAssignmentRegFile(AssignmentRegImg assignmentRegImg);

	// 제출한 과제 수정하는 메소드 Form
	// 파라미터 : reportSubmitNo
	// 리턴값 : int
	AssignmentReg AssignmentRegOne(int assignmentRegNo);

	// 제출한 과제 수정하는 메소드 Action
	// 파라미터 : ReportSubmit
	// 리턴값 : int
	int updateAssignmentReg(AssignmentRegForm assignmentRegForm);

	// 제출한 과제 점수 수정하는 메소드 Action
	// 파라미터 : reportSubmitNo
	// 리턴값 : int
	int updateAssignmentRegScore(int assignmentRegNo);

	// 제출한 과제 삭제하는 메소드
	// 파라미터 : reportSubmitNo
	// 리턴값 : int
	int deleteAssignmentReg(int assignmentRegNo);
	
}
