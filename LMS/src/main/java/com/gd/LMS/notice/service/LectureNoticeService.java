package com.gd.LMS.notice.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.notice.mapper.LectureNoticeMapper;

import com.gd.LMS.vo.LectureNotice;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class LectureNoticeService {
	@Autowired 	private LectureNoticeMapper lecNoticeMapper;
	
	// 강의공지 목록 리스트
	public List<Map<String, Object>> getLectureNoticeList(Map<String, Object> map) {
		return lecNoticeMapper.selectLectureNoticeList(map);
	}
	
	// 강의공지 게시글수
	public int getLectureNoticeCount(Map<String, Object> map) {
		return lecNoticeMapper.selectLectureNoticeCount(map);
	}
    
	// 강의공지 상세보기
    public LectureNotice getLectureNoticeOne(int lecNoticeNo) {
        return lecNoticeMapper.selectLectureNoticeOne(lecNoticeNo);
    }
    
    // 강의공지 조회수 증가 및 가져오기
    public int getLectureNoticeModifyViews(int lecNoticeNo) {
    	int row = lecNoticeMapper.updateLectureNoticeViews(lecNoticeNo);
    	int result = 0;
    	if(row != 0) {
    		result = lecNoticeMapper.getLectureNoticeUpdateViews(lecNoticeNo);
    	}
        return result;
    }
    
    // 강의공지 추가
    public int addLectureNoticeOne(LectureNotice lectureNotice) {
    	log.debug(TeamColor.LCH + "lectureNotice > " + lectureNotice);
    	
    	lecNoticeMapper.insertLectureNoticeOne(lectureNotice);
    	int key = lectureNotice.getLecNoticeNo();	
    	log.debug(TeamColor.LCH + "key > " + key);
    	
        return key;
    }
    
    // 강의공지 수정
    public int modifyLectureNoticeOne(LectureNotice lectureNotice) {
        return lecNoticeMapper.updateLectureNoticeOne(lectureNotice);
    }
    
    // 강의공지 삭제	
    public int removeLectureNoticeOne(int lecNoticeNo) {
        return lecNoticeMapper.deleteLectureNoticeOne(lecNoticeNo);
    }
}