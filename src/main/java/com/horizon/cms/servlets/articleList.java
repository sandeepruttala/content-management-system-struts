package com.horizon.cms.servlets;

import com.horizon.cms.data.Article;
import com.horizon.cms.data.conn;

import java.util.List;

public class articleList {

    List<Article> articles;
    public List<Article> getArticles() {
        articles = conn.getFactory().openSession().createQuery("FROM Article", Article.class).list();
        for (Article article : articles) {
            System.out.println(article.getTitle());
        }
        return articles;
    }
}
