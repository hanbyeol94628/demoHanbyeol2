package com.doubles.mvcboard.reply.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.doubles.mvcboard.reply.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	private static String NAMESPACE = "com.doubles.mvcboard.mappers.reply.ReplyMapper";
	
	private final SqlSession sqlSession;

	@Inject
	public ReplyDAOImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	@Override
	public List<ReplyVO> list(int article_no) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".list", article_no);
	}

	@Override
	public void create(ReplyVO replyVO) throws Exception {
		sqlSession.insert(NAMESPACE + ".create", replyVO);
	}

	@Override
	public void update(ReplyVO replyVO) throws Exception {
		sqlSession.update(NAMESPACE + ".update", replyVO);
	}

	@Override
	public void delete(int reply_no) throws Exception {
		sqlSession.delete(NAMESPACE + ".delete", reply_no);
	}

}
