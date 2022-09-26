package com.gd.LMS.notice.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.vo.LectureNotice;




@Mapper
public interface LectureNoticeMapper { //강의 공지게시판
	
	// 게시물 총 갯수
	public int countBoard(Map<String, Object> map);

	// 페이징 처리 게시글 조회
	public List<LectureNotice> selectBoard(Map<String, Object> map);

	
	// 공지사항 상세보기
	public LectureNotice selectLecNoticeOne(int lecNoticeNo);
	
	// 공지사항 수정
	public int updateLecNotice(LectureNotice lectureNotice);
	
	// 공지사항 추가
	public int addLecNotice(LectureNotice lectureNotice);
	
	// 공지사항 조회수 증가
	public void updateLecNoticeCount(int lecNoticeNo);

	
	// 공지사항 삭제
	public int deleteLecNoticeOne(int lectureNotice);
	
	

	

	
}