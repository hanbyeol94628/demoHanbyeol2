package com.doubles.mvcboard.article.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doubles.mvcboard.article.domain.ArticleVO;
import com.doubles.mvcboard.article.service.ArticleService;
import com.doubles.mvcboard.commons.paging.Criteria;
import com.doubles.mvcboard.commons.paging.PageMaker;
import com.doubles.mvcboard.commons.paging.SearchCriteria;

@Controller
@RequestMapping("/article/search")
public class ArticlePagingSearchController {

	private static final Logger logger = LoggerFactory.getLogger(ArticlePagingSearchController.class);
	
	private ArticleService articleService;
	
	@Inject
	public ArticlePagingSearchController(ArticleService articleService) {
		this.articleService = articleService;
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(SearchCriteria searchCriteria, Model model)throws Exception{
		
		logger.info("search list() called ...");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(searchCriteria);
		pageMaker.setTotalCount(articleService.countArticles(searchCriteria));
		
		model.addAttribute("articles", articleService.listCriteria(searchCriteria));
		model.addAttribute("pageMaker", pageMaker);
		
		return "article/search/list";
	}
	
	
}
