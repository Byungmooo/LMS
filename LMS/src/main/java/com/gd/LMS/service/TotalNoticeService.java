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
	
	@Autowired private TotalNoticeMapper TotalNoticeMapper;
	
		// 공지사항 목록 출력
		public List<TotalNotice> getTotalNoticeList(int beginRow, int rowPerPage){
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		log.debug(TeamColor.KBW + beginRow );
		
		return TotalNoticeMapper.selectTotalNoticeList(map);
		}
		
		// 공지사항 총 개수
		public int getTotalNoticeListCount() {
			
			return TotalNoticeMapper.selectTotalNoticeListCount();
		}
	
		
		// 공지사항 조회수 증가
		public int updateTotalNoticeOneCount(int totalNoticeNo) {
			
			TotalNotice totalNotice = TotalNoticeMapper.selectTotalNoticeOne(totalNoticeNo);
			
			log.debug(TeamColor.KBW + totalNotice);
			
			return TotalNoticeMapper.updateTotalNoticeOneCount(totalNotice);
		}
		
		// 공지사항 상세보기
		public TotalNotice getTotalNoitceOne(int totalNoticeNo) {
			
			return TotalNoticeMapper.selectTotalNoticeOne(totalNoticeNo);
		}
		
		
		// 공지사항 수정
		public int updateTotalNoticeOne(TotalNotice totalNotice) {
			
			return TotalNoticeMapper.updateTotalNoticeOne(totalNotice);
		}
	
		
		// 공지사항 삭제
		public int deleteTotalNoticeOne(int totalNoticeNo) {
			
			return TotalNoticeMapper.deleteTotalNoticeOne(totalNoticeNo);
		}
		
		
		// 공지사항 추가
		public int insertTotalNoticeOne(TotalNotice totalNotice) {
			
			return TotalNoticeMapper.insertTotalNoticeOne(totalNotice);
		}
	
}
