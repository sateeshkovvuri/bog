package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import model.AccountAttributes;
import model.Status;
import model.Transaction;

public class WithdrawDao {
    public static Status execute(String accountNumber, int amount){
        HashMap<String,Integer> map = AccountOperations.getAccountAttributes(accountNumber);
        if(map==null){
            return new Status("Invalid account number", true);
        }
        else{
            int balance = map.get("balance");
            int overdraft = map.get("overdraft");
            if(balance>=amount){
                balance-=amount;
            }
            else{
                if(map.get("accountType")==1){
                    //if current account
                    int extraRequired = amount-balance;
                    if(overdraft>=extraRequired){
                        overdraft-=extraRequired;
                        balance = 0;
                    }
                    else{
                        return new Status("Insufficient balance and overdraft", true);
                    }
                }
                else{
                    //if savings account
                    return new Status("Insufficient balance", true);
                }
            }
            try{
                AccountAttributes updatedAttributes = new AccountAttributes(accountNumber, balance, overdraft);
                AccountOperations.updateAccountAttributes(updatedAttributes);
                Transaction transaction = new Transaction(null,accountNumber,amount);
                TransactionDao.execute(transaction);
                return new Status("Withdrawal successful", false);
            }
            catch(Exception e){
                System.out.println(e);
                return new Status("Some error occured while withdrawing. please try again later.", true);
            }
        }
    }
}
