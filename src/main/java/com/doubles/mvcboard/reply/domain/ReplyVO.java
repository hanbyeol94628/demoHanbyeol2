package com.doubles.mvcboard.reply.domain;

import java.util.Date;

public class ReplyVO {
	
	private int reply_no;
	private int article_no;
	private String replyText;
	private String replyWriter;
	private Date regDate;
	private Date updateDate;
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public int getArticle_no() {
		return article_no;
	}
	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}
	public String getReplyText() {
		return replyText;
	}
	public void setReplyText(String replyText) {
		this.replyText = replyText;
	}
	public String getReplyWriter() {
		return replyWriter;
	}
	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	@Override
	public String toString() {
		return "ReplyVO [reply_no=" + reply_no + ", article_no=" + article_no + ", replyText=" + replyText
				+ ", replyWriter=" + replyWriter + ", regDate=" + regDate + ", updateDate=" + updateDate + "]";
	}
	
	
	
}
