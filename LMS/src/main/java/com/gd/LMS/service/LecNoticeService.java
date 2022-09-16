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
	@Autowired 	private LecNoticeMapper lecNoticeMapper;

		// 공지사항 목록 출력
		public List<LectureNotice> getLecNoticeList(int beginRow, int rowPerPage){
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		
		log.debug(TeamColor.BJH + beginRow);
		log.debug(TeamColor.BJH + rowPerPage);
		
		return lecNoticeMapper.selectLecNoticeList(map);
		}
		
		// 공지사항 총 개수
		public int getLecNoticeListCount() {
			int result= lecNoticeMapper.selectLecNoticeListCount();
			
			log.debug(TeamColor.BJH + result);
			
			return result;
		}
		

		// 공지사항 조회수 증가
		public int modifyLecNoticeOneCount(int lecNoticeNo) {
			
			LectureNotice lectureNotice = lecNoticeMapper.selectLecNoticeOne(lecNoticeNo);
			
			log.debug(TeamColor.BJH + lectureNotice);
			
			return lecNoticeMapper.updateLecNoticeOneCount(lectureNotice);
		}
		
		// 공지사항 상세보기
		public LectureNotice getLecNoticeOne(int lecNoticeNo) {
			
			return lecNoticeMapper.selectLecNoticeOne(lecNoticeNo);
		}
				
		
		// 공지사항 수정
		public int modifyLecNoticeOne(LectureNotice lectureNotice) {
			
			return lecNoticeMapper.updateLecNoticeOne(lectureNotice);
		}
		
		// 공지사항 삭제
		public int removeLecNoticeOne(int lecNoticeNo) {
			
			return lecNoticeMapper.deleteLecNoticeOne(lecNoticeNo);
		}
		
		// 공지사항 추가 폼
		public int addLecNoticeOne(LectureNotice lectureNotice) {
			
			int row = lecNoticeMapper.insertLecNoticeOne(lectureNotice);
			
			return row;
		}
		// 공지사항 추가 액션
		public int addLecNoticeOneAction(LectureNotice lectureNotice) {
		
			log.debug(TeamColor.BJH + lectureNotice);
			int row = lecNoticeMapper.insertLecNoticeOne(lectureNotice);
			return row;
		}
		
	
}