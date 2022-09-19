package com.gd.LMS.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.LectureNotice;

@Mapper
public interface TestMapper {
	// 게시물 총 갯수
	public int countBoard(String keyword, String searchType);

	// 페이징 처리 게시글 조회
	public List<LectureNotice> selectBoard(PagingVo vo);
	
	// 상세보기
	public LectureNotice selectNoticeOne(int lecNoticeNo);
	
	// 추가
	public int insertNotice(LectureNotice lectureNotice);
}
