package com.doubles.mvcboard.upload.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ArticleFileDAOImpl implements ArticleFileDAO{

	private static final String NAMESPACE = "com.doubles.mvcboard.mappers.upload.ArticleFileMapper";
	
	private final SqlSession sqlSession;
	
	@Inject
	public ArticleFileDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void addFile(String fileName) throws Exception {
		sqlSession.insert(NAMESPACE + ".addFile", fileName);
	}

	@Override
	public List<String> getArticleFiles(int article_no) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".getArticleFiles", article_no);
	}

	@Override
	public void deleteFiles(int article_no) throws Exception {
		sqlSession.delete(NAMESPACE + ".deleteFiles", article_no);
	}
}
