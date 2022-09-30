package com.gd.LMS.exam.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.exam.service.professortExService;
import com.gd.LMS.vo.ExamSheet;
import com.gd.LMS.vo.MultipleChoiceQuestion;
import com.gd.LMS.vo.MultipleExample;
import com.gd.LMS.vo.SubjectiveQuestion;
import lombok.extern.slf4j.Slf4j;
import netscape.javascript.JSObject;

@Slf4j
@Controller
public class professorExController {
	@Autowired
	professortExService professorExService;

	// 시험지 리스트
	@GetMapping(value = { "/exam/professorExList" })
	public String ExList(Model model) {
		log.debug(TeamColor.KBW + "--- ExList Controller GetMapping ---");

		// 교수코드 추후 수정예정
		int professorCode = 10;

		// 교수강의리스트 메서드 호출 후 리턴값 디버깅
		List<Map<String, Object>> professorExList = professorExService.getExList(professorCode);
		log.debug(TeamColor.KBW + "professorExList (controller) > " + professorExList);

		model.addAttribute("Exlist", professorExList);

		return "exam/professorExList";
	}

	// 시험지 상세보기
	@GetMapping(value = "/exam/professorExList/{examNo}")
	public String ExOne(Model model, @PathVariable(value = "examNo") int examNo) {
		log.debug(TeamColor.KBW + "--- ExOne(시험지상세보기) Controller GetMapping ---");
		// 시험지
		ExamSheet examSheet = professorExService.getExamSheet(examNo);
		log.debug(TeamColor.KBW + "examSheet (controller) > " + examNo);
		// 객관식문제
		List<MultipleChoiceQuestion> multipleQ = professorExService.getMultipleChoiceQuestion(examNo);
		log.debug(TeamColor.KBW + "MultipleChoiceQuestion (controller) > " + examNo);
		// 객관식문제보기
		List<MultipleExample> multipleEx = professorExService.getMultipleExample(examNo);
		log.debug(TeamColor.KBW + "MultipleExample (controller) > " + examNo);

		// 주관식문제
		List<SubjectiveQuestion> subjectiveQ = professorExService.getSubjectiveQuestion(examNo);
		log.debug(TeamColor.KBW + "SubjectiveQuestion (controller) > " + examNo);

		// 시험지
		model.addAttribute("examSheet", examSheet);
		log.debug(TeamColor.KBW + "examSheet (controller) > " + examSheet);
		// 객관식문제
		model.addAttribute("multipleQ", multipleQ);
		log.debug(TeamColor.KBW + "multipleQ (controller) > " + multipleQ);
		// 객관식문제 보기(1~4번)
		model.addAttribute("multipleEx", multipleEx);
		log.debug(TeamColor.KBW + "multipleEx (controller) > " + multipleEx);
		// 주관식문제
		model.addAttribute("subjectiveQ", subjectiveQ);
		log.debug(TeamColor.KBW + "subjectiveQ (controller) > " + subjectiveQ);

		log.debug(TeamColor.KBW + "arrayUsCHECK!!>>" + multipleQ);
		return "/exam/professorExOne";
	}

	////////////////////////////////////// 추가//////////////////////////////////////////////////
	// 시험지 추가페이지이동 (시험지)
	@GetMapping("/exam/AddExamSheet")
	public String ExampleAdd() {
		log.debug(TeamColor.KBW + "--- ExampleAdd(시험지추가페이지이동) Controller Getmapping---");
		return "/exam/professorAddExamSheet";
	}

	@GetMapping("/exam/NewFile")
	public String Test() {
		return "/exam/NewFile";
	}

	// 시험지 추가액션
	@PostMapping("/exam/professorAddExamSheet")
	public String insertExampleSheet(Model model, ExamSheet examSheet, RedirectAttributes redirectAttributes) {
		log.debug(TeamColor.KBW + "--- insertExampleSheet(시험지추가) Controller Getmapping---");
		log.debug(TeamColor.KBW + "examSheet : " + examSheet);

		int result = professorExService.insertExamSheet(examSheet);

		redirectAttributes.addAttribute("examNo", result);
		log.debug(TeamColor.KBW + "result : " + result);
		return "exam/professorAddExamMultiple";
	}	

