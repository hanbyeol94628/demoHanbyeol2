package com.doubles.mvcboard.reply.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.doubles.mvcboard.article.persistence.ArticleDAO;
import com.doubles.mvcboard.commons.paging.Criteria;
import com.doubles.mvcboard.reply.domain.ReplyVO;
import com.doubles.mvcboard.reply.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService{


	private final ReplyDAO replyDAO;
	private final ArticleDAO articleDAO;
	
	@Inject
	public ReplyServiceImpl(ReplyDAO replyDAO, ArticleDAO articleDAO) {
		this.replyDAO = replyDAO;
		this.articleDAO = articleDAO;
	}
	

	@Override
	public List<ReplyVO> list(int article_no) throws Exception {
		return replyDAO.list(article_no);
	}

	@Override
	public void create(ReplyVO replyVO) throws Exception {
		replyDAO.create(replyVO);
	}

	@Override
	public void update(ReplyVO replyVO) throws Exception {
		replyDAO.update(replyVO);
	}

	@Override
	public void delete(int reply_no) throws Exception {
		replyDAO.delete(reply_no);
	}

	@Override
	public List<ReplyVO> getRepliesPaging(int article_no, Criteria criteria) throws Exception {
		return replyDAO.listPaging(article_no, criteria);
	}

	@Override
	public int countReplies(int article_no) throws Exception {
		return replyDAO.countReply(article_no);
	}

	
	@Transactional
	@Override
	public void addReply(ReplyVO replyVO) throws Exception {
		replyDAO.create(replyVO);
		articleDAO.updateReplyCnt(replyVO.getArticle_no(), 1);
	}


	@Transactional
	@Override
	public void removeReply(int reply_no) throws Exception {
		int article_no = replyDAO.getArticleNo(reply_no);
		replyDAO.delete(reply_no);
		articleDAO.updateReplyCnt(article_no, -1);
	}
	
	
}
