package za.ac.tut.servlet;

import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.http.*;
import za.ac.tut.bl.BookFacadeLocal;
import za.ac.tut.entity.Book;

public class EditServlet extends HttpServlet {
    @EJB
    private BookFacadeLocal bookFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("id"));
        Book book = bookFacade.find(id);
        request.setAttribute("book", book);
        request.getRequestDispatcher("editBook.jsp").forward(request, response);
    }
}
