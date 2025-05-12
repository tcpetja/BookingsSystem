<%@page import="za.ac.tut.entity.Book"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    Book book = (Book) request.getAttribute("book");
%>

<html>
<head>
    <title>Edit Book</title>
</head>
<body>
    <h2>Edit Book</h2>
    <form action="UpdateBookServlet.do" method="post">
        <input type="hidden" name="id" value="<%= book.getId() %>">
        Title: <input type="text" name="title" value="<%= book.getTitle() %>"><br><br>
        Author: <input type="text" name="author" value="<%= book.getAuthor() %>"><br><br>
        Year: <input type="text" name="year" value="<%= book.getPublicationYear() %>"><br><br>
        <input type="submit" value="Update Book">
    </form>
        <div style="margin-top: 20px;">

            <a href="index.html">Back to Home</a>
        </div>
</body>
</html>
