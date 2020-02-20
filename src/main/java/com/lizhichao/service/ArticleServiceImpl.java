package com.lizhichao.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lizhichao.bean.Article;
import com.lizhichao.mapper.ArticleMapper;
@Service
public class ArticleServiceImpl implements ArticleService{
	
	@Autowired
	private ArticleMapper mapper;
	
	
	@Override
	public List<Article> list(Article article) {
		// TODO Auto-generated method stub
		return mapper.list(article);
	}

}
