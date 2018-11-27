package com.doubles.mvcboard.article.service;

import java.util.List;

import com.doubles.mvcboard.article.domain.ArticleVO;
import com.doubles.mvcboard.commons.paging.Criteria;
import com.doubles.mvcboard.commons.paging.SearchCriteria;

public interface ArticleService {
	void create(ArticleVO articleVO) throws Exception;
	
	void update(ArticleVO articleVO) throws Exception;
	
	void delete(int article_no) throws Exception;
	
	List<ArticleVO> listAll() throws Exception;
	
	List<ArticleVO> listCriteria(Criteria criteria) throws Exception;
	
	int countArticles(Criteria criteria) throws Exception;
	
	List<ArticleVO> listSearch(SearchCriteria searchCriteria) throws Exception;
	int countSearchedArticles(SearchCriteria searchCriteria) throws Exception;

	ArticleVO read(int aricle_no) throws Exception;
	
	void insertReplyCnt(int article_no, int replycnt) throws Exception;
}
