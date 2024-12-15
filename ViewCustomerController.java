package controller;

import java.io.IOException;
import java.io.PrintWriter;

import dao.ReadCustomerDao;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Customer;

@WebServlet("/employee/view-customer")
public class ViewCustomerController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/pages/html/accountNumberInput.html").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accountNumber = req.getParameter("accountNumber");
        Customer customer = ReadCustomerDao.execute(accountNumber);
        PrintWriter out = resp.getWriter();
        if(customer==null){
            out.println("Some error occured while fetching customer data please, try again later");
        }
        else{
            if(customer.getAccountNumber()==null){
                out.println("Customer not found");
            }
            else{
            	req.setAttribute("accountNumber",accountNumber);
                req.setAttribute("Customer", customer);
                
                RequestDispatcher rd=req.getRequestDispatcher("/WEB-INF/pages/jsp/customerDetailsForm.jsp");
                rd.forward(req, resp);
            }
        }
    }
}
