package com.gd.LMS.service;

import java.awt.SystemColor;
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
			System.out.println(result+"<<<<<<Num Count");
			return result;
		}
		

		// 공지사항 조회수 증가
		public int updateLecNoticeOneCount(int lectNoticeNo) {
			
			LectureNotice lectureNotice = lecNoticeMapper.selectLecNoticeOne(lectNoticeNo);
			
			return lecNoticeMapper.updateLecNoticeOneCount(lectureNotice);
		}
		
		// 공지사항 상세보기
		public LectureNotice getLectureNoticeOne(int lectNoticeNo) {
			
			return lecNoticeMapper.selectLecNoticeOne(lectNoticeNo);
		}
		
		// 공지사항 수정
		public int updateLectureNoticeOne(LectureNotice lectureNotice) {
			
			return lecNoticeMapper.updateLecNoticeOne(lectureNotice);
		}
		
		// 공지사항 삭제
		public int deleteLectureNoticeOne(int lectNoticeNo) {
			
			return lecNoticeMapper.deleteLecNoticeOne(lectNoticeNo);
		}
		
		// 공지사항 추가
		public int insertLectureNoticeOne(LectureNotice lectureNotice) {
			
			return lecNoticeMapper.insertLecNoticeOne(lectureNotice);
		}
	
	
}