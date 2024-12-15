package controller;

import java.io.IOException;
import java.io.PrintWriter;

import dao.WithdrawDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Status;

@WebServlet("/employee/withdraw")
public class EmployeeWithdrawController extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accountNumber = req.getParameter("accountNumber");
        Integer amount = Integer.parseInt(req.getParameter("amount"));
        Status withDrawalRequestStatus = WithdrawDao.execute(accountNumber, amount);
        req.setAttribute("status", withDrawalRequestStatus);
        req.getRequestDispatcher("/WEB-INF/pages/jsp/status.jsp").forward(req, resp);
    }
}
