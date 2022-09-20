package com.gd.LMS.member.Service;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.member.Mapper.TotalNoticeMapper;
import com.gd.LMS.utils.PagingVo;
import com.gd.LMS.vo.TotalNotice;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Transactional
@Service
public class TotalNoticeService {
    @Autowired
    private TotalNoticeMapper totalNoticeMapper;

    // 전체공지사항 목록 리스트
    public List<TotalNotice> getTotalNoticeList() {
        return totalNoticeMapper.selectTotalNoticeList();
    }
   
    public TotalNotice getTotalNotice(int noticeNo) {
        return totalNoticeMapper.selectTotalNoticeOne(noticeNo);
    }

    public int addTotalNotice(TotalNotice totalNotice) {
        return totalNoticeMapper.addTotalNotice(totalNotice);
    }

    public void updateTotalNoticeCount(int noticeNo) {
        totalNoticeMapper.updateTotalNoticeCount(noticeNo);
    }

    public int deleteTotalNotice(int noticeNo) {
        return totalNoticeMapper.deleteTotalNotice(noticeNo);
    }

    public int updateTotalNotice(TotalNotice totalNotice) {
        return totalNoticeMapper.updateTotalNotice(totalNotice);
    }
    
	//페이징 , 검색
	public int countBoard(String keyword, String searchType) {
		return totalNoticeMapper.countBoard(keyword, searchType);
	}

	public List<TotalNotice> selectBoard(PagingVo vo) {
		return totalNoticeMapper.selectBoard(vo);
	}
	
	public TotalNotice getNoticeOne(int noticeNo) {
		return totalNoticeMapper.selectNoticeOne(noticeNo);
	}
	
	public int addNotice(TotalNotice totalNotice) {
		return totalNoticeMapper.insertNotice(totalNotice);
	}
}
