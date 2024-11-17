<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Library Management System- Book Inventory</title>
</head>
<body>

<h2> Book Inventory</h2>
<table border="1" width="100%">
    <thead>
        <tr>
            <th>Book ID</th>
            <th>Book Name</th>
            <th>Author Name</th>
            <th>Category</th>
        </tr>
    </thead>
    <tbody>
        <%
            ResultSet bookList = (ResultSet) request.getAttribute("bookList");
            while (bookList != null && bookList.next()) {
        %>
        <tr>
            <td><%= bookList.getInt("BookId") %></td>
            <td><%= bookList.getString("BookName") %></td>
            <td><%= bookList.getString("AuthorName") %></td>
            <td><%= bookList.getString("Category") %></td>
            <td>
                <form action="Book" method="POST">
                    <input type="hidden" name="bookId" value="<%= bookList.getInt("BookId") %>">
                    <input type="hidden" name="action" value="delete">
                    <input type="submit" value="Delete">
                </form>
            </td>
        </tr>
        <%
            }
        %>
    </tbody>
</table>
<h3>Add a New Book</h3>
<form action="Book" method="POST">
    <label>Book Name: <input type="text" name="bookName" required></label><br><br>
    <label>Author Name: <input type="text" name="authorName" required></label><br><br>
    <label>Category: <input type="text" name="category" required></label><br><br>
    <input type="hidden" name="action" value="add">
    <input type="submit" value="Add Book">
</form>

<h3>Update a Book</h3>
<form action="Book" method="POST">
    <label>Book ID: <input type="number" name="bookId" required></label><br><br>
    <label>New Book Name: <input type="text" name="bookName" required></label><br><br>
    <label>New Author Name: <input type="text" name="authorName" required></label><br><br>
    <label>New Category: <input type="text" name="category" required></label><br><br>
    <input type="hidden" name="action" value="update">
    <input type="submit" value="Update Book">
</form>

</body>
</html>