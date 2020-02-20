package com.lizhichao.mapper;

import java.util.List;

import com.lizhichao.bean.Article;

public interface ArticleMapper {
	List<Article> list(Article article);
}
