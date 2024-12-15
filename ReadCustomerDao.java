package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Customer;

public class ReadCustomerDao {
    public static Customer execute(String accountNumber){
         try (Connection con = DatabaseConnection.getConnection()) {
            String sql = "select address,ssn,aadhar,pan,name,balance,contactNumber,email,overdraft,accountType,dob,maritalStatus,gender from Customer where accountNumber = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, accountNumber);
            ResultSet set = st.executeQuery();
            if(set.next()){
                String address = set.getString(1);
                String ssn = set.getString(2);
                String aadhar = set.getString(3);
                String pan = set.getString(4);
                String name = set.getString(5);
                int balance = set.getInt(6);
                String contactNumber = set.getString(7);
                String email = set.getString(8);
                int overdraft = set.getInt(9);
                int accountType = set.getInt(10);
                String dob = set.getString(11);
                String maritalStatus = set.getString(12);
                String gender = set.getString(13);
                Customer customer = new Customer(name, address, email, contactNumber, aadhar, pan, ssn, balance, accountNumber, overdraft, accountType, gender, dob, maritalStatus);
                return customer;
            }
            else{
                return new Customer();
            }
            //return set.getInt(1)==1;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }
    }
}
