<%-- 
    Document   : DeleteOutcome
    Created on : 11/05/2025, 5:06:52 PM
    Author     : kesao
--%>

<%@page import="za.ac.tut.entity.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Delete Outcome</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f4f4f4;
        }
        .container {
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            width: 60%;
            margin: 0 auto;
        }
        .message {
            padding: 10px;
            margin: 10px 0;
            border-radius: 4px;
        }
        .success {
            background-color: #dff0d8;
            color: #3c763d;
            border: 1px solid #d6e9c6;
        }
        .error {
            background-color: #f2dede;
            color: #a94442;
            border: 1px solid #ebccd1;
        }
        .book-info {
            margin: 15px 0;
            padding: 10px;
            background-color: #f9f9f9;
            border-left: 4px solid #ddd;
        }
        a.button {
            display: inline-block;
            padding: 8px 16px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin-top: 10px;
        }
        a.button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Delete Book Result</h2>
        
        <div class="message ${message.contains('successfully') ? 'success' : 'error'}">
            ${message}
        </div>
        
        <% Book deletedBook = (Book) request.getAttribute("deletedBook"); 
           if (deletedBook != null) { %>
        <div class="book-info">
            <p><strong>Deleted Book Details:</strong></p>
            <p>ID: ${deletedBook.id}</p>
            <p>Title: ${deletedBook.title}</p>
            <p>Author: ${deletedBook.author}</p>
            <p>Year: ${deletedBook.publicationYear}</p>
        </div>
        <% } %>
        
        <a href="listBooks.jsp" class="button">Back to Book List</a>
    </div>
        <div style="margin-top: 20px;">

            <a href="index.html">Back to Home</a>
        </div>
</body>
</html>
