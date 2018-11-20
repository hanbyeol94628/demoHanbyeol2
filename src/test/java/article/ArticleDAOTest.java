package article;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.doubles.mvcboard.article.domain.ArticleVO;
import com.doubles.mvcboard.article.persistence.ArticleDAO;
import com.doubles.mvcboard.commons.paging.Criteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring-config/applicationContext.xml"})
public class ArticleDAOTest {
	
	private static final Logger logger = LoggerFactory.getLogger(ArticleDAOTest.class);
	
	@Inject
	private ArticleDAO articleDAO;

	@Test
	public void testCreate() throws Exception {
		for(int i=1; i<=300; i++) {
			ArticleVO articleVO = new ArticleVO();
			articleVO.setTitle(i+"번째 글 ");
			articleVO.setContent(i+"번째 글 내용이지롱롱");
			articleVO.setWriter("user0"+(i%10));
			
			articleDAO.create(articleVO);
		}
	}
	
	@Test
	public void TestURI() throws Exception{
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.path("/article/read")
				.queryParam("article_no", 12)
				.queryParam("perPageNum", 20)
				.build();
		logger.info("/article/read?article_no=12&perPageNum=20");
		logger.info(uriComponents.toString());
	}
	

	@Test
	public void TestURI2() throws Exception{
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.path("/{module}/{page}")
				.queryParam("article_no", 12)
				.queryParam("perPageNum", 20)
				.build()
				.expand("article", "read")
				.encode();
		
		logger.info("/article/read?article_no=12&perPageNum=20");
		logger.info(uriComponents.toString());
	}
	
	
	
	@Test
	public void testListCriteria() throws Exception{
		Criteria criteria = new Criteria();
		criteria.setPage(3);
		criteria.setPerPageNum(20);
		
		List<ArticleVO> articles = articleDAO.listCriteria(criteria);
		
		for(ArticleVO article : articles) {
			logger.info(article.getArticle_no() + " : " + article.getTitle());
		}
	}

	@Test
	public void testListPaging() throws Exception{
		int page = 3;
		List<ArticleVO> articles = articleDAO.listPaging(page);
		
		for(ArticleVO article: articles) {
			logger.info(article.getArticle_no() + ":" + article.getTitle());
		}
	}
	
	@Test
	public void testRead() throws Exception {
		logger.info(articleDAO.read(3).toString());
	}
	
	@Test
	public void testUpdate() throws Exception {
		ArticleVO article = new ArticleVO();
		article.setArticle_no(1);
		article.setTitle("글 수정 테스트 제목");
		article.setContent("글 수정 테스트 내용");
		articleDAO.update(article);
	}
	
	@Test
	public void testDelete() throws Exception {
		articleDAO.delete(1);
	}
}
