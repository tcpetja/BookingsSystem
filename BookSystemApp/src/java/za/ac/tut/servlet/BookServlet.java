package za.ac.tut.servlet;

import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.bl.BookFacadeLocal;
import za.ac.tut.entity.Book;

public class BookServlet extends HttpServlet {

    @EJB
    private BookFacadeLocal bookFacade;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if (action == null) {
            action = "list";
        }
        
        switch (action) {
            case "add":
                addBook(request, response);
                break;
            case "edit":
                editBook(request, response);
                break;
            case "update":
                updateBook(request, response);
                break;
            case "delete":
                deleteBook(request, response);
                break;
            case "view":
                viewBook(request, response);
                break;
            default:
                listBooks(request, response);
        }
    }

    private void listBooks(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Book> books = bookFacade.findAll();
        request.setAttribute("books", books);
        request.getRequestDispatcher("listBooks.jsp").forward(request, response);
    }

    private void addBook(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("addBook.jsp").forward(request, response);
    }

    private void editBook(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Book book = bookFacade.find(id);
        request.setAttribute("book", book);
        request.getRequestDispatcher("editBook.jsp").forward(request, response);
    }

    private void updateBook(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Long id = Long.parseLong(request.getParameter("id"));
            Book book = bookFacade.find(id);
            
            book.setTitle(request.getParameter("title"));
            book.setAuthor(request.getParameter("author"));
            book.setIsbn(request.getParameter("isbn"));
            book.setPublicationYear(Integer.parseInt(request.getParameter("publicationYear")));
            book.setPublisher(request.getParameter("publisher"));
            book.setGenre(request.getParameter("genre"));
            book.setPageCount(Integer.parseInt(request.getParameter("pageCount")));
            book.setAvailable(Boolean.parseBoolean(request.getParameter("available")));
            
            bookFacade.edit(book);
            request.setAttribute("message", "Book updated successfully!");
            request.setAttribute("messageType", "success");
        } catch (Exception e) {
            request.setAttribute("message", "Error updating book: " + e.getMessage());
            request.setAttribute("messageType", "error");
        }
        listBooks(request, response);
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Long id = Long.parseLong(request.getParameter("id"));
            Book book = bookFacade.find(id);
            bookFacade.remove(book);
            request.setAttribute("message", "Book deleted successfully!");
            request.setAttribute("messageType", "success");
        } catch (Exception e) {
            request.setAttribute("message", "Error deleting book: " + e.getMessage());
            request.setAttribute("messageType", "error");
        }
        listBooks(request, response);
    }

    private void viewBook(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Book book = bookFacade.find(id);
        request.setAttribute("book", book);
        request.getRequestDispatcher("viewBook.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Book book = new Book();
            book.setTitle(request.getParameter("title"));
            book.setAuthor(request.getParameter("author"));
            book.setIsbn(request.getParameter("isbn"));
            book.setPublicationYear(Integer.parseInt(request.getParameter("publicationYear")));
            book.setPublisher(request.getParameter("publisher"));
            book.setGenre(request.getParameter("genre"));
            book.setPageCount(Integer.parseInt(request.getParameter("pageCount")));
            book.setAvailable(request.getParameter("available") != null);
            
            bookFacade.create(book);
            request.setAttribute("message", "Book added successfully!");
            request.setAttribute("messageType", "success");
        } catch (Exception e) {
            request.setAttribute("message", "Error adding book: " + e.getMessage());
            request.setAttribute("messageType", "error");
        }
        
        // Redirect back to the list with a success message
        listBooks(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Book Management Servlet";
    }
}