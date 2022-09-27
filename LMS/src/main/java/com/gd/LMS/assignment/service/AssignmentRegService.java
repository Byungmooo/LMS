package com.gd.LMS.assignment.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gd.LMS.assignment.mapper.AssignmentRegImgMapper;
import com.gd.LMS.assignment.mapper.AssignmentRegMapper;
import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.vo.AssignmentReg;
import com.gd.LMS.vo.AssignmentRegForm;
import com.gd.LMS.vo.AssignmentRegImg;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
@Transactional
public class AssignmentRegService {
	
	@Autowired AssignmentRegMapper assignmentRegMapper;
	@Autowired AssignmentRegImgMapper assignmentRegImgMapper; 
	

	// 학생별 제출한 과제 리스트 조회 메소드
	// 파라미터 : memberId
	// 리턴값 : List<Map<String,Object>>
	public Map<String, Object> getAssignmentRegById(String memberId) {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "getAssignmentRegById Service");
		// 파라미터 디버깅
		log.debug(TeamColor.BJH + memberId + "<-- memberId");

		// 리턴값 받아올 객체 생성
		Map<String, Object> returnMap = new HashMap<>();

		// ReportMapper에 넣어줄 매개변수 설정
		Map<String, Object> paramMap = new HashMap<>();
		// paramMap에 값 넣어주기
		paramMap.put("memberId", memberId);

		// Mapper call
		 Map<String, Object> AssignmentRegById = assignmentRegMapper.selectAssignmentRegListById(paramMap);
		// 파마리터 디버깅
		log.debug(TeamColor.BJH + paramMap + "<-- paramMap");
		// Mapper에서 받아온 AssignmentRegById 값 디버깅
		log.debug(TeamColor.BJH + AssignmentRegById + "<-- AssignmentRegById");

		// list에 값 넣어주기
		returnMap.put("AssignmentRegById", AssignmentRegById);

