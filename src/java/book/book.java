import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Asus
 */

@WebServlet("/Book")
public class Book extends HttpServlet {
    private Connection conn;

    @Override
    public void init() throws ServletException {
        try {
            String url = "jdbc:mysql://localhost:3306/library";
            String uname = "root";
            String pwd = "";
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, uname, pwd);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void destroy() {
        try {
            if (conn != null && !conn.isClosed()) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM books");

            request.setAttribute("bookList", rs);
            request.getRequestDispatcher("books.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            addBook(request, response);
        } else if ("update".equals(action)) {
            updateBook(request, response);
        } else if ("delete".equals(action)) {
            deleteBook(request, response);
        }
    }

    private void addBook(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String bookName = request.getParameter("bookName");
            String authorName = request.getParameter("authorName");
            String category = request.getParameter("category");

            String insertSQL = "INSERT INTO books (BookName, AuthorName, Category) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(insertSQL);
            ps.setString(1, bookName);
            ps.setString(2, authorName);
            ps.setString(3, category);
            ps.executeUpdate();

            response.sendRedirect("Book"); 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void updateBook(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int bookId = Integer.parseInt(request.getParameter("bookId"));
            String bookName = request.getParameter("bookName");
            String authorName = request.getParameter("authorName");
            String category = request.getParameter("category");

            String updateSQL = "UPDATE books SET BookName = ?, AuthorName = ?, Category = ? WHERE BookId = ?";
            PreparedStatement ps = conn.prepareStatement(updateSQL);
            ps.setString(1, bookName);
            ps.setString(2, authorName);
            ps.setString(3, category);
            ps.setInt(4, bookId);
            ps.executeUpdate();

            response.sendRedirect("Book"); 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int bookId = Integer.parseInt(request.getParameter("bookId"));

            String deleteSQL = "DELETE FROM books WHERE BookId = ?";
            PreparedStatement ps = conn.prepareStatement(deleteSQL);
            ps.setInt(1, bookId);
            ps.executeUpdate();
            response.sendRedirect("Book");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}