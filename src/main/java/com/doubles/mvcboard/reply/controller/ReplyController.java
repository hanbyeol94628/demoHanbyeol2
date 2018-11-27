package com.doubles.mvcboard.reply.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.doubles.mvcboard.article.service.ArticleService;
import com.doubles.mvcboard.commons.paging.Criteria;
import com.doubles.mvcboard.commons.paging.PageMaker;
import com.doubles.mvcboard.reply.domain.ReplyVO;
import com.doubles.mvcboard.reply.service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {
	private final ReplyService replyService;
	private final ArticleService articleService;
	
	@Inject
	public ReplyController(ReplyService replyService, ArticleService articleService) {
		this.replyService = replyService;
		this.articleService = articleService;
	}
	
	// 댓글 등록
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVO replyVO){
		ResponseEntity<String> entity = null;
		try {
			replyService.create(replyVO);
			entity = new ResponseEntity<>("regSuccess", HttpStatus.OK);

			// 해당 글 번호 = replyVO.getArticle_no());
			int articleNum = replyVO.getArticle_no();
			int reply_cnt = replyService.countReplies(articleNum);
			articleService.insertReplyCnt(articleNum, reply_cnt);
			
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 댓글 목록
	@RequestMapping(value="/all/{article_no}", method=RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("article_no") int article_no){
		ResponseEntity<List<ReplyVO>> entity = null;
		try {
			entity = new ResponseEntity<>(replyService.list(article_no), HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	// 댓글 수정
	@RequestMapping(value="/{reply_no}", method= {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("reply_no") int reply_no, @RequestBody ReplyVO replyVO){
		ResponseEntity<String> entity = null;
		try {
			replyVO.setReply_no(reply_no);
			replyService.update(replyVO);
			entity = new ResponseEntity<>("modSuccess", HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	
	// 댓글 삭제
	@RequestMapping(value="/{reply_no}", method= RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("reply_no") int reply_no){
		ResponseEntity<String> entity = null;
		try {
			replyService.removeReply(reply_no);
			replyService.delete(reply_no);
			entity = new ResponseEntity<>("delSuccess", HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	// 댓글 페이징
	@RequestMapping(value="/{article_no}/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPaging(@PathVariable("article_no") int article_no,
														  @PathVariable("page") int page){
		ResponseEntity<Map<String, Object>> entity = null;
		
		try {
			Criteria criteria = new Criteria();
			criteria.setPage(page);
			
			List<ReplyVO> replies = replyService.getRepliesPaging(article_no, criteria);
			int repliesCount = replyService.countReplies(article_no);
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCriteria(criteria);
			pageMaker.setTotalCount(repliesCount);
			
			Map<String, Object> map = new HashMap<>();
			map.put("replies", replies);
			map.put("pageMaker", pageMaker);
			
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.OK);
		}
		return entity;
	}

	
	
}	
