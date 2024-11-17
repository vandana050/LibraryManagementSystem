<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Library Management System- Edit Book</title>
</head>
<body>
<h2>Edit Book Details</h2>

<% 
    String bookId = request.getParameter("bookId");
    String bookName = request.getParameter("bookName");
    String authorName = request.getParameter("authorName");
    String category = request.getParameter("category");
%>

<form action="Book" method="POST">
    <label>Book ID: <input type="text" name="bookId" value="<%= bookId %>" readonly></label><br><br>
    <label>Book Name: <input type="text" name="bookName" value="<%= bookName %>" required></label><br><br>
    <label>Author Name: <input type="text" name="authorName" value="<%= authorName %>" required></label><br><br>
    <label>Category: <input type="text" name="category" value="<%= category %>" required></label><br><br>
    <input type="hidden" name="action" value="edit">
    <input type="submit" value="Update Book">
</form>
<br/>    
<a href="books.jsp">Back to Book List</a>

</body>
</html>