	//객관식 추가
		@PostMapping("/exam/multipleAdd")
		public @ResponseBody String insertMultiple(@RequestBody String data, HttpServletRequest request, 
										ModelMap model) throws Exception{
			System.out.println(data);
			int multipleQ = 0;
			int multipleExample = 0;
			//json 데이터 파싱
			JSONObject obj = new JSONObject(data);
			JSONArray array = obj.getJSONArray("data");
			
			log.debug(TeamColor.KBW + array.length());
			
			for(int i=0;i<array.length();i++) {
				JSONObject dataObj = array.getJSONObject(i);
				long multipleNo = dataObj.getInt("multipleNo");
				String multipleContent = dataObj.getString("multipleContent");
				String answer = dataObj.getString("answer");
				long examNo = dataObj.getInt("examNo");
				
				log.debug(TeamColor.KBW + "dataObj (Controller) :"+dataObj );
				
				//문제 insert service 호출
				multipleQ = professorExService.insertMultiple(multipleNo, multipleContent, answer, examNo);
				
				//보기 반복문
				for(int j=1 ;j<5; j++) {
					//j= 보기번호
					int example = j;
					String examContent = dataObj.getString("examContent"+example);
					//보기 insert service 호출
					multipleExample = professorExService.insertExample(examNo, multipleNo, examContent ,example);
				}
				
			}
			if(multipleQ > 0 && multipleExample > 0) {
				return "SUCCESS";
			}else {
				return "FAIL";
			}
		}
		// 주관식 추가화면
		@GetMapping("/exam/professorAddExamSubjective")
		public String professorAddExamSubjective(@RequestParam String examNo, Model model, ExamSheet examSheet) {
			model.addAttribute("examNo", examNo);
			return "/exam/professorAddExamSubjective";
		}
		
		// 주관식 추가 액션
		@PostMapping("/exam/insertSubjective")
		public @ResponseBody HashMap<String, Object> insertSubjective(@RequestBody Map<String, String> params) {
			int index = Integer.parseInt(params.get("index"));
			HashMap<String, Object> mapData = new HashMap<>();
			String examNo = params.get("examNo");
			int result = 0;
			for(int i=1;i<=index;i++) {
				String subjectNo = Integer.toString(i);
				String subjectContent = params.get("subject_content"+i);
				String subjectAnswer = params.get("subject_answer"+i);
				result += professorExService.insertSubjective(examNo,subjectNo,subjectContent,subjectAnswer);				
			}
			System.out.println("@@@@@@@@@@@@@@"+result);
			if(result == 5) {
				mapData.put("result", "SUCCESS");
				return mapData;
			} else {
				mapData.put("result", "FAIL");
				return mapData;
			}
			
		}		
		

	////////////////////////////////////// 추가//////////////////////////////////////////////////

	// 시험문제 수정폼
	@GetMapping("/exam/updateExamSheet/{examNo}")
	public String ExUpdate(Model model, @PathVariable(value = "examNo") int examNo) {
		log.debug(TeamColor.KBW + "---ExUpdate Controller Getmapping");
		ExamSheet examSheet = professorExService.getExamSheet(examNo);
		List<MultipleChoiceQuestion> multipleQ = professorExService.getMultipleChoiceQuestion(examNo);
		List<MultipleExample> multipleEx = professorExService.getMultipleExample(examNo);
		List<SubjectiveQuestion> subjectiveQ = professorExService.getSubjectiveQuestion(examNo);
		model.addAttribute("examSheet", examSheet);
		model.addAttribute("multipleQ", multipleQ);
		model.addAttribute("multipleEx", multipleEx);
		model.addAttribute("subjectiveQ", subjectiveQ);
		return "/exam/professorUpdateExamSheet";
	}

	// 시험이름 수정액션
	@PostMapping("/exam/updateExamSheetName/update")
	public @ResponseBody String updateExamSheetName(@RequestParam(value = "examNo") String examNo,
			@RequestParam(value = "examName") String examName) {
		System.out.println(examNo + ", " + examName);
		int result = professorExService.updateExamSheetName(examNo, examName);
		log.debug(TeamColor.KBW + "---updateExamSheet(시험지이름수정 Controller PostMapping )---" + examNo + "" + examName);

		if (result > 0) {
			return "SUCCESS";
		} else {
			return "FAIL";
		}
	}

