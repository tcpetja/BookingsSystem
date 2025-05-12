package za.ac.tut.servlet;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.bl.BookFacadeLocal;
import za.ac.tut.entity.Book;

public class DeleteBookServlet extends HttpServlet {
    @EJB
    private BookFacadeLocal bookFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Long id = Long.parseLong(request.getParameter("id"));
            Book book = bookFacade.find(id);
            
            if (book != null) {
                bookFacade.remove(book);
                request.setAttribute("message", "Book deleted successfully");
                request.setAttribute("deletedBook", book);
            } else {
                request.setAttribute("message", "Book not found");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("message", "Invalid book ID");
        } catch (Exception e) {
            request.setAttribute("message", "Error deleting book: " + e.getMessage());
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("DeleteOutcome.jsp");
        dispatcher.forward(request, response);
    }
}