package com.gd.LMS.notice.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.Department;
import com.gd.LMS.vo.TotalNotice;

@Mapper
public interface TotalNoticeMapper {
	
	// 게시물 총 갯수
	public int countBoard(Map<String, Object> map);

	// 페이징 처리 게시글 조회
	public List<TotalNotice> selectBoard(Map<String, Object> map);
	
	// 공지사항 조회수
	public void updateTotalNoticeCount(int noticeNo);
	
	// 공지사항 추가
	public int addTotalNotice(TotalNotice totalNotice);

	// 공지사항 상세보기
	public TotalNotice selectTotalNoticeOne(int noticeNo);
	
	
	// 공지사항 수정
	public int updateTotalNotice(TotalNotice totalNotice);
	
	
	//공지사항 삭제
	public int deleteTotalNotice(int noticeNo);
	
	//부서공지 조회
	public List<TotalNotice> selectBoard2(Map<String, Object> map);
}
