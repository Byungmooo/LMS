package com.gd.LMS.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.mapper.TotalNoticeMapper;
import com.gd.LMS.vo.TotalNotice;

import lombok.extern.slf4j.Slf4j;



@Slf4j
@Transactional
@Service
public class TotalNoticeService {
	@Autowired private TotalNoticeMapper totalNoticeMapper;
	
	// 전체공지사항 목록 리스트
	public List<Map<String, Object>> getTotalNoticeList(){
		List<Map<String, Object>> noticeList = totalNoticeMapper.selectTotalNoticeList();
		return noticeList;
	}
	

	
}
