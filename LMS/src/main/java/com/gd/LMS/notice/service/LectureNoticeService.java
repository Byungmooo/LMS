package com.gd.LMS.notice.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



import com.gd.LMS.notice.mapper.LectureNoticeMapper;

import com.gd.LMS.vo.LectureNotice;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class LectureNoticeService {
	@Autowired 	private LectureNoticeMapper lecNoticeMapper;
	
	//페이징 , 검색
	public int countBoard(Map<String, Object> map) {
		return lecNoticeMapper.countBoard(map);
	}
	// 학부공지사항 목록 리스트
	public List<LectureNotice> selectBoard(Map<String, Object> map) {
		return lecNoticeMapper.selectBoard(map);
	}
	
    
    // 학부공지사항 상세보기
    public LectureNotice getLecNoticeList(int lecNoticeNo) {
        return lecNoticeMapper.selectLecNoticeOne(lecNoticeNo);
    }

    // 학부공지사항 추가
    public int addLecNotice(LectureNotice lectureNotice) {
        return lecNoticeMapper.addLecNotice(lectureNotice);
    }
    
    // 학부공지사항 조회수 증가
    public void updateLecNoticeCount(int lecNoticeNo) {
        lecNoticeMapper.updateLecNoticeCount(lecNoticeNo);
    }
    
    // 학부공지사항 삭제	
    public int deleteLecNotice(int lecNoticeNo) {
        return lecNoticeMapper.deleteLecNoticeOne(lecNoticeNo);
    }
    // 학부공지사항 수정
    public int updateLecNotice(LectureNotice lectureNotice) {
        return lecNoticeMapper.updateLecNotice(lectureNotice);
    }
    
    


}