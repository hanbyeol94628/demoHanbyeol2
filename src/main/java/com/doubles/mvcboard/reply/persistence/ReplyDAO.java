package com.doubles.mvcboard.reply.persistence;

import java.util.List;

import com.doubles.mvcboard.reply.domain.ReplyVO;

public interface ReplyDAO {

	List<ReplyVO> list (int article_no) throws Exception;
	
	void create(ReplyVO replyVO) throws Exception;
}