		return AssignmentRegById;
	} 
	
	
	
	// 강좌별 제출한 과제 리스트 조회 메소드
	// 파라미터 : openedLecNo
	// 리턴값 : List<Map<String,Object>>
	public List<AssignmentReg> getAssignmentRegListByOpenedLec(int openedLecNo) {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "getAssignmentRegListByOpenedLec Service");
		// 파라미터 디버깅
		log.debug(TeamColor.BJH + openedLecNo + "<-- openedLecNo");

		// 리턴값 받아올 객체 생성
		Map<String, Object> returnMap = new HashMap<>();

		// ReportMapper에 넣어줄 매개변수 설정
		Map<String, Object> paramMap = new HashMap<>();
		// paramMap에 값 넣어주기
		paramMap.put("openedLecNo", openedLecNo);
		// lectureName 디버깅
		log.debug(TeamColor.BJH + paramMap + "<-- paramMap");

		// Mapper call
		List<AssignmentReg> AssignmentRegListByOpenedLec = assignmentRegMapper.selectAssignmentRegListByOpenedLec(openedLecNo);
		// Mapper에서 받아온 ReportSubmitListById 값 디버깅
		log.debug(TeamColor.BJH + AssignmentRegListByOpenedLec + "<-- AssignmentRegListByOpenedLec");

		// list에 값 넣어주기
		returnMap.put("AssignmentRegListByOpenedLec", AssignmentRegListByOpenedLec);

		return AssignmentRegListByOpenedLec;
	}

	// 과제 제출하는 메소드
	// addAssignmentRegForm
	// 파라미터 : AssignmentRegNo
	// 리턴값 : AssignmentReg
	public AssignmentReg addAssignmentRegForm(int assignmentRegNo) {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "addAssignmentRegForm Service");
		// 파라미터 디버깅
		log.debug(TeamColor.BJH + assignmentRegNo + "<-- assignmentRegNo");
		// Mapper call
		AssignmentReg assignmentReg = assignmentRegMapper.addAssignmentRegForm(assignmentRegNo);
		// Mapper에서 받아온 ReportSubmitOne 값 디버깅
		log.debug(TeamColor.BJH + assignmentReg + "<-- assignmentReg");

		return assignmentReg;
	} // end addReportSubmitForm

	// 과제 제출하는 메소드
	// addReportSubmit Action
	// 파라미터 : AssignmentReg, AssignmentRegImg
	// 리턴값 : AssignmentReg
	public void addAssignmentReg(AssignmentRegForm assginmentRegForm, AssignmentReg assignmentReg) {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "addAssignmentReg Service");
		// 파라미터 디버깅
		log.debug(TeamColor.BJH + assginmentRegForm + "<-- assginmentRegForm");

		String assignmentRegTitle = assginmentRegForm.getAssignmentRegTitle();
		String assignmentRegContent = assginmentRegForm.getAssignmentRegContent();
		int assignmentNo = assginmentRegForm.getAssignmentNo();
		int assignmentRegNo = assginmentRegForm.getAssignmentRegNo();
		int openedLecNo= assginmentRegForm.getOpendLecNo();
		String memberId = assginmentRegForm.getMemberId();
		MultipartFile file = assginmentRegForm.getAssignmentRegFile();
		// 요청값 디버깅
		log.debug(TeamColor.BJH + assignmentRegTitle + "<-- assignmentRegTitle");
		log.debug(TeamColor.BJH + assignmentRegContent + "<-- assignmentRegContent");
		log.debug(TeamColor.BJH + assignmentNo + "<-- assignmentNo");
		log.debug(TeamColor.BJH + openedLecNo + "<-- openedLecNo");
		log.debug(TeamColor.BJH + memberId + "<-- memberId");
		

		// AssignmentReg 입력
		AssignmentRegForm assignmentRegForm = new AssignmentRegForm();
		assignmentRegForm.setMemberId(memberId);
		assignmentRegForm.setOpendLecNo(openedLecNo);
		assignmentRegForm.setAssignmentNo(assignmentNo);
		assignmentRegForm.setAssignmentRegContent(assignmentRegContent);
		assignmentRegForm.setAssignmentRegTitle(assignmentRegTitle);
		assignmentRegForm.setAssignmentRegFile(file);
		// reportSubmit 디버깅
		log.debug(TeamColor.BJH + assignmentRegForm + "<--assignmentRegForm");
		
		// insertReportSubmit Mapper Call
		int assignmentRegResult = assignmentRegMapper.insertAssignmentReg(assignmentReg);
		// reportSubmit 디버깅
		log.debug(TeamColor.BJH + assignmentRegResult + "<--assignmentRegResult");
		
		// 파일이 업로드 되었다면
		if (file != null) {
			// file 디버깅
			log.debug(TeamColor.BJH + file + "<--file");
			AssignmentRegImg assignmentRegImg = new AssignmentRegImg();
			assignmentRegImg.setAssignmentRegNo(assignmentRegNo);
			// reportSubmiFile 디버깅
			log.debug(TeamColor.BJH + assignmentRegImg + "<--assignmentRegImg");

			// 랜던이름 생성 API
			String fileName = UUID.randomUUID().toString();
			// 중복되지않는 문자이름 직접 생성 or API
			assignmentRegImg.setFileName(fileName);
			
			// 원본이름
			String assignmentRegImgOriginName = file.getOriginalFilename();
			// 마지막 점 위치
			int ext = assignmentRegImgOriginName.lastIndexOf(".");
			// 오리지널이름 뒤에서 점까지 자르기
			String fileExt = assignmentRegImgOriginName.substring(ext+1);
			log.debug(TeamColor.BJH + fileExt + "<--fileExt");
			
			// 오리지널 이름
			assignmentRegImg.setOriginName(fileExt);
			// 첨부파일 타입
			assignmentRegImg.setContentType(fileExt);
			// 첨부파일 사이즈
			assignmentRegImg.setFileSize(file.getSize());
			// reportSubmit 디버깅
			log.debug(TeamColor.BJH + assignmentRegImg + "<--assignmentRegImg");
			// insertReportSubmitFile Mapper Call
			int insertAssignmentRegFile = assignmentRegMapper.insertAssignmentRegFile(assignmentRegImg);
			// row 디버깅
			log.debug(TeamColor.BJH + insertAssignmentRegFile + "<--insertAssignmentRegFile");
			
			// 파일저장
			File f = new File("C:\\Users\\GDJ50\\git\\LMS\\LMS\\src\\main\\webapp\\upload\\file" + fileName+ "." +fileExt);
			// f 디버깅 C:\Users\Park\git-LMS\lms\src
						log.debug(TeamColor.BJH + f + "<--f");
						
			try {
				file.transferTo(f);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
				// Transactional 구동조건 -> 예외 발생
				throw new RuntimeException(); 
			}
		}
	} 
	
	
	

	// 제출한 과제 상세보기 메소드
	// AssignmentRegOne
	// 파라미터 : assignmentRegNo
	// 리턴값 : AssignmentReg
	public AssignmentReg AssignmentRegOne(int assignmentRegNo) {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "AssignmentRegOne Service");
		// 파라미터 디버깅
		log.debug(TeamColor.BJH + assignmentRegNo + "<-- assignmentRegNo");
		// Mapper call
		AssignmentReg AssignmentRegOne = assignmentRegMapper.AssignmentRegOne(assignmentRegNo);
		// Mapper에서 받아온 ReportSubmitOne 값 디버깅
		log.debug(TeamColor.BJH + AssignmentRegOne + "<-- AssignmentRegOne");

		return AssignmentRegOne;
	} 
	
	
	
	

	// 제출한 과제 수정하는 메소드
	// modifyAssignmentReg Action
	// 파라미터 : AssignmentReg
	// 리턴값 : int
	public int modifyAssignmentReg(AssignmentRegForm assignmentRegForm) {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "modifyAssignmentReg Service");
		// 파라미터 디버깅
		log.debug(TeamColor.BJH + assignmentRegForm + "<-- assignmentRegForm");

		// Mapper call
		int modifyAssignmentReg = assignmentRegMapper.updateAssignmentReg(assignmentRegForm);
		// Mapper에서 받아온 modifyAssignmentReg 값 디버깅
		log.debug(TeamColor.BJH + assignmentRegForm + "<-- assignmentRegForm");

		return modifyAssignmentReg;
	} 
	
	
	
	
	
	// 제출한 과제 점수 수정하는 메소드
	// 파라미터 : assignmentRegNo
	// 리턴값 : int
	public int modifyAssignmentRegScore(int assignmentRegNo) {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "modifyAssignmentRegScore  Service");
		// 파라미터 디버깅
		log.debug(TeamColor.BJH + assignmentRegNo + "<-- assignmentRegNo");

		// Mapper call
		int modifyAssignmentRegScore = assignmentRegMapper.updateAssignmentRegScore(assignmentRegNo);
		// Mapper에서 받아온 modifyAssignmentRegScore 값 디버깅
		log.debug(TeamColor.BJH + modifyAssignmentRegScore + "<-- modifyAssignmentRegScore");

		return modifyAssignmentRegScore;
	}

	
	
	
	// 제출한 과제 삭제하는 메소드
	// 파라미터 : assignmentRegNo
	// 리턴값 : int
	public int removeAssignmentReg(int assignmentRegNo) {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "removeAssignmentReg Service");
		// 파라미터 디버깅
		log.debug(TeamColor.BJH + assignmentRegNo + "<-- assignmentRegNo");

		// Mapper call
		int removeAssignmentReg = assignmentRegMapper.deleteAssignmentReg(assignmentRegNo);
		// Mapper에서 받아온 removeAssignmentReg 값 디버깅
		log.debug(TeamColor.BJH + removeAssignmentReg + "<-- removeAssignmentReg");

		return removeAssignmentReg;
	} 
	
	

}
