package com.gd.LMS.notice.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.vo.LectureNotice;




@Mapper
public interface LectureNoticeMapper { //강의 공지게시판

	// 강의공지 목록 리스트
	public List<Map<String, Object>> selectLectureNoticeList(Map<String, Object> map);
	
	// 강의공지 게시글수
	public int selectLectureNoticeCount(Map<String, Object> map);
	
	// 강의공지 상세보기
	public LectureNotice selectLectureNoticeOne(int lecNoticeNo);
	
	// 강의공지 조회수 증가
	public int updateLectureNoticeViews(int lecNoticeNo);
	
	// 강의공지 증가된 조회수 가져오기
	public int getLectureNoticeUpdateViews(int lecNoticeNo);
	
	// 강의공지 추가
	public int insertLectureNoticeOne(LectureNotice lectureNotice);
	
	// 공지사항 수정
	public int updateLectureNoticeOne(LectureNotice lectureNotice);
	
	// 공지사항 삭제
	public int deleteLectureNoticeOne(int lectureNotice);
	
	

	

	
}