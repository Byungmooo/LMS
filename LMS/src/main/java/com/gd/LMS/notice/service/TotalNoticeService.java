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
	@Autowired  TotalNoticeMapper totalNoticeMapper;
	
	// 전체공지사항 목록 리스트
	public List<TotalNotice> selectBoard(Map<String, Object> map) {
		return totalNoticeMapper.selectBoard(map);
	}
	
	// 리스트 총 개수
	public int countBoard(Map<String, Object> map) {
		return totalNoticeMapper.countBoard(map);
	}
	
	// 상세보기 or 조회수 증가
	public TotalNotice getTotalNoticeOne(int noticeNo) {
        return totalNoticeMapper.selectTotalNoticeOne(noticeNo);
    }
	public void updateTotalNoticeCount(int noticeNo) {
		totalNoticeMapper.updateTotalNoticeCount(noticeNo);
    }
	
    // 공지사항 입력
    public int addTotalNotice(TotalNotice totalNotice) {
        return totalNoticeMapper.addTotalNotice(totalNotice);
    }

    // 수정
    public int updateTotalNotice(TotalNotice totalNotice) {
        return totalNoticeMapper.updateTotalNotice(totalNotice);
    }
    
    // 삭제
    public int deleteTotalNotice(int noticeNo) {
        return totalNoticeMapper.deleteTotalNotice(noticeNo);
    }
    
	// 부서공지사항 학생 목록 리스트
	public List<TotalNotice> selectBoard2(Map<String, Object> map) {
		return totalNoticeMapper.selectBoard2(map);
	}
	//  부서공지사항 학생 목록 리스트 총 개수
	public int countBoard2(Map<String, Object> map) {
		return totalNoticeMapper.countBoard2(map);
	}
	
	// 부서공지사항 교수 목록 리스트
	public List<TotalNotice> selectBoard3(Map<String, Object> map) {
		return totalNoticeMapper.selectBoard3(map);
	}
	
	// 부서공지사항 교수 목록 리스트 총 개수
	public int countBoard3(Map<String, Object> map) {
		return totalNoticeMapper.countBoard3(map);
	}
	
	// 부서공지사항 직원 목록 리스트
	public List<TotalNotice> selectBoard4(Map<String, Object> map) {
		return totalNoticeMapper.selectBoard4(map);
	}
	
	// 부서공지사항 직원 목록 리스트 총 개수
	public int countBoard4(Map<String, Object> map) {
		return totalNoticeMapper.countBoard4(map);
	}
	
	// 전체학부이름
	public List<Map<String, Object>> getTotalDepartmentName() {
		List<Map<String, Object>> map = totalNoticeMapper.selectTotalDepartmentName();
		return map;
	}
	
}
