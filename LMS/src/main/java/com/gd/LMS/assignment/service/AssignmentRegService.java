package com.gd.LMS.assignment.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.gd.LMS.assignment.mapper.AssignmentMapper;
import com.gd.LMS.assignment.mapper.AssignmentRegImgMapper;
import com.gd.LMS.assignment.mapper.AssignmentRegMapper;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.vo.Assignment;
import com.gd.LMS.vo.AssignmentReg;
import com.gd.LMS.vo.AssignmentRegImg;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
@Transactional
public class AssignmentRegService {
	
	@Autowired AssignmentMapper assignmentMapper;
	@Autowired AssignmentRegMapper assignmentRegMapper;
	@Autowired AssignmentRegImgMapper assignmentRegImgMapper;
	
	
	//내 과제리스트 조회
	   public List<Map<String, Object>> getAssignmentRegList(int assignmentRegNo) {
	      // 디버깅 영역구분
	      log.debug(TeamColor.BJH + "getAssignmentRegList Service");

	      // assignmentListMapper 실행
	      List<Map<String, Object>> assignmentRegList = assignmentRegMapper.selectAssignmentRegList(assignmentRegNo);
	      
	      // 디버깅
	      log.debug(TeamColor.BJH + assignmentRegList + "<-- assignmentRegList");
	      
	      return assignmentRegList;
	   } 
	   
	 //나의 과제 상세보기
	public Map<String, Object> getAssignmentRegOne(int assignmentRegNo) {
		// 파라미터 디버깅
		log.debug(TeamColor.BJH + "나의 과제 상세보기 (service) > " + assignmentRegNo);
		
		// 매퍼메서드 호출 후 리턴값 디버깅
		Map<String, Object> One = assignmentRegMapper.selectAssignmentRegOne(assignmentRegNo);
		log.debug(TeamColor.BJH + "getAssignmentRegOne 성공 > " + One);
				
		 return One;
		 
		}
	
	
	//과제 추가
	public List<Assignment> addAssignmentReg(int openedLecNo) {
		List<Assignment> list = assignmentMapper.selectAssignmentList(openedLecNo);
		return list;
	}
	
	// 과제 제출 액션
	public int addAssignmentRegForm(AssignmentReg assignmentReg,  MultipartFile[] regFile
			, HttpServletRequest request, Map<String, Object> map) {
		log.debug(TeamColor.BJH + "과제제출 insertAssignmentReg Service 액션진입--->");
		
		int studentLecNo = assignmentRegMapper.selectStudentLecNo(map);	
	
		log.debug(TeamColor.BJH + "studentLecNo > " + studentLecNo);
		assignmentReg.setStudentLecNo(studentLecNo);
		int row = assignmentRegMapper.insertAssignmentReg(assignmentReg);
		
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "과제제출 insertAssignmentReg Service--->" + row);
		

		//파일 추가
				if(row != 0 && regFile != null) {
					
					String realPath = request.getSession().getServletContext().getRealPath("/imgFile/file");
					String originName = "";
					String contentType  = "";
					int assignmentRegNo = assignmentReg.getAssignmentRegNo();
					log.debug(TeamColor.BJH + "assignmentRegNo > " + assignmentRegNo);
					//리스트에 이미지파일 객체 넣기
					List<AssignmentRegImg> list = new ArrayList<>();
					
					
					for(MultipartFile file : regFile) {
						if(!file.isEmpty()) {
							originName=file.getOriginalFilename();
							contentType =file.getContentType();
							//파일 객체
							AssignmentRegImg regImgFile = new AssignmentRegImg();
							
							//값 세팅
							regImgFile.setOriginName(originName);
							regImgFile.setFileName(UUID.randomUUID() + "_" + originName);
							regImgFile.setFileType(contentType);
							regImgFile.setAssignmentRegNo(assignmentRegNo);
							
							//이미지 담은 값 세팅
							log.debug(TeamColor.BJH + "이미지 잘 들어갔나? : " + regImgFile);
							
							

							list.add(regImgFile);
							
							
							String saveFileName = realPath + File.separator + regImgFile.getFileName();
							
							
							Path savePath = Paths.get(saveFileName);
							
							//이미지 담은 값 세팅
							log.debug(TeamColor.BJH + "savePath? : " + savePath);
							
							try {
								//전송
								file.transferTo(savePath);
								
								//파일 추가
								row =+ assignmentRegImgMapper.insertRegFile(regImgFile);
								
								//디버깅
								log.debug(TeamColor.BJH + "첨부파일 결과확인" + row);
							} catch(Exception e) {
								log.debug(TeamColor.BJH + "파일 추가 실패");
								e.printStackTrace();
							}
						}
					}
				}
				
				
				return row;
				
	} 
	
	//제출한 과제 다운로드 받는 메서드
	public ResponseEntity<Object> douwnloadFile(String fileName, String realPath) {
		
		ResponseEntity<Object> returnVal = null;
		
		try {
			
			Path filePath = Paths.get(realPath);
			//파일 리소스
			Resource resource = new InputStreamResource(Files.newInputStream(filePath));
			//객체
			File file = new File(realPath);
			//헤더
			HttpHeaders headers = new HttpHeaders();
			
			headers.setContentDisposition(ContentDisposition.builder("attachment").filename(file.getName()).build());
			
			//디버깅
			log.debug(TeamColor.BJH + "파일 다운로드 성공");
			
			return new ResponseEntity<Object>(resource, headers, HttpStatus.OK);
		} catch(Exception e) {
			//디버깅
			log.debug(TeamColor.BJH + "파일 다운로드 실패");
			
			return new ResponseEntity<Object>(null, HttpStatus.CONFLICT);
		}
	
	}
	
	
	
	

	// 제출한 과제 수정 폼
	public int modifyAssignmentReg(AssignmentReg assignmentReg, AssignmentRegImg assignmentRegImg) {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "수정 폼  Service");
		
		// 파라미터 디버깅
		log.debug(TeamColor.BJH + assignmentReg + "<-- assignmentReg");
		// Mapper call
		int RegOne = assignmentRegMapper.updateAssignmentReg(assignmentReg,assignmentRegImg);
		// Mapper에서 받아온 assignmentRegOne 값 디버깅
		log.debug(TeamColor.BJH + RegOne + "<-- 수정 RegOne");
		

		return RegOne;
	} 
		
		
	
	// 제출한 과제 점수 수정
	public int modifyAssignmentRegScore(int assignmentNo) {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "modifyAssignmentRegScore  Service");
		// 파라미터 디버깅
		log.debug(TeamColor.BJH + assignmentNo + "<-- assignmentRegNo");

		int modifyAssignmentRegScore = assignmentRegMapper.updateAssignmentRegScore(assignmentNo);
		
		log.debug(TeamColor.BJH + modifyAssignmentRegScore + "<-- 과제 점수 수정 성공");

		return modifyAssignmentRegScore;
	}

		
	// 제출 과제 삭제
	public int removeAssignmentReg(int assignmentNo) {
		// 디버깅 영역구분
		log.debug(TeamColor.BJH + "removeAssignmentReg Service");
		int row= assignmentRegMapper.deleteAssignmentReg(assignmentNo);
		// 파일이 업로드 되었다면
		if (row != 0) {
			System.out.println("과제가 등록되어 수정할 수 없습니다 메시지 띄우기");
			return 0;
		}
		return assignmentNo;
	}
	
	

}
