package com.gd.LMS.assignment.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.gd.LMS.vo.AssignmentRegImg;

@Mapper
public interface AssignmentRegImgMapper {
	
	//////////////////파일관련 메서드	
	// 과제 제출 첨부파일 업로드
	int insertRegFile(AssignmentRegImg assignmentRegImg);

	// 제출한 과제 첨부파일 삭제
	int deleteRegFile(int assignmentRegNo);

	int updateRegFile(AssignmentRegImg regImgFile);


	

}
