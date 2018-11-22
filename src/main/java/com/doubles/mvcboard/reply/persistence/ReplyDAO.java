package com.doubles.mvcboard.reply.persistence;

import java.util.List;

import com.doubles.mvcboard.commons.paging.Criteria;
import com.doubles.mvcboard.reply.domain.ReplyVO;

public interface ReplyDAO {

	List<ReplyVO> list (int article_no) throws Exception;
	
	void create(ReplyVO replyVO) throws Exception;
	
	void update(ReplyVO replyVO) throws Exception;
	
	void delete(int reply_no) throws Exception;
	
	List<ReplyVO> listPaging(int article_no, Criteria criteria) throws Exception;
	
	int countReply(int article_no) throws Exception;
}
