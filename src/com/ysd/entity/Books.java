package com.ysd.entity;

import org.springframework.stereotype.Component;

@Component
public class Books {
	private Integer bid;
	private String bname;
	private Double sale;
	private Double esale;
	private String author;
	private String jianjie;
	private String tuijian;
	private Bookcate bookcate;
	
	
	private Integer page;
	private Integer rows;
	
	public Double getEsale() {
		return esale;
	}
	public void setEsale(Double esale) {
		this.esale = esale;
	}
	public Integer getBid() {
		return bid;
	}
	public void setBid(Integer bid) {
		this.bid = bid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public Double getSale() {
		return sale;
	}
	public void setSale(Double sale) {
		this.sale = sale;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getJianjie() {
		return jianjie;
	}
	public void setJianjie(String jianjie) {
		this.jianjie = jianjie;
	}
	public String getTuijian() {
		return tuijian;
	}
	public void setTuijian(String tuijian) {
		this.tuijian = tuijian;
	}
	public Bookcate getBookcate() {
		return bookcate;
	}
	public void setBookcate(Bookcate bookcate) {
		this.bookcate = bookcate;
	}
	
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	@Override
	public String toString() {
		return "Books [bid=" + bid + ", bname=" + bname + ", sale=" + sale + ", author=" + author + ", jianjie="
				+ jianjie + ", tuijian=" + tuijian + ", bookcate=" + bookcate + "]";
	}
	
	
}
