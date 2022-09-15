package com.gd.LMS.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.LMS.commons.TeamColor;
import com.gd.LMS.mapper.LecNoticeMapper;
import com.gd.LMS.vo.LectureNotice;

import lombok.extern.slf4j.Slf4j;



@Slf4j
@Transactional
@Service
public class LecNoticeService {
	
	@Autowired private LecNoticeMapper LecNoticeMapper;
	
		// 공지사항 목록 출력
		public List<LectureNotice> getLecNoticeList(int beginRow, int rowPerPage){
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		log.debug(TeamColor.KBW + beginRow );
		
		return LecNoticeMapper.selectLecNoticeList(map);
		}
		
		// 공지사항 총 개수
		public int getLecNoticeListCount() {
			
			return LecNoticeMapper.selectLecNoticeListCount();
		}
	
		
		// 공지사항 조회수 증가
		public int updateLecNoticeOneCount(int lecNoticeNo) {
			
			LectureNotice lectureNotice = LecNoticeMapper.selectLecNoticeOne(lecNoticeNo);
			
			log.debug(TeamColor.KBW + lectureNotice);
			
			return LecNoticeMapper.updateLecNoticeOneCount(lectureNotice);
		}
		
		// 공지사항 상세보기
		public LectureNotice getLecNoitceOne(int lecNoticeNo) {
			
			return LecNoticeMapper.selectLecNoticeOne(lecNoticeNo);
		}
		
		
		// 공지사항 수정
		public int updateLecNoticeOne(LectureNotice lecNotice) {
			
			return LecNoticeMapper.updateLecNoticeOne(lecNotice);
		}
	
		
		// 공지사항 삭제
		public int deleteLecNoticeOne(int lecNoticeNo) {
			
			return LecNoticeMapper.deleteLecNoticeOne(lecNoticeNo);
		}
		
		
		// 공지사항 추가
		public int insertLecNoticeOne(LectureNotice lecNotice) {
			
			return LecNoticeMapper.insertLecNoticeOne(lecNotice);
		}
	
}
