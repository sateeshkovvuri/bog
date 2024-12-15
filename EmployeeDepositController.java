package controller;

import java.io.IOException;
import java.io.PrintWriter;

import dao.DepositDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/employee/deposit")
public class EmployeeDepositController extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accountNumber = req.getParameter("accountNumber");
        Integer amount = Integer.parseInt(req.getParameter("amount"));
        String depositRequestStatus = DepositDao.execute(accountNumber, amount);
        PrintWriter out = resp.getWriter();
        out.println(depositRequestStatus);
    }
}
