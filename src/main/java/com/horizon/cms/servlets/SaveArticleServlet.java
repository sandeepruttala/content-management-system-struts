package com.horizon.cms.servlets;

import com.horizon.cms.data.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/SaveArticleServlet")
public class SaveArticleServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        Long categoryId = Long.parseLong(request.getParameter("category"));
        HttpSession session = request.getSession();
        String author = (String) session.getAttribute("username");

        if(author==null){
            response.sendRedirect("login.jsp");
            return;
        }

        Category category = new Query().getCategoryById(categoryId);

        Article article = new Article();
        article.setTitle(title);
        article.setContent(content);
        article.setCategory(category.getName());
        article.setAuthor(author);
        article.setPublicationDate(new java.util.Date());
        boolean isSaved = new Persist().save(article);
        System.out.println("Article saved: " + isSaved+ " for title: " + title + " and content: " + content + " and category: " + category.getName() + " and author: " + author + " and publication date: " + article.getPublicationDate());
        if (isSaved) {
            response.sendRedirect("index.jsp");
        } else {
            request.setAttribute("errorMessage", "Failed to save the article. Please try again.");
            request.getRequestDispatcher("newArticle.jsp").forward(request, response);
        }
    }
}


