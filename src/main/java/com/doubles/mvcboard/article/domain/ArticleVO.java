package com.doubles.mvcboard.article.domain;

import java.util.Date;

import com.doubles.mvcboard.reply.service.ReplyService;

public class ArticleVO {
	
	private int article_no;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private int viewCnt;
	private int replyCnt;
	
	private String[] files;
	private int fileCnt;
	
	
	public String[] getFiles() {
		return files;
	}
	
	public void setFiles(String[] files) {
		this.files = files;
		setFileCnt(files.length);
	}
	
	public int getFileCnt() {
		return fileCnt;
	}
	
	public void setFileCnt(int fileCnt) {
		this.fileCnt = fileCnt;
	}
	
	
	public int getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(int replyCnt) throws Exception {
		this.replyCnt = replyCnt;
	}
	public int getArticle_no() {
		return article_no;
	}
	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewcnt) {
		this.viewCnt = viewcnt;
	}
	@Override
	public String toString() {
		return "ArticleVO [article_no=" + article_no + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", regDate=" + regDate + ", viewCnt=" + viewCnt + "]";
	}
	
	
	
}
