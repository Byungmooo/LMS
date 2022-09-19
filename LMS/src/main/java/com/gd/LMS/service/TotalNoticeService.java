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
    @Autowired
    private TotalNoticeMapper totalNoticeMapper;

    // 전체공지사항 목록 리스트
    public List<TotalNotice> getTotalNoticeList() {
        return totalNoticeMapper.selectTotalNoticeList();
    }
   
    public TotalNotice getTotalNotice(int noticeNo) {
        return totalNoticeMapper.selectTotalNoticeOne(noticeNo);
    }

    public int insertTotalNotice(TotalNotice totalNotice) {
        return totalNoticeMapper.insertTotalNotice(totalNotice);
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
}