	// 객관식문제 수정액션
	@PostMapping("/exam/multipleContent/update")
	public @ResponseBody HashMap<String, Object> updateExampleQ(@RequestBody Map<String, String> params) {
		HashMap<String, Object> mapData = new HashMap<>();
		String examNo = params.get("examNo");
		String multipleNo = params.get("multipleNo");
		String multipleContent = params.get("multipleContent");

		int result = professorExService.updateQuestion(examNo, multipleContent, multipleNo);

		if (result > 0) {
			mapData.put("result", "SUCCESS");
			return mapData;
		} else {
			mapData.put("result", "FAIL");
			return mapData;
		}
	}

	// 객관식 보기 수정액션
	@PostMapping("/exam/exampleContent/update")
	public @ResponseBody HashMap<String, Object> updateExample(@RequestBody Map<String, String> params) {
		HashMap<String, Object> mapData = new HashMap<>();
		String examNo = params.get("examNo");
		String multipleNo = params.get("multipleNo");
		String example = params.get("exampleNo");
		String exampleContent = params.get("exampleContent");

		int result = professorExService.updateExample(examNo, multipleNo, example, exampleContent);

		if (result > 0) {
			mapData.put("result", "SUCCESS");
			return mapData;
		} else {
			mapData.put("result", "FAIL");
			return mapData;
		}
	}

	// 객관식 정답 수정 액션
	@PostMapping("/exam/multipleAnswer/update")
	public @ResponseBody HashMap<String, Object> updateExampleA(@RequestBody Map<String, String> params) {
		HashMap<String, Object> mapData = new HashMap<>();
		log.debug(TeamColor.KBW + "---updateMultipleAnswer(객관식답안수정 Controller PostMapping )---");
		String examNo = params.get("examNo");
		String multipleNo = params.get("multipleNo");
		String multipleAnswer = params.get("multipleAnswer");
		log.debug("examNo : " + examNo);
		log.debug("multipleNo : " + multipleNo);
		log.debug("multipleAnswer : " + multipleAnswer);

		int result = professorExService.updateMultipleAnswer(examNo, multipleNo, multipleAnswer);

		if (result > 0) {
			mapData.put("result", "SUCCESS");
			return mapData;
		} else {
			mapData.put("result", "FAIL");
			return mapData;
		}
	}

	// 주관식 문제 수정 액션
	@PostMapping("/exam/subjectiveContent/update")
	public @ResponseBody HashMap<String, Object> updateSubjectiveQ(@RequestBody Map<String, String> params) {
		HashMap<String, Object> mapData = new HashMap<>();
		String examNo = params.get("examNo");
		String subjectiveNo = params.get("subjectiveNo");
		String subjectiveContent = params.get("subjectiveContent");

		int result = professorExService.updateSubContent(examNo, subjectiveContent, subjectiveNo);

		if (result > 0) {
			mapData.put("result", "SUCCESS");
			return mapData;
		} else {
			mapData.put("result", "FAIL");
			return mapData;
		}
	}

	// 주관식 문제 답안 수정 액션
	@PostMapping("/exam/subjectiveAnswer/update")
	public @ResponseBody HashMap<String, Object> updateSubjectiveA(@RequestBody Map<String, String> params) {
		HashMap<String, Object> mapData = new HashMap<>();
		String examNo = params.get("examNo");
		String subjectiveNo = params.get("subjectiveNo");
		String subjectiveAnswer = params.get("subjectiveAnswer");

		int result = professorExService.updateSubAnswer(examNo, subjectiveAnswer, subjectiveNo);

		if (result > 0) {
			mapData.put("result", "SUCCESS");
			return mapData;
		} else {
			mapData.put("result", "FAIL");
			return mapData;
		}
	}
	

	// 시험지삭제
	@PostMapping("/exam/deleteExamSheet")
	public String deleteExamSheet(@RequestParam(value = "examNo") int examNo) {

		professorExService.deleteExamSheet(examNo);

		log.debug(TeamColor.KBW + "--- deleteExamSheet(시험지삭제 Controller Postmapping ---");
		return "redirect:/exam/professorExList";
	}

}