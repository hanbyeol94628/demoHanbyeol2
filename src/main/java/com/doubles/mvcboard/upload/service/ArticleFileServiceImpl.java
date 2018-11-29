package com.doubles.mvcboard.upload.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.doubles.mvcboard.article.persistence.ArticleDAO;
import com.doubles.mvcboard.upload.persistence.ArticleFileDAO;

@Service
public class ArticleFileServiceImpl implements ArticleFileService{

	private final ArticleDAO articleDAO;
	private final ArticleFileDAO articleFileDAO;
	
	@Inject
	public ArticleFileServiceImpl (ArticleDAO articleDAO, ArticleFileDAO articleFileDAO) {
		this.articleDAO = articleDAO;
		this.articleFileDAO = articleFileDAO;
	}

	@Override
	public void addFile(String fullName) throws Exception {
		articleFileDAO.addFile(fullName);
	}

	@Override
	public List<String> getArticleFiles(int article_no) throws Exception {
		return articleFileDAO.getArticleFiles(article_no);
	}
	
	
}
