package com.gd.LMS.lecture.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.lecture.service.LectureAttendanceService;
import com.gd.LMS.lecture.service.LectureRegService;
import com.gd.LMS.utils.LectureListVo;
import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.LectureTime;
import com.gd.LMS.vo.OpenedLecture;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LectureRegController {
	@Autowired LectureRegService lectureRegService; 
	@Autowired LectureAttendanceService lectureAttendanceService;
	
	/********** 교수 강의등록 ***********/
	// 학부 강의리스트
	@GetMapping("/professor/professorLectureReg")
	public String professorLectureReg(PagingVo vo, Model model
			, @RequestParam(value="memberCode") int memberCode
			, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
			, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage
			, @RequestParam(value="keyword", defaultValue = "") String keyword) {
		log.debug(TeamColor.LCH + "--- professorLectureReg GetMapping Controller ---");
		
		// 해당 멤버코드 학부코드 받아오기
		String departmentCode = lectureRegService.getDepartmentCodeByProfessorCode(memberCode);
		
		// 전체 학부강의 개수를 뽑을 파라미터 생성
		Map<String, Object> map = new HashMap<>();
		map.put("departmentCode", departmentCode);
		map.put("keyword", keyword);
		
		// 전체 학부강의 개수
		int totalDepLectureCount = lectureRegService.getTotalDepLectureCount(map);
		log.debug(TeamColor.LCH + "count > " + totalDepLectureCount);
		
		// 페이징 변수 계산
		vo = new PagingVo(currentPage, totalDepLectureCount, rowPerPage, keyword, null);
		log.debug(TeamColor.LCH + "vo > " + vo);
		
		// 전체 학부강의 리스트를 뽑을 파라미터 생성
		Map<String, Object> map2 = new HashMap<>();
		map2.put("beginRow", vo.getBeginRow());
		map2.put("rowPerPage", vo.getRowPerPage());
		map2.put("keyword", vo.getKeyword());
		map2.put("departmentCode", departmentCode);		
		
		// 전체 학부강의 리스트
		List<Map<String, Object>> totalDepLectureList = lectureRegService.getTotalDepLectureList(map2);
		log.debug(TeamColor.LCH + "totalDepLectureList > " + totalDepLectureList);
		
		model.addAttribute("totalDepLectureList", totalDepLectureList);
		model.addAttribute("paging", vo);
		
		return "lecture/lectureReg/professorLectureReg";
	}
	
	// 강의등록 화면
	@GetMapping("/professor/professorAddLecture")
	public String professorAddLecture(Model model
			, @RequestParam(value="lectureCode") int lectureCode
			, @RequestParam(value="buildingNo", defaultValue = "0") int buildingNo
			, @RequestParam(value="errorMsg", defaultValue = "") String errorMsg) {
		log.debug(TeamColor.LCH + "--- professorAddLecture GetMapping Controller ---");
		
		// 선택강의 정보 
		Map<String, Object> totalDepLectureOne = new HashMap<>();
		totalDepLectureOne = lectureRegService.getTotalDepLectureOne(lectureCode);
		log.debug(TeamColor.LCH + "totalDepLectureOne > " + totalDepLectureOne);
				
		// 건물 리스트
		List<Map<String, Object>> buildingList = lectureRegService.getBuildingList();
		log.debug(TeamColor.LCH + "buildingList > " + buildingList);
		
		// 호수 리스트 (buildingNo)를 스크립트로 받아서 실행
		if(buildingNo != 0) {
			log.debug(TeamColor.LCH + "buildingNo > " + buildingNo);
			
			List<Map<String, Object>> classroomList = lectureRegService.getClassroomList(buildingNo);			
			log.debug(TeamColor.LCH + "classroomList > " + classroomList);
			
			model.addAttribute("classroom", classroomList);
		}
		// 에러메시지
		if(!errorMsg.equals("")) {
			model.addAttribute("errorMsg", errorMsg);
		}
		
		model.addAttribute("buildingNo", buildingNo);
		model.addAttribute("building", buildingList);
		model.addAttribute("map", totalDepLectureOne);
		
		return "lecture/lectureReg/professorAddLecture";
	}
	
	// 강의등록 액션
	@PostMapping("/professor/professorAddLecture")
	public String professorAddLecture(Model model, RedirectAttributes redirectAttributes
			, OpenedLecture openedLecture
			, LectureTime lectureTime) {
		log.debug(TeamColor.LCH + "--- professorAddLecture PostMapping Controller ---");
		
		// 파라미터 디버깅
		log.debug(TeamColor.LCH + "openedLecture > " + openedLecture);
		log.debug(TeamColor.LCH + "lectureTime > " + lectureTime);
		
		// 중복강의가 있는지 확인
		boolean check = lectureRegService.getProfessorLectureCheck(openedLecture.getProfessorCode(), openedLecture.getLectureCode());
		if(check) {
			// 에러메시지
			redirectAttributes.addAttribute("lectureCode", openedLecture.getLectureCode());
			redirectAttributes.addAttribute("errorMsg", "중복된 강의입니다.");
			return "redirect:/professor/professorAddLecture";
		}
		
		// 결과값으로 추가된 강의 번호
		int result = lectureRegService.professorAddLectureOne(openedLecture);
		log.debug(TeamColor.LCH + "result > " + result);
		
		// 강의등록에 성공하면 강의 시간표 생성
		if(result != 0) {
			lectureTime.setOpenedLecNo(result);
			int addTime = lectureRegService.addLectureTime(lectureTime);
			log.debug(TeamColor.LCH + "addTime > " + addTime);
		}
		
		redirectAttributes.addAttribute("openedLecNo", result);
		return "redirect:/professor/openedLectureOne";
	}
	
	/********** 학생 강의등록 ***********/
	// 수강신청 화면
	@GetMapping("/student/studentLectureReg")
	public String studentLectureReg(PagingVo vo, Model model, HttpSession session
			, @RequestParam(value="memberCode") int memberCode
			, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
			, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage
			, @RequestParam(value="keyword", defaultValue = "") String keyword
			, @RequestParam(value="errorMsg", defaultValue = "") String errorMsg) {
		log.debug(TeamColor.LCH + "--- studentLectureReg GetMapping Controller ---");
		// 해당 멤버코드 학부코드 받아오기
		String departmentCode = lectureRegService.getDepartmentCodeByStudentCode(memberCode);
		
		// 전체 학부 진행중인 강의 리스트를 뽑을 파라미터 생성
		Map<String, Object> countMap = new HashMap<>();
		countMap.put("keyword", keyword);
		countMap.put("departmentCode", departmentCode);
		int totalLectureCount = lectureRegService.getOpenedLectureCount(countMap);
		vo = new PagingVo(currentPage, totalLectureCount, rowPerPage, keyword, null);
		Map<String, Object> map = new HashMap<>();
		map.put("beginRow", vo.getBeginRow());
		map.put("rowPerPage", vo.getRowPerPage());
		map.put("keyword", vo.getKeyword());
		map.put("departmentCode", departmentCode);
		log.debug(TeamColor.LCH + "countMap > " + countMap);
		log.debug(TeamColor.LCH + "map > " + map);
		
		// 진행강의리스트
		List<Map<String, Object>> openedLectureList = lectureRegService.getOpenedLectureList(map);
		log.debug(TeamColor.LCH + "openedLectureList > " + openedLectureList);
		
		// 장바구니리스트
		List<Map<String, Object>> studentLectureCartList = lectureRegService.getStudentLectureCartList(memberCode);
		log.debug(TeamColor.LCH + "studentLectureCartList > " + studentLectureCartList);
		int size = 9 - studentLectureCartList.size();
		
		// 에러메시지
		if(size < 0 ) { size = 0;}
		if(!errorMsg.equals("")) {
			model.addAttribute("errorMsg", errorMsg);
		}
		
		model.addAttribute("openedList", openedLectureList);
		model.addAttribute("paging", vo);
		model.addAttribute("size", size);
		model.addAttribute("cartList", studentLectureCartList);
		
		return "lecture/lectureReg/studentLectureReg";
	}

	// 수강신청 액션
	@PostMapping("/student/studentLectureReg")
	public String studentLectureReg(LectureListVo lectureList, RedirectAttributes redirectAttributes) {
		log.debug(TeamColor.LCH + "--- studentLectureReg PostMapping Controller ---");
		
		// 파라미터 세팅
		Map<String, Object> map = null;
		List<Map<String, Object>> list = new ArrayList<>();
		
		int length = lectureList.getOpenedLecNo2().length;
		
		// 신청리스트 파라미터 생성
		for(int i=0; i<length; i++) {
			map = new HashMap<>();
			map.put("studentCode", lectureList.getStudentCode2()[i]);
			map.put("openedLecNo", lectureList.getOpenedLecNo2()[i]);
			
			// 듣는 과목이 있는지 확인
			if(lectureRegService.getStudentLectureCheck(map)) {
				redirectAttributes.addAttribute("memberCode", lectureList.getStudentCode2()[i]);
				redirectAttributes.addAttribute("errorMsg", "강의코드 " + lectureList.getOpenedLecNo2()[i] + "는 이미 수강중입니다.");
				return "redirect:/student/studentLectureReg";
			}	
			list.add(map);
		}
		
		log.debug(TeamColor.LCH + "size > " + lectureList.getOpenedLecNo2().length);		
		log.debug(TeamColor.LCH + "map > " + map);		
		log.debug(TeamColor.LCH + "list > " + list);		
		
		// 학생강의신청
		int result = lectureRegService.addStudentLeture(list);
		
		if(result != 0) {
			// 수강신청 성공 시 장바구니강의 삭제
			String studentCode = (String) list.get(0).get("studentCode");
			int row = lectureRegService.removeStudentLectureCart(studentCode);
			if(row==0) {
				log.debug(TeamColor.LCH + "실패 row > " + row);
				return "redirect:/studentLectureReg";
			}
			log.debug(TeamColor.LCH + row + "개의 강의 삭제성공");
			
			// 수강신청 성공 시 자동으로 출석부 등록
			int addAttendance = lectureAttendanceService.addAttendanceByList(list);
			log.debug(TeamColor.LCH + addAttendance + "개의 출석부등록완료");
			
			redirectAttributes.addAttribute("errorMsg", "수강신청에 성공하였습니다.");
		}
		
		redirectAttributes.addAttribute("memberCode", list.get(0).get("studentCode"));
		return "redirect:/student/studentLectureReg";
	}

	// 장바구니 담기
	@PostMapping("/student/cartAdd")
	public @ResponseBody String cartAdd(Map<String, Object> map,
			@RequestParam (value = "openedLecNo") String openedLecNo,
			@RequestParam (value = "studentCode") String studentCode) {
		log.debug(TeamColor.LCH + "--- cartAdd Controller PostMapping ---");
		
		// 파라미터세팅
		map.put("openedLecNo", openedLecNo);
		map.put("studentCode", studentCode);
		log.debug(TeamColor.LCH + "map (controller) > " + map);
		
		// 리턴값 (장바구니 중복확인)
		boolean result = lectureRegService.studentCartAdd(map);
		log.debug(TeamColor.LCH + "result (controller) > " + result);
		
		// ajax Json에 보낼 메시지
		String returnJson;
		
		// 리턴값이 false일 경우 가능
		if(!result) {
			returnJson = "y";
		} else {
			returnJson = "n";
		}
		
		return returnJson;
	}
	
	// 장바구니 빼기
	@PostMapping("/student/cartRemove")
	public @ResponseBody String cartRemove(@RequestParam (value = "cartNo") String cartNo) {
		log.debug(TeamColor.LCH + "--- cartDelete Controller PostMapping ---");
		
		// 파라미터 세팅
		log.debug(TeamColor.LCH + "cartNo (controller) > " + cartNo);
		
		// 리턴값
		int result = lectureRegService.studentCartRemove(cartNo);
		log.debug(TeamColor.LCH + "result (controller) > " + result);
		
		// ajax Json에 보낼 메시지
		String returnJson;
		
		// 리턴값이 null일 경우 사용가능한 아이디
		if(result != 0) {
			returnJson = "y";
		} else {
			returnJson = "n";
		}
		
		return returnJson;
	}
}