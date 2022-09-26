package com.gd.LMS.lecture.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.LectureAnswer;
import com.gd.LMS.vo.LectureNotice;
import com.gd.LMS.vo.LectureQuestion;

@Mapper
public interface LectureMapper {
	
	
	// 강의리스트
	List<Map<String, Object>> selectStudentLectureList(int studentCode);
	
	// 강의 상세보기
	Map<String, Object> selectOpenedLectureOne(int openedLecNo);
	
	// 강의 질문리스트
	List<LectureQuestion> selectLectureQuestionList(int openedLecNo);
	
	// 강의 질문 상세보기
	Map<String, Object> selectLectureQuestionOne(int lecQuestionNo);
	
	// 학생 수강신청 (전체과목)
	List<Map<String, Object>> selectTotalLectureList(PagingVo vo);
	
	// 학생 수강신청 (신청)
	int insertStudentLecture(List<Map<String, Object>> list);
	
	// 학생 수강신청 (장바구니)
	List<Map<String, Object>> selectStudentLectureCartList();
	
	// 강의 질문 답변여부
	 int answerStatus(int lecQuestionNo);
	
	// 학생 질문 답변 추가 -교수-
	int addAnswer(LectureAnswer lectureAnswer);
	
	// 학생 질문 추가 -학생-
	int addQuestion(LectureQuestion lectureQuestion);
	 
	// 공지사항 수정
	public int updateLecQuestion(LectureQuestion lectureQuestion);
		
	// 공지사항 삭제
	public int deleteLecQuestion(int lecQuestionNo);
	
	// 학생 수강신청 (전체과목수)
	int selectTotalLectureCount();
	
	// 학생 수강신청 (수강담기)
	int studentCartInsert(Map<String, Object> map);
	
	// 학생 수강신청 (수강취소)
	int studentCartDelete(String cartNo);
	
	// 학생 장바구니 삭제
	int deleteStudentLectureCart(String studentCode);

	//
    Map<String, Object> selectLectureAnswerOne(int lecQuestionNo);
    
    
	
	// 게시물 총 갯수
	public int countBoard(String keyword, String searchType);

	// 페이징 처리 게시글 조회
	public List<LectureQuestion> selectBoard(PagingVo vo);
}
