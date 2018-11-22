package article;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.doubles.mvcboard.article.domain.ArticleVO;
import com.doubles.mvcboard.article.persistence.ArticleDAO;
import com.doubles.mvcboard.commons.paging.SearchCriteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring-config/applicationContext.xml"})
public class sqlTest {
	
	private static final Logger logger = LoggerFactory.getLogger(sqlTest.class);
	
	@Inject
	private ArticleDAO articleDAO;

	@Test
	public void testDynamic1() throws Exception{
		
		SearchCriteria searchCriteria = new SearchCriteria();
		searchCriteria.setPage(1);
		searchCriteria.setKeyword("111");
		searchCriteria.setSearchType("t");
		
		logger.info("=========================");
		
		List<ArticleVO> aritcles = articleDAO.listSearch(searchCriteria);
		
		for(ArticleVO article : aritcles) {
			logger.info(article.getArticle_no()+" : "+article.getTitle());
		}

		logger.info("=========================");
		logger.info("searched articles count : " + articleDAO.countSearchedArticles(searchCriteria));
	}


}
