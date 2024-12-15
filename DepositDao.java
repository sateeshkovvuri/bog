package dao;

import java.util.HashMap;
import model.AccountAttributes;
import model.Transaction;

public class DepositDao {
    public static String execute(String accountNumber,int amount){
        HashMap<String,Integer> map = AccountOperations.getAccountAttributes(accountNumber);
        if(map==null){
            return "Invalid account number";
        }
        else{
            int balance = map.get("balance") + amount;
            int overdraft = map.get("overdraft");
            
            try{
                AccountAttributes updatedAttributes = new AccountAttributes(accountNumber, balance, overdraft);
                AccountOperations.updateAccountAttributes(updatedAttributes);
                Transaction transaction = new Transaction(accountNumber,null,amount);
                TransactionDao.execute(transaction);
                return "Deposit successful";
            }
            catch(Exception e){
                return "Some error occured while depositing. please try again later.";
            }
        }
    }
}
