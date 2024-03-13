<%@ page import="com.horizon.cms.data.Article" %>
<%@ page import="com.horizon.cms.data.conn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Article</title>
    <!-- Add your CSS links here -->
    <link rel="stylesheet" type="text/css" href="global.css">
</head>
<body>

<%--Get the articleId from the URL and fetch the corresponding Article object--%>
<%
    Long articleId = Long.parseLong(request.getParameter("articleId"));
//    System.out.println("Article ID: " + articleId);
    Article article = (Article) conn.getFactory().openSession().get(Article.class, articleId);
%>

<%--Display a form for editing the article details--%>
<form action="EditArticleServlet" method="post">
    <input type="hidden" name="articleId" value="<%=article.getId()%>">
    <label for="title">Title:</label><br>
    <input type="text" id="title" name="title" value="<%=article.getTitle()%>"><br>
    <label for="content">Content:</label><br>
    <textarea id="content" name="content"><%=article.getContent()%></textarea><br>
    <input type="submit" value="Submit">
</form>

</body>
</html>