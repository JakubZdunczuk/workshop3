package pl.coderslab.servlet;

import pl.coderslab.entity.User;
import pl.coderslab.entity.UserDao;
import pl.coderslab.utils.DbUtil;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet(name = "ServletTest", value = "/ServletTest")
public class ServletTest extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html;charset-utf-8");
        try (Statement statement = DbUtil.getConnection().createStatement()) {
            User[] all = UserDao.findAll();
            for (User u : all) {
                response.getWriter().append(u.getId() + " " + u.getEmail()+"<br>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
