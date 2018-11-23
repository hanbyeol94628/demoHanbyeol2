package com.doubles.mvcboard.article.persistence;

import java.util.List;

import javax.inject.Inject;

import com.doubles.mvcboard.article.domain.ArticleVO;
import com.doubles.mvcboard.commons.paging.Criteria;
import com.doubles.mvcboard.commons.paging.SearchCriteria;
import com.doubles.mvcboard.reply.persistence.ReplyDAO;

public interface ArticleDAO {

	
	void create(ArticleVO articleVO) throws Exception;
	
	ArticleVO read(Integer articleNo) throws Exception;
	
	void update(ArticleVO articleVO) throws Exception;
	
	void delete(Integer articleNo) throws Exception;
	
	List<ArticleVO> listAll() throws Exception;
	
	List<ArticleVO> listPaging(int page) throws Exception;
	
	List<ArticleVO> listCriteria(Criteria criteria) throws Exception;

	int countArticles(Criteria criteria) throws Exception;

	List<ArticleVO> listSearch(SearchCriteria searchCriteria) throws Exception;
	
	int countSearchedArticles(SearchCriteria searchCriteria) throws Exception;

	void updateReplyCnt(int article_no, int amount) throws Exception;
}
