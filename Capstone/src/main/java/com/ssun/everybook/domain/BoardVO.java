package com.ssun.everybook.domain;

import java.util.Date;

public class BoardVO {

	private Integer bno;
	private String title;
	private String writer;
	private String publisher;
	private String pubdate;
	private String img;
	private String isbn;
	private String org_price;
	private String sale_price;
	private String grade;
	private String content;
	private String phone;
	private String contraction;
	private String place;
	private Date regDate;
	private int viewcnt;

	public Integer getBno() {
		return bno;
	}

	public void setBno(Integer bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getPubdate() {
		return pubdate;
	}

	public void setPubdate(String pubdate) {
		this.pubdate = pubdate;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getOrg_price() {
		return org_price;
	}

	public void setOrg_price(String org_price) {
		this.org_price = org_price;
	}

	public String getSale_price() {
		return sale_price;
	}

	public void setSale_price(String sale_price) {
		this.sale_price = sale_price;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getContraction() {
		return contraction;
	}

	public void setContraction(String contraction) {
		this.contraction = contraction;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", writer=" + writer + ", publisher=" + publisher
				+ ", pubdate=" + pubdate + ", img=" + img + ", isbn=" + isbn + ", org_price=" + org_price
				+ ", sale_price=" + sale_price + ", grade=" + grade + ", content=" + content + ", phone=" + phone
				+ ", contraction=" + contraction + ", place=" + place + ", regDate=" + regDate + ", viewcnt=" + viewcnt
				+ "]";
	}

}
