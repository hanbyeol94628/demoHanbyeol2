package com.doubles.mvcboard.upload.domain;

import java.util.Date;

public class ArticleFileVO {

	private String fileName;
	private int article_no;
	private Date regDate;
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getArticle_no() {
		return article_no;
	}
	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "ArticleFileVO [fileName=" + fileName + ", article_no=" + article_no + ", regDate=" + regDate
				+ ", getFileName()=" + getFileName() + ", getArticle_no()=" + getArticle_no() + ", getRegDate()="
				+ getRegDate() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
}
