package com.ssun.everybook.domain;

public class Criteria {

	private int page;
	private int perPageNum;

	// constructor
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}

	// getter & setter
	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			//return;
		}
		this.page = page;
	}

	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			//return;
		}

		this.perPageNum = perPageNum;
	}

	public int getPage() {
		return page;
	}

	// method for MYBATIS SQL Mapper
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}

	// method for MYBATIS SQL Mapper
	// limit뒤의 숫자를 의미 즉, 한 페이지당 보여지는 개수
	public int getPerPageNum() {
		return this.perPageNum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}

}
