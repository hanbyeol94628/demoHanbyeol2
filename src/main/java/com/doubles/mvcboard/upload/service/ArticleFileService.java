package com.doubles.mvcboard.upload.service;

import java.util.List;

public interface ArticleFileService {

	void addFile(String fullName) throws Exception;
	
	List<String> getArticleFiles(int article_no) throws Exception;
	

}
