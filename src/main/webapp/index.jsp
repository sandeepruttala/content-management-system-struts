<%@ page import="com.horizon.cms.servlets.articleList" %>
<%@ page import="com.horizon.cms.data.Article" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>News Website</title>
    <link rel="stylesheet" type="text/css" href="global.css">
    <!-- Add your CSS links here -->
</head>
<body>

<div>
    <% if (session.getAttribute("username") != null) { %>
    <a href="newArticle.jsp">New Article</a>
    <% } %>
    <a href="login.jsp">Author/Admin Login</a>
    <% if (session.getAttribute("username") != null) { %>
    <a href="LogoutServlet">Logout</a>
    <% } %>
</div>

<br>

<h1>Latest News</h1>

<%--Get the articles from the articleList class and set it in the page scope--%>
<%
    articleList al = new articleList();
    List<Article> articles = al.getArticles();
    for(Article article : articles) {
%>
<div class="article-preview">
    <h2><a href="articleDetails.jsp?articleId=<%=article.getId()%>"><%=article.getTitle()%></a></h2>
    <p>Published by <%=article.getAuthor()%> on <fmt:formatDate value="<%=article.getPublicationDate()%>" pattern="dd/MM/yyyy"/></p>
    <p><%=article.getContent()%></p>
</div>
<%
    }
%>
</body>
</html>