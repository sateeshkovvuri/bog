package controller;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.CustomerDeleteDao;
@WebServlet("/employee/customer-delete")
public class CustomerDeleteController extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accountNumber = req.getParameter("accountNumber");
        String res =CustomerDeleteDao.deletecustomer(accountNumber);
        PrintWriter out = resp.getWriter();
        out.println(res);
    }
}



