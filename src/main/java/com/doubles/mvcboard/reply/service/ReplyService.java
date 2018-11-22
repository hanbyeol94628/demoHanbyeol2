package com.doubles.mvcboard.reply.service;

import java.util.List;

import com.doubles.mvcboard.reply.domain.ReplyVO;

public interface ReplyService {

	List<ReplyVO> list(int article_no) throws Exception;
	
	void create (ReplyVO replyVO) throws Exception;
	
	void update (ReplyVO replyVO) throws Exception;
	
	void delete (int reply_no) throws Exception;
}
