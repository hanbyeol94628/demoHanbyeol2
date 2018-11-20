package com.doubles.mvcboard.commons.paging;

public class PageMaker {

	private int totalCount;		// 전체 게시글 개수
	private int startPage;		
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int displayPageNum = 10;	// 페이지 번호 개수
	private Criteria criteria;
	
	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();

	}
	

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotalCount() {
		return totalCount;
	}
	
	private void calcData() {
		
		endPage = (int)(Math.ceil(criteria.getPage() / (double) displayPageNum) * displayPageNum);
		startPage = (int)(endPage - displayPageNum) + 1;
		int tempEndPage = (int)(Math.ceil(totalCount / (double) criteria.getPerPageNum()));
		
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = startPage == 1 ? false : true;
		next = endPage * criteria.getPerPageNum() >= totalCount ? false : true;
		
	}

	
	
	
}
