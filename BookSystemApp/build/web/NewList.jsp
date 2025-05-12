<%@page import="java.util.List"%>
<%@page import="za.ac.tut.entity.Book"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Updated Book List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f4f4f4;
        }
        h2 {
            color: #333;
        }
        table {
            border-collapse: collapse;
            width: 90%;
            margin-top: 20px;
            background-color: #fff;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        a.button {
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        a.button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <h2>Updated Book List</h2>

    <%
        List<Book> books = (List<Book>) application.getAttribute("bookList");
        if (books == null || books.isEmpty()) {
    %>
        <p>The book has been successfully been update</p>
    <%
        } else {
    %>
        <table>
            <tr>
                <th>ID</th><th>Title</th><th>Author</th><th>Year</th>
            </tr>
            <%
                for (Book book : books) {
            %>
            <tr>
                <td><%= book.getId() %></td>
                <td><%= book.getTitle() %></td>
                <td><%= book.getAuthor() %></td>
                <td><%= book.getPublicationYear() %></td>
            </tr>
            <% } %>
        </table>
    <%
        }
    %>

    <br>
    <a href="index.html" class="button">Back to Home</a>
<div style="margin-top: 20px;">

            <a href="index.html">Back to Home</a>
        </div>
</body>
</html>
