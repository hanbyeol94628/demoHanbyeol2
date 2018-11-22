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
@RequestMapping("/article/normal")
public class ArticleController {
	
	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);
	
	private final ArticleService articleService;
	
	@Inject
	public ArticleController(ArticleService articleService) {
		this.articleService = articleService;
	}
	
	// 등록 페이지 이동
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String writeGET() {
		logger.info("normal writeGET() called...");
		return "/article/normal/write";
	}
	
	// 등록 처리
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String writePOST(ArticleVO articleVO, RedirectAttributes redirectAttributes) throws Exception{
		logger.info("normal writePOST() called...");
		logger.info(articleVO.toString());
		articleService.create(articleVO);
		redirectAttributes.addFlashAttribute("msg", "regSuccess");
		
		return "redirect:/article/normal/list";
	}
	
	// 목록 페이지 이동
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(Model model) throws Exception{
		logger.info("normal list() called...");
		model.addAttribute("articles", articleService.listAll());
		
		return "/article/normal/list";
	}
	// 페이징
	@RequestMapping(value="/listCriteria", method=RequestMethod.GET)
	public String listCriteria(Model model, Criteria criteria) throws Exception{
		logger.info("normal listCriteria()...");
		model.addAttribute("articles", articleService.listCriteria(criteria));
		return "/article/normal/list_criteria";
	}
		
		
	// 조회 페이지 이동
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public String read(@RequestParam("article_no") int article_no,
						Model model) throws Exception{
		logger.info("normal read() called...");
		model.addAttribute("article", articleService.read(article_no));
		return "/article/normal/read";
	}
	
	// 수정 페이지 이동
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public String modifyGET(@RequestParam("article_no") int article_no, Model model) throws Exception{
		logger.info("normal modifyGet() called...");
		model.addAttribute("article", articleService.read(article_no));
		return "/article/normal/modify";
	}
	
	// 수정 처리
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(ArticleVO articleVO, RedirectAttributes redirectAttributes) throws Exception{
		logger.info("normal modifyPOST() called...");
		articleService.update(articleVO);
		redirectAttributes.addFlashAttribute("msg", "modSuccess");
		return "redirect:/article/normal/list";
	}
	
	
	
	// 삭제 처리
	@RequestMapping(value="/remove", method=RequestMethod.POST)
	public String remove(@RequestParam("article_no") int article_no, RedirectAttributes redirectAttributes) throws Exception{
		logger.info("normal remove...");
		articleService.delete(article_no);
		redirectAttributes.addFlashAttribute("msg", "delSuccess");
		return "redirect:/article/normal/list";
	}
	
	
	
	
}
