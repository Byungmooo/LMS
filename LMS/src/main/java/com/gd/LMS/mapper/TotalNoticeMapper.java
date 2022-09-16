package com.gd.LMS.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.vo.TotalNotice;

@Mapper
public interface TotalNoticeMapper {

	
	// 공지사항 조회수 증가
	public int updateTotalNoticeOneCount(TotalNotice totalNotice);
	

	// 전체공지사항 목록
	List<Map<String, Object>> selectTotalNoticeList();
	
	// 공지사항 상세보기
	public TotalNotice selectTotalNoticeOne();
	

	// 공지사항 추가
	public int insertTotalNoticeOne();
	
	// 공지사항 수정
	public int updateTotalNoticeOne(TotalNotice totalNotice);
	
	// 공지사항 삭제
	public int deleteTotalNoticeOne(int totalNoticeNo);
	


}
