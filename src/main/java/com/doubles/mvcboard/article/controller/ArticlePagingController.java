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
import com.doubles.mvcboard.commons.paging.Criteria;
import com.doubles.mvcboard.commons.paging.PageMaker;

@Controller
@RequestMapping("/article/paging")
public class ArticlePagingController {
	
	private static final Logger logger = LoggerFactory.getLogger(ArticlePagingController.class);
	
	private final ArticleService articleService;
	
	@Inject
	public ArticlePagingController(ArticleService articleService) {
		this.articleService = articleService;
	}
	
	// 등록 페이지 이동
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String writeGET() {
		logger.info("write GET...");
		return "/article/paging/write";
	}
	
	// 등록 처리
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String writePOST(ArticleVO articleVO, RedirectAttributes redirectAttributes) throws Exception{
		logger.info("paging writePOST() called...");
		articleService.create(articleVO);
		redirectAttributes.addFlashAttribute("msg", "regSuccess");
		
		return "redirect:/article/list";
	}
	
	// 페이징
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String listPaging(Model model, Criteria criteria) throws Exception{
		logger.info("paging list() called...");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(articleService.countArticles(criteria));

		model.addAttribute("articles", articleService.listCriteria(criteria));
		model.addAttribute("pageMaker", pageMaker);
		
		return "/article/paging/list";
	}
	
		
		
	//// 조회 페이지 이동
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public String readPaging(@RequestParam("article_no") int article_no,
						@ModelAttribute("criteria") Criteria criteria,
						Model model) throws Exception{
		model.addAttribute("article", articleService.read(article_no));
		return "/article/paging/read";
	}
	
	
	
	//// 수정 페이지 이동
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modifyGETpaging(@RequestParam("article_no") int article_no,
							@ModelAttribute("criteria") Criteria criteria,
							Model model) throws Exception{
		logger.info("paging modifyGet() called...");
		model.addAttribute("article", articleService.read(article_no));
		return "/article/paging/modify";
	}
	//// 수정 처리
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOSTpaging(ArticleVO articleVO, 
							 Criteria criteria,
							 RedirectAttributes redirectAttributes) throws Exception{
		logger.info("paging modifyPOST() called...");
		
		articleService.update(articleVO);
		redirectAttributes.addAttribute("page", criteria.getPage());
		redirectAttributes.addAttribute("perPageNum", criteria.getPerPageNum());
		redirectAttributes.addFlashAttribute("msg", "modSuccess");
		return "redirect:/article/paging/list";
	}
	
	
	
	//// 삭제 처리
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public String removepaging(@RequestParam("article_no") int article_no, 
						 Criteria criteria,
						 RedirectAttributes redirectAttributes) throws Exception{
		logger.info("paging remove() called...");
		articleService.delete(article_no);
		redirectAttributes.addAttribute("page", criteria.getPage());
		redirectAttributes.addAttribute("perPageNum", criteria.getPerPageNum());
		redirectAttributes.addFlashAttribute("msg", "delSuccess");
		return "redirect:/article/paging/list";
	}
	
	
	
	
}
