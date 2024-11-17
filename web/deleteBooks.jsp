
<%-- 
    Document   : delete
    Created on : 3 Nov, 2024, 6:28:27 PM
    Author     : vaishnavi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="delete" method="DELETE">
            <h3>Enter the Book id ,for deleted Book-Data from the database</h3>
            id:<input type="number" name="bookid"><br>
            <input type="submit" value="submit">
        </form>
        
    </body>
</html>