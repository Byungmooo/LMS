package com.gd.LMS.notice.service;

import java.util.List;

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
    public List<TotalNotice> getTotalNoticeList() {
        return noticeMapper.selectTotalNoticeList();
    }
   
    public TotalNotice getTotalNotice(int noticeNo) {
        return noticeMapper.selectTotalNoticeOne(noticeNo);
    }

    public int addTotalNotice(TotalNotice totalNotice) {
        return noticeMapper.addTotalNotice(totalNotice);
    }

    public void updateTotalNoticeCount(int noticeNo) {
    	noticeMapper.updateTotalNoticeCount(noticeNo);
    }

    public int deleteTotalNotice(int noticeNo) {
        return noticeMapper.deleteTotalNotice(noticeNo);
    }

    public int updateTotalNotice(TotalNotice totalNotice) {
        return noticeMapper.updateTotalNotice(totalNotice);
    }
    
	//페이징 , 검색
	public int countBoard(String keyword, String searchType) {
		return noticeMapper.countBoard(keyword, searchType);
	}

	public List<TotalNotice> selectBoard(PagingVo vo) {
		return noticeMapper.selectBoard(vo);
	}
	
	public TotalNotice getNoticeOne(int noticeNo) {
		return noticeMapper.selectNoticeOne(noticeNo);
	}
	
	public int addNotice(TotalNotice totalNotice) {
		return noticeMapper.insertNotice(totalNotice);
	}
}
