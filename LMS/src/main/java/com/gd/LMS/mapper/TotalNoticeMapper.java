package com.gd.LMS.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.vo.LectureNotice;

@Mapper
public interface TotalNoticeMapper {
	// 공지사항 목록
	public List<LectureNotice> selectLecNoticeList(Map<String,Object> map);
	public int selectLecNoticeListCount();
	
	// 공지사항 조회수 증가
	public int updateLecNoticeOneCount(LectureNotice lecNotice);
	
	// 공지사항 상세보기
	public LectureNotice selectLecNoticeOne(int lecNoticeNo);
	
	// 공지사항 수정
	public int updateLecNoticeOne(LectureNotice lecNotice);
	
	// 공지사항 삭제
	public int deleteLecNoticeOne(int lecNoticeNo);
	
	// 공지사항 추가
	public int insertLecNoticeOne(LectureNotice lecNotice);

}
