package za.ac.tut.servlet;

import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.bl.BookFacadeLocal;
import za.ac.tut.entity.Book;

public class ViewServlet extends HttpServlet {
    
    @EJB
    private BookFacadeLocal bookFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Use EJB to fetch books
        List<Book> bookList = bookFacade.findAll(); // Assuming findAll() is implemented

        request.setAttribute("bookList", bookList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewBooks.jsp");
        dispatcher.forward(request, response);
    }
}
