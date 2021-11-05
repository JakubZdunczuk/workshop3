package pl.coderslab.servlet;

import pl.coderslab.entity.User;
import pl.coderslab.entity.UserDao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditServlet", value = "/edit")
public class EditServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email= request.getParameter("email");
        User user = UserDao.read(email);
        request.setAttribute("user",user);
        request.getRequestDispatcher("/users/edit.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _id= request.getParameter("id");
        String username= request.getParameter("username");
        String email= request.getParameter("email");
        String password = request.getParameter("password");
        int id=Integer.parseInt(_id);

        User user=new User();
        user.setId(id);
        user.setEmail(email);
        user.setUsername(username);
        user.setPassword(password);
        UserDao.update(user);
        request.getRequestDispatcher("/users/confirm.jsp").forward(request,response);
    }
}
