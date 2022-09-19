package com.gd.LMS.utils;

import lombok.Data;

@Data
public class PagingVo {	
	private int currentPage;   // 현재 페이지 번호
	private int beginPage;     // 첫 페이지 번호
	private int endPage;       // 끝 페이지 번호
	private int lastPage;      // 마지막 페이지 번호
	private int rowPerPage;    // 페이지당 출력할 데이터 개수
	private int totalCount;    // 전체 데이터 수

	private boolean prePage;   // 이전 페이지 존재 여부
	private boolean nextPage;  // 다음 페이지 존재 여부

	private String keyword;    // 검색 키워드
	private String searchType; // 검색 유형
	
	public PagingVo() {
		
	}
	
	// 컨트롤러에서 호출하여 메서드 계산한 vo return
	public PagingVo(int currentPage, int totalCount, int rowPerPage, String keyword, String searchType) {		
		setCurrentPage(currentPage);
		setTotalCount(totalCount);
		setRowPerPage(rowPerPage);
		setKeyword(keyword);
		setSearchType(searchType);
		
		calcLastPage(getTotalCount(), getRowPerPage());
		calcStartEndPage(getCurrentPage(), getRowPerPage());
		calcPreNextPage();
	}
	
	
	// 제일 마지막 페이지 계산
	public void calcLastPage(int totalCount, int rowPerPage) {
		if ((totalCount % rowPerPage) == 0) {
			setLastPage(totalCount / rowPerPage);
		} else {
			setLastPage(totalCount / rowPerPage + 1);
		}
	}
		
	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int currentPage, int rowPerPage) {		
		setBeginPage( (currentPage - 1) * rowPerPage );
		
		setEndPage(getBeginPage() + rowPerPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
	}
	
	// 이전 및 다음 페이지 존재여부 확인
	public void calcPreNextPage() {
        setPrePage(getCurrentPage() > 1);

        // 다음 페이지 존재 여부 확인
        setNextPage(getEndPage() < getLastPage());
	}
}
