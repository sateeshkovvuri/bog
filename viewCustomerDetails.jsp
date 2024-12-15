<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Details</title>

<style>
    body {
        font-family: "Poppins", sans-serif;
    }
    h1 {
        text-align: center;
        color: white;
        background-color: #0058A0;
        padding: 20px 0;
    }
    #details {
        width: 70%;
        margin: auto;
        background-color: whitesmoke;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0px 0px 6px 1px rgba(0, 0, 0, 0.2);
    }
    .detail-item {
        margin: 10px 0;
    }
    label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }
    input, select {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        box-sizing: border-box;
    }
    .buttons {
        display: flex;
        gap: 10px;
    }
    button {
        background-color: #0058A0;
        color: white;
        border: none;
        padding: 10px 15px;
        cursor: pointer;
        border-radius: 5px;
        flex: 1;
    }
    button:hover {
        background-color: #003d70;
    }
    button.delete {
        background-color: red;
    }
    button.delete:hover {
        background-color: darkred;
    }
    #logout {
        font-size: small;
        text-align: right;
        margin: 0px 30px;
        cursor: pointer;
        text-decoration: underline;
    }
    #footer {
        position: fixed;
        bottom: 0;
        text-align: center;
        background-color: #0058A0;
        width: 100%;
        color: white;
        padding: 3px;
    }
</style>
</head>
<body>
    <h1>Bank of Gachibowli <div id="logout">Logout</div></h1>

    <div id="details">
        <form action="" method="post" id="customerform">
            <h3>Customer Information</h3>

            <!-- Non-editable fields -->
            <div class="detail-item">
                <label>Account Number</label>
                <input value="<%= ((model.Customer) request.getAttribute("Customer")).getAccountNumber() %>" name="accountNumber" readonly>
            </div>
            <div class="detail-item">
                <label>SSN</label>
                <p><%= ((model.Customer) request.getAttribute("Customer")).getSsn() %></p>
            </div>
            <div class="detail-item">
                <label>Aadhar</label>
                <p><%= ((model.Customer) request.getAttribute("Customer")).getAadhar() %></p>
            </div>
            <div class="detail-item">
                <label>PAN</label>
                <p><%= ((model.Customer) request.getAttribute("Customer")).getPan() %></p>
            </div>

            <!-- Editable fields -->
            <div class="detail-item">
                <label>Name</label>
                <input type="text" name="name" value="<%= ((model.Customer) request.getAttribute("Customer")).getName() %>" placeholder="Enter Name">
            </div>
            <div class="detail-item">
                <label>Address</label>
                <input type="text" name="address" value="<%= ((model.Customer) request.getAttribute("Customer")).getAddress() %>" placeholder="Enter Address">
            </div>
            <div class="detail-item">
                <label>Email</label>
                <input type="email" name="email" value="<%= ((model.Customer) request.getAttribute("Customer")).getEmail() %>" placeholder="Enter Email">
            </div>
            <div class="detail-item">
                <label>Contact Number</label>
                <input type="text" name="contactNumber" value="<%= ((model.Customer) request.getAttribute("Customer")).getContactNumber() %>" placeholder="Enter Contact Number">
            </div>
            <div class="detail-item">
                <label>Balance</label>
                <input type="text" name="balance" value="<%= ((model.Customer) request.getAttribute("Customer")).getBalance() %>" placeholder="Enter Balance">
            </div>
            <div class="detail-item">
                <label>Overdraft</label>
                <input type="text" name="overdraft" value="<%= ((model.Customer) request.getAttribute("Customer")).getOverdraft() %>" placeholder="Enter Overdraft">
            </div>
            <div class="detail-item">
                <label>Account Type</label>
                <input type="text" name="accountType" value="<%= ((model.Customer) request.getAttribute("Customer")).getAccountType() %>" placeholder="Enter Account Type">
            </div>
            <div class="detail-item">
                <label>Gender</label>
                <input type="text" name="gender" value="<%= ((model.Customer) request.getAttribute("Customer")).getGender() %>" placeholder="Enter Gender">
            </div>
            <div class="detail-item">
                <label>Date of Birth</label>
                <input type="date" name="dob" value="<%= ((model.Customer) request.getAttribute("Customer")).getDob() %>" placeholder="Enter Date of Birth">
            </div>
<div class="detail-item">
                <label>Marital Status</label>
                <input type="text" name="maritalStatus" value="<%= ((model.Customer) request.getAttribute("Customer")).getMaritalStatus() %>" placeholder="Enter Marital Status">
            </div>

            <!-- Buttons -->
            <div class="buttons">
                <button type="button" id="update">Update</button>
                <button type="button" class="delete" id="delete">Delete</button>
            </div>
        </form>
    </div>

    <div id="footer">@ILP</div>
</body>
<script>
    const form = document.getElementById("customerform");
    const deleteBtn = document.getElementById("delete");
    const updateBtn = document.getElementById("update");

    deleteBtn.addEventListener("click", function () {
        form.action = "/bog/employee/customer-delete";
        form.submit();
    });

    updateBtn.addEventListener("click", function () {
        form.action = "/bog/employee/customer-update";
        form.submit();
    });
</script>
</html>
