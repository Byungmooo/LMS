package com.gd.LMS.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.vo.LectureNotice;



@Mapper
public interface LecNoticeMapper { //강의 공지게시판
	
	// 공지사항 목록
	public List<LectureNotice> selectLecNoticeList(Map<String,Object> map);
	public int selectLecNoticeListCount();
		
	//공지사항 조회수 증가
	public int updateLecNoticeOneCount(LectureNotice lectureNotice);
	
	// 공지사항 상세보기
	public LectureNotice selectLecNoticeOne(int lecNoticeNo);

	// 공지사항 수정
	public int updateLecNoticeOne(LectureNotice lectureNotice);
	
	// 공지사항 삭제
	public int deleteLecNoticeOne(int lecNoticeNo);
	
	// 공지사항 추가
	public int insertLecNoticeOne(LectureNotice lectureNotice);

	
		
}