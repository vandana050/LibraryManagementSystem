<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Library Management System- Add Book</title>
</head>
<body>

<h2>Add New Book</h2>
<form action="Book" method="POST">
    <label>Book Name: <input type="text" name="bookName" required></label><br><br>
    <label>Author Name: <input type="text" name="authorName" required></label><br><br>
    <label>Category: <input type="text" name="category" required></label><br><br>
    <input type="hidden" name="action" value="add">
    <input type="submit" value="Add Book">
</form>
<br/>
<a href="books.jsp">Back to Book List</a>

</body>
</html>
