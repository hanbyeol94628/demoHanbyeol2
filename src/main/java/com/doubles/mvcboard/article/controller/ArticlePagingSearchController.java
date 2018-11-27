package com.doubles.mvcboard.article.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.doubles.mvcboard.article.domain.ArticleVO;
import com.doubles.mvcboard.article.service.ArticleService;
import com.doubles.mvcboard.commons.paging.PageMaker;
import com.doubles.mvcboard.commons.paging.SearchCriteria;
import com.doubles.mvcboard.reply.service.ReplyService;

@Controller
@RequestMapping("/article/search")
public class ArticlePagingSearchController {

	private static final Logger logger = LoggerFactory.getLogger(ArticlePagingSearchController.class);
	
	private ArticleService articleService;
	private ReplyService replyService;
	
	@Inject
	public ArticlePagingSearchController(ArticleService articleService) {
		this.articleService = articleService;
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(SearchCriteria searchCriteria, Model model)throws Exception{
		
		logger.info("search list() called ...");
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(searchCriteria);
		pageMaker.setTotalCount(articleService.countSearchedArticles(searchCriteria));

		
		model.addAttribute("articles", articleService.listSearch(searchCriteria));
		model.addAttribute("pageMaker", pageMaker);
		
		return "article/search/list";
	}
	
	
	// 등록 페이지 이동
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String writeGET() {
		logger.info("write GET...");
		return "/article/search/write";
	}
		
	// 등록 처리
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String writePOST(ArticleVO articleVO, RedirectAttributes redirectAttributes) throws Exception{
		logger.info("paging writePOST() called...");
		articleService.create(articleVO);
		redirectAttributes.addFlashAttribute("msg", "regSuccess");
		
		return "redirect:/article/search/list";
	}
	
	
	//조회 
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public String read(@RequestParam("article_no") int article_no,
					   @ModelAttribute("searchCriteria") SearchCriteria searchCriteria,
					   Model model) throws Exception{
		logger.info("search read() called...");
		model.addAttribute("article", articleService.read(article_no));
		
		return "article/search/read";
	}
	
	
	////수정 페이지 이동
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modifyGETpaging(@RequestParam("article_no") int article_no,
							@ModelAttribute("searchCriteria") SearchCriteria searchCriteria,
							Model model) throws Exception{
		logger.info("search modifyGet() called...");
		logger.info(searchCriteria.toString());
		model.addAttribute("article", articleService.read(article_no));
		return "/article/search/modify";
	}
	//// 수정 처리
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOSTpaging(ArticleVO articleVO, 
							 SearchCriteria searchCriteria,
							 RedirectAttributes redirectAttributes) throws Exception{
		logger.info("search modifyPOST() called...");
		
		articleService.update(articleVO);
		redirectAttributes.addAttribute("page", searchCriteria.getPage());
		redirectAttributes.addAttribute("perPageNum", searchCriteria.getPerPageNum());
		redirectAttributes.addAttribute("searchType", searchCriteria.getSearchType());
		redirectAttributes.addAttribute("keyword", searchCriteria.getKeyword());
		
		redirectAttributes.addFlashAttribute("msg", "modSuccess");
		return "redirect:/article/search/list";
	}
	
	
	
	//// 삭제 처리
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public String removepaging(@RequestParam("article_no") int article_no, 
						 SearchCriteria searchCriteria,
						 RedirectAttributes redirectAttributes) throws Exception{
		logger.info("search remove() called...");
		articleService.delete(article_no);
		redirectAttributes.addAttribute("page", searchCriteria.getPage());
		redirectAttributes.addAttribute("perPageNum", searchCriteria.getPerPageNum());
		redirectAttributes.addAttribute("searcyType", searchCriteria.getSearchType());
		redirectAttributes.addAttribute("keyword", searchCriteria.getKeyword());
		redirectAttributes.addFlashAttribute("msg", "delSuccess");
		return "redirect:/article/search/list";
	}
	
	
	
}
