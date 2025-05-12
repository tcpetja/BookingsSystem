package za.ac.tut.servlet;

import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.http.*;
import za.ac.tut.bl.BookFacadeLocal;
import za.ac.tut.entity.Book;

public class FetchBooksServlet extends HttpServlet {
    @EJB
    private BookFacadeLocal bookFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        List<Book> bookList = bookFacade.findAll();
        request.setAttribute("bookList", bookList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("NewList.jsp");
        dispatcher.forward(request, response);
    }
}