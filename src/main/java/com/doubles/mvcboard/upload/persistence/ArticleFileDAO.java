package com.doubles.mvcboard.upload.persistence;

import java.util.List;

public interface ArticleFileDAO {

	// 파일 추가 
	void addFile(String fullName) throws Exception;
	
	// 첨부 파일 목록
	List<String> getArticleFiles(int article_no) throws Exception;
	
	// 게시글의 첨부 파일 전체 삭제 
	void deleteFiles(int article_no) throws Exception;

}
