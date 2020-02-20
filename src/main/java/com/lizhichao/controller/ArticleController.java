package com.lizhichao.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lizhichao.bean.Article;
import com.lizhichao.service.ArticleService;

@Controller
public class ArticleController {
	@Autowired
	private ArticleService service;
	
	@RequestMapping("list")
	public String list(Model model,Article article,String choice,@RequestParam(defaultValue="1")int pageNum) {
		PageHelper.startPage(pageNum, 10);
		List<Article> list = service.list(article);
		PageInfo<Article> page = new PageInfo<>(list);
		model.addAttribute("list", list);
		model.addAttribute("a", article);
		model.addAttribute("page", page);
		model.addAttribute("choice", choice);
		
		return "list";
		
	}
}
