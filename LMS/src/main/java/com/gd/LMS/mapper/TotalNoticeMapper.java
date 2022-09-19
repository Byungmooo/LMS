package com.gd.LMS.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.vo.TotalNotice;
import org.mybatis.spring.annotation.MapperScan;

@Mapper
public interface TotalNoticeMapper {

	
	// 공지사항 조회수 증가
	public int updateTotalNoticeOneCount(TotalNotice totalNotice);
	

	// 전체공지사항 목록
	List<TotalNotice> selectTotalNoticeList();
	
	// 공지사항 상세보기
	public TotalNotice selectTotalNoticeOne(int noticeNo);
	

	// 공지사항 추가
	public int insertTotalNoticeOne();
	
	// 공지사항 수정
	public int updateTotalNoticeOne(TotalNotice totalNotice);
	
	// 공지사항 삭제
	public int deleteTotalNoticeOne(int totalNoticeNo);

	public int insertTotalNotice(TotalNotice totalNotice);

	public void updateTotalNoticeCount(int noticeNo);

	public int deleteTotalNotice(int noticeNo);

	public int updateTotalNotice(TotalNotice totalNotice);
}
