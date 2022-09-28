package com.gd.LMS.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.LMS.notice.mapper.TotalNoticeMapper;
import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.TotalNotice;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class TotalNoticeService {
	@Autowired  TotalNoticeMapper noticeMapper;
	
	// 전체공지사항 목록 리스트
	public List<TotalNotice> selectBoard(Map<String, Object> map) {
		return noticeMapper.selectBoard(map);
	}
	
	// 리스트 총 개수
	public int countBoard(Map<String, Object> map) {
		return noticeMapper.countBoard(map);
	}
	
	// 상세보기 or 조회수 증가
	public TotalNotice getTotalNoticeOne(int noticeNo) {
        return noticeMapper.selectTotalNoticeOne(noticeNo);
    }
	public void updateTotalNoticeCount(int noticeNo) {
    	noticeMapper.updateTotalNoticeCount(noticeNo);
    }
	
    // 공지사항 입력
    public int addTotalNotice(TotalNotice totalNotice) {
        return noticeMapper.addTotalNotice(totalNotice);
    }

    // 수정
    public int updateTotalNotice(TotalNotice totalNotice) {
        return noticeMapper.updateTotalNotice(totalNotice);
    }
    
    // 삭제
    public int deleteTotalNotice(int noticeNo) {
        return noticeMapper.deleteTotalNotice(noticeNo);
    }
    
	// 부서공지사항 목록 리스트
	public List<TotalNotice> selectBoard2(Map<String, Object> map) {
		return noticeMapper.selectBoard2(map);
	}
}
