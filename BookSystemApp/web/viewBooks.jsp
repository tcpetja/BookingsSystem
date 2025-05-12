<%@page import="java.util.List"%>
<%@page import="za.ac.tut.entity.Book"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>View Books</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 30px;
        }

        h2 {
            color: #333;
            text-align: center;
        }

        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        form {
            display: inline;
        }

        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 6px 12px;
            cursor: pointer;
            border-radius: 4px;
            margin-right: 5px;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        a {
            display: block;
            width: fit-content;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            text-align: center;
        }

        a:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <h2>Books Available</h2>
    <table border="1" cellpadding="10">
        <tr>
            <th>ID</th><th>Title</th><th>Author</th><th>Year</th><th>Actions</th>
        </tr>
        <%
            List<Book> books = (List<Book>) request.getAttribute("bookList");
            for (Book book : books) {
        %>
        <tr>
            <td><%= book.getId() %></td>
            <td><%= book.getTitle() %></td>
            <td><%= book.getAuthor() %></td>
            <td><%= book.getPublicationYear() %></td>
            <td>
                <form action="EditServlet.do" method="post">
                    <input type="hidden" name="id" value="<%= book.getId() %>">
                    <input type="submit" value="Edit">
                </form>
                <form action="DeleteBookServlet.do" method="post">
                    <input type="hidden" name="id" value="<%= book.getId() %>">
                    <input type="submit" value="Delete" onclick="return confirm('Are you sure?');">
                </form>
            </td>
        </tr>
        <% } %>
    </table>
    <div>
        <a href="index.html">Back to Home</a>
    </div>
</body>
</html>
