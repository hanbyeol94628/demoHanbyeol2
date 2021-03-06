package com.doubles.mvcboard.article.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.doubles.mvcboard.article.domain.ArticleVO;
import com.doubles.mvcboard.commons.paging.Criteria;
import com.doubles.mvcboard.commons.paging.SearchCriteria;

@Repository
public class ArticleDAOImpl implements ArticleDAO {

	private static final String NAMESPACE = "com.doubles.mvcboard.mappers.article.ArticleMapper";
	
	private final SqlSession sqlSession;
	
	@Inject
	public ArticleDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void create(ArticleVO articleVO) throws Exception {
		sqlSession.insert(NAMESPACE + ".create", articleVO);
	}

	@Override
	public ArticleVO read(int article_no) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".read", article_no);
	}

	@Override
	public void update(ArticleVO articleVO) throws Exception {
		sqlSession.update(NAMESPACE + ".update", articleVO);
	}

	@Override
	public void delete(int article_no) throws Exception {
		sqlSession.delete(NAMESPACE + ".delete", article_no);
	}

	@Override
	public List<ArticleVO> listAll() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listAll");
	}

	@Override
	public List<ArticleVO> listPaging(int page) throws Exception {

		// 파라미터 page 값이 음수가 들어올 수 없게 
		if(page <= 0) {
			page = 1;
		}

		page = (page - 1) * 10;
		
		return sqlSession.selectList(NAMESPACE + ".listPaging", page);
	}

	@Override
	public List<ArticleVO> listCriteria(Criteria criteria) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listCriteria", criteria);
	}

	@Override
	public int countArticles(Criteria criteria) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".countArticles", criteria);
	}

	@Override
	public List<ArticleVO> listSearch(SearchCriteria searchCriteria) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listSearch", searchCriteria);
	}

	@Override
	public int countSearchedArticles(SearchCriteria searchCriteria) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".countSearchedArticles", searchCriteria);
	}

	@Override
	public void updateReplyCnt(int article_no, int amount) throws Exception {

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("article_no", article_no);
		paramMap.put("amount", amount);
		
		sqlSession.update(NAMESPACE + ".updateReplyCnt", paramMap); 
	}

	@Override
	public void updateViewCnt(int article_no) throws Exception {
		sqlSession.update(NAMESPACE + ".updateViewCnt", article_no);
	}

	@Override
	public void insertReplyCnt(int article_no, int replycnt) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("article_no", article_no);
		paramMap.put("replyCnt", replycnt);
		
		sqlSession.update(NAMESPACE + ".insertReplyCnt", paramMap); 
		
	}


}
