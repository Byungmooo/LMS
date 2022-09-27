package com.gd.LMS.assignment.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.vo.AssignmentReg;
import com.gd.LMS.vo.AssignmentRegImg;
import com.gd.LMS.vo.OpenedLecture;


@Mapper
public interface AssignmentRegImgMapper {  

	
	// 과제 제출하기 첨부파일 업로드 메소드
		// 파라미터 : AssignmentRegImg
		// 리턴값 : int
		int insertAssignmentRegImg(AssignmentRegImg assignmentRegImg);

		// 제출한 과제 상세 조회하기 메소드
		// modifyAssignmentReg Form
		// 파라미터 : AssignmentRegNo
		// 리턴값 : AssignmentReg
		AssignmentRegImg selectReportSubmitFile(int assignmentRegNo);

		// 과제 수정하기 첨부파일 업로드 메소드
		// modifyAssignmentReg Action
		// 파라미터 : AssignmentRegNo
		// 리턴값 : int
		int updateAssignmentRegImg(AssignmentRegImg assignmentRegImg);
		
		// 제출한 과제 첨부파일 삭제하기 메소드
		// 파라미터 : assignmentRegNo
		// 리턴값 : X
		int deleteAssignmentRegImg(int assignmentRegNo);

	
	
	
}
