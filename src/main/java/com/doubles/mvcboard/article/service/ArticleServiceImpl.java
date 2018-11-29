package com.doubles.mvcboard.article.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.doubles.mvcboard.article.domain.ArticleVO;
import com.doubles.mvcboard.article.persistence.ArticleDAO;
import com.doubles.mvcboard.commons.paging.Criteria;
import com.doubles.mvcboard.commons.paging.SearchCriteria;
import com.doubles.mvcboard.upload.persistence.ArticleFileDAO;

@Service
public class ArticleServiceImpl implements ArticleService {

	private final ArticleDAO articleDAO;
	private ArticleFileDAO articleFileDAO;

	@Inject
	public ArticleServiceImpl(ArticleDAO articleDAO, ArticleFileDAO articleFileDAO) {
		this.articleDAO = articleDAO;
		this.articleFileDAO = articleFileDAO;
	}
	
	@Override
	public void create(ArticleVO articleVO) throws Exception {
		
		//게시글 입력 처리
		articleDAO.create(articleVO);
		String[] files = articleVO.getFiles();
		
		if(files == null) {
			return;
		}
		
		// 게시글 첨부파일 입력 처리
		for (String fileName : files) {
			articleFileDAO.addFile(fileName);
		}
	}

	@Override
	public void update(ArticleVO articleVO) throws Exception {
		articleDAO.update(articleVO);
	}

	@Transactional
	@Override
	public void delete(int article_no) throws Exception {
		articleFileDAO.deleteFiles(article_no);
		articleDAO.delete(article_no);
	}

	@Override
	public List<ArticleVO> listAll() throws Exception {
		return articleDAO.listAll();
	}

	@Override
	public List<ArticleVO> listCriteria(Criteria criteria) throws Exception {
		return articleDAO.listCriteria(criteria);
	}

	@Override
	public int countArticles(Criteria criteria) throws Exception {
		return articleDAO.countArticles(criteria);
	}

	@Override
	public List<ArticleVO> listSearch(SearchCriteria searchCriteria) throws Exception {
		return articleDAO.listSearch(searchCriteria);
	}

	@Override
	public int countSearchedArticles(SearchCriteria searchCriteria) throws Exception {
		return articleDAO.countSearchedArticles(searchCriteria);
	}

	@Override
	public ArticleVO read(int article_no) throws Exception {
		
		articleDAO.updateViewCnt(article_no);
		return articleDAO.read(article_no);
	}

	@Override
	public void insertReplyCnt(int article_no, int replycnt) throws Exception {
		articleDAO.insertReplyCnt(article_no, replycnt);
	}



}
