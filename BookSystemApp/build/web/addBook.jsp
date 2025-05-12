<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add New Book</title>
    <style>
        .form-group { margin-bottom: 15px; }
        label { display: inline-block; width: 150px; }
        input[type="text"], input[type="number"] { width: 300px; padding: 8px; }
        .action-buttons { margin-top: 20px; }
        .action-buttons a, .action-buttons input[type="submit"] {
            padding: 8px 15px;
            text-decoration: none;
            border-radius: 4px;
            margin-right: 10px;
        }
        .action-buttons input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        .action-buttons a {
            background-color: #f44336;
            color: white;
        }
    </style>
</head>
<body>
    <h1>Add New Book</h1>
    <form action="BookServlet.do" method="POST">
        <input type="hidden" name="action" value="add">
        <div class="form-group">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required>
        </div>
        <div class="form-group">
            <label for="author">Author:</label>
            <input type="text" id="author" name="author" required>
        </div>
        <div class="form-group">
            <label for="isbn">ISBN:</label>
            <input type="text" id="isbn" name="isbn" required>
        </div>
        <div class="form-group">
            <label for="publicationYear">Publication Year:</label>
            <input type="number" id="publicationYear" name="publicationYear">
        </div>
        <div class="form-group">
            <label for="publisher">Publisher:</label>
            <input type="text" id="publisher" name="publisher">
        </div>
        <div class="form-group">
            <label for="genre">Genre:</label>
            <input type="text" id="genre" name="genre">
        </div>
        <div class="form-group">
            <label for="pageCount">Page Count:</label>
            <input type="number" id="pageCount" name="pageCount">
        </div>
        <div class="form-group">
            <label for="available">Available:</label>
            <input type="checkbox" id="available" name="available" checked>
        </div>
        <div class="action-buttons">
            <input type="submit" value="Add Book">
            
        </div>
    </form>
    <div style="margin-top: 20px;">

            <a href="index.html">Back to Home</a>
        </div>
</body>
</html>