package com.gd.LMS.member.Mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.LectureNotice;
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
	public int insertTotalNotice(TotalNotice totalNotice);
	
	// 공지사항 수정
	public int updateTotalNotice(TotalNotice totalNotice);
	
	// 공지사항 삭제
	public int deleteTotalNoticeOne(int totalNoticeNo);

	
	// 공지사항 조회수
	public void updateTotalNoticeCount(int noticeNo);
	
	//공지사항 삭제
	public int deleteTotalNotice(int noticeNo);

	// 게시물 총 갯수
	public int countBoard(String keyword, String searchType);

	// 페이징 처리 게시글 조회
	public List<TotalNotice> selectBoard(PagingVo vo);
	
	// 상세보기
	public TotalNotice selectNoticeOne(int noticeNo);
	
	// 추가
	public int insertNotice(TotalNotice totalNotice);

}
