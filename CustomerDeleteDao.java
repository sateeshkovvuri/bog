package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerDeleteDao {
	public static String deletecustomer(String accountNumber)
	{
		try(Connection con = DatabaseConnection.getConnection())
		{
			String sql1="select accountNumber from Customer where accountNumber=?";
            PreparedStatement st=con.prepareStatement(sql1);
            st.setString(1, accountNumber);
            ResultSet rs=st.executeQuery();
            if(!rs.next())
            {
            	return "Account number not found";
            }
			String sql = "Delete from Customer where accountNumber=?";
            st = con.prepareStatement(sql);
            st.setString(1, accountNumber);
            int res=st.executeUpdate();
            if(res>0)
            {
            	return "Customer deleted successfull";
            }
            else
            {
            	return "Deletion Unsuccess";
            }
		}
		catch(SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return null;
        }
	}

}
