package com.gd.LMS.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.LMS.test.mapper.TestMapper;
import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.LectureNotice;
import com.gd.LMS.vo.TotalNotice;

@Service
public class TestService {
	@Autowired TestMapper testMapper;
	
	// Test1
	public int countBoard(String keyword, String searchType) {
		return testMapper.countBoard(keyword, searchType);
	}

	public List<TotalNotice> selectBoard(PagingVo vo) {
		return testMapper.selectBoard(vo);
	}
	
	public LectureNotice getNoticeOne(int lecNoticeNo) {
		return testMapper.selectNoticeOne(lecNoticeNo);
	}
	
	public int addNotice(LectureNotice lectureNotice) {
		return testMapper.insertNotice(lectureNotice);
	}
}
