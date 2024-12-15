package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

public class CustomerUpdateDao {
public static String execute(String accountNumber,String name,String address,String contact,String email,String maritalStatus)
{
    String Upd = "UPDATE Customer SET name = ?,address=?,contactNumber=?,email=?,maritalStatus=? WHERE accountNumber = ?";

    try (Connection con = DatabaseConnection.getConnection()) {
        PreparedStatement ps = con.prepareStatement(Upd);
        ps.setString(1, name);
        ps.setString(2, address);
        ps.setString(3, contact);
        ps.setString(4, email);
        ps.setString(5, maritalStatus);
        ps.setString(6, accountNumber); 
        int rs = ps.executeUpdate();

        if (rs==1) {
            return "Customer Details Updated Successfully";
        }     
        else {
            return "Invalid account number";
        }
    } catch (SQLException e) {
    	// TODO Auto-generated catch block
        e.printStackTrace();
        return "Error occured while updating customer details,please try again later.";
    }
}
}



