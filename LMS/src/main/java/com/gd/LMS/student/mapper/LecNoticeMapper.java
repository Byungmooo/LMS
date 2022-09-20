package com.gd.LMS.student.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.LectureNotice;




@Mapper
public interface LecNoticeMapper { //강의 공지게시판
	
	// 공지사항 목록
	List<LectureNotice> selectLecNoticeList();
	
	// 공지사항 상세보기
	public LectureNotice selectLecNoticeOne(int lecNoticeNo);
	
	// 공지사항 수정
	public int updateLecNotice(LectureNotice lectureNotice);
	
	// 공지사항 추가
	public int addLecNotice(LectureNotice lectureNotice);
	
	// 공지사항 조회수
	public void updateLecNoticeCount(int lecNoticeNo);

	// 공지사항 조회수 증가
	public int updateLecNoticeOneCount(LectureNotice lectureNotice);
	
	
	// 공지사항 삭제
	public int deleteLecNoticeOne(int lectureNotice);
	
	
	// 게시물 총 갯수
	public int countBoard(String keyword, String searchType);

	// 페이징 처리 게시글 조회
	public List<LectureNotice> selectBoard(PagingVo vo);
	
	// 상세보기
	public LectureNotice selectNoticeOne(int lecNoticeNo);
	
	// 추가
	public int insertNotice(LectureNotice lectureNotice);

	
}