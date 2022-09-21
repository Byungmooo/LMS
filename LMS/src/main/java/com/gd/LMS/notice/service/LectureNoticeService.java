package com.gd.LMS.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.LMS.notice.mapper.LectureNoticeMapper;
import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.LectureNotice;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class LectureNoticeService {
	@Autowired LectureNoticeMapper lectureNoticeMapper;

    // 전체공지사항 목록 리스트
    public List<LectureNotice> getLecNoticeList() {
        return lectureNoticeMapper.selectLecNoticeList();
    }
    
    // 상세보기
    public LectureNotice getLecNoticeList(int lecNoticeNo) {
        return lectureNoticeMapper.selectLecNoticeOne(lecNoticeNo);
    }

    // 추가
    public int addLecNotice(LectureNotice lectureNotice) {
        return lectureNoticeMapper.addLecNotice(lectureNotice);
    }
    
    // 조회수 증가
    public void updateLecNoticeCount(int lecNoticeNo) {
    	lectureNoticeMapper.updateLecNoticeCount(lecNoticeNo);
    }
    
    // 삭제	
    public int deleteLecNotice(int lecNoticeNo) {
        return lectureNoticeMapper.deleteLecNoticeOne(lecNoticeNo);
    }
    // 수정
    public int updateLecNotice( LectureNotice lectureNotice) {
        return lectureNoticeMapper.updateLecNotice(lectureNotice);
    }
    
    
	//페이징 , 검색
	public int countBoard(String keyword, String searchType) {
		return lectureNoticeMapper.countBoard(keyword, searchType);
	}

	public List<LectureNotice> selectBoard(PagingVo vo) {
		return lectureNoticeMapper.selectBoard(vo);
	}
	
	public LectureNotice getLecNoticeOne(int lecNoticeNo) {
		return lectureNoticeMapper.selectNoticeOne(lecNoticeNo);
	}
	
	public int addNotice(LectureNotice lectureNotice) {
		return lectureNoticeMapper.insertNotice(lectureNotice);
	}
}
