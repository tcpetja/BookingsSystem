package za.ac.tut.servlet;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.http.*;
import za.ac.tut.bl.BookFacadeLocal;
import za.ac.tut.entity.Book;

public class UpdateBookServlet extends HttpServlet {
    @EJB
    private BookFacadeLocal bookFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        int year = Integer.parseInt(request.getParameter("year"));

        Book book = bookFacade.find(id);
        book.setTitle(title);
        book.setAuthor(author);
        book.setPublicationYear(year);

        bookFacade.edit(book);
        response.sendRedirect("FetchBooksServlet.do");
    }
}