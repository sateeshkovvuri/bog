package controller;
import java.io.IOException;
import java.io.PrintWriter;
import dao.CustomerUpdateDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/employee/customer-update")
public class CustomerUpdateController extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accountNumber = req.getParameter("accountNumber");
        String name  = req.getParameter("name");
        String address = req.getParameter("address");
        String contact = req.getParameter("contactNumber");
        String email = req.getParameter("email");
        String maritalStatus = req.getParameter("maritalStatus");
        String res =CustomerUpdateDao.execute(accountNumber,name,address,contact,email,maritalStatus);
        PrintWriter out = resp.getWriter();
        out.println(res);
    }
}



