<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Details</title>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');
    body {
        font-family: "Poppins", sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }

    h1 {
        text-align: center;
        color: white;
        background-color: #0058A0;
        padding: 15px 0;
        margin: 0;
        font-size: 2.5rem;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
    }

    #details {
        width: 85%;
        max-width: 1200px;
        margin: 20px auto;
        background: white;
        padding: 30px;
        margin-bottom:350px;
        border-radius: 10px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    }

    h3 {
        text-align: center;
        font-size: 1.8rem;
        margin-bottom: 30px;
        color: #0058A0;
    }

    .form-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 20px;
    }

    .detail-item {
        display: flex;
        flex-direction: column;
    }

    label {
        font-size: 1rem;
        margin-bottom: 8px;
        font-weight: bold;
        color: #333;
    }

    input, p {
        padding: 12px;
        font-size: 1rem;
        border: 1px solid #ccc;
        border-radius: 8px;
        transition: 0.3s;
    }

    input:focus {
        border-color: #0058A0;
        box-shadow: 0 0 8px rgba(0, 88, 160, 0.3);
        outline: none;
    }

    p {
        background: #f9f9f9;
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 10px;
        margin: 0;
    }

    .buttons {
        display: flex;
        justify-content: center;
        margin-top: 30px;
    }

    button {
        background-color: #0058A0;
        color: white;
        padding: 12px 20px;
        font-size: 1rem;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        margin: 0 10px;
        transition: 0.3s;
    }

    button:hover {
        background-color: #003d70;
    }

    button.delete {
        background-color: #FF4D4D;
    }

    button.delete:hover {
        background-color: #CC0000;
    }
    #footer{
        position:fixed;
        bottom:0px;
        text-align:center;
        background-color: #0058A0;
        width:100%;
        color:white;
        padding:3px;
    }
    @media (max-width: 768px) {
        .form-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
</head>
<body>
    <h1>Bank of Gachibowli</h1>

    <div id="details">
        <form action="" method="post" id="customerform">
            <h3>Customer Information</h3>

            <div class="form-grid">
                <!-- Non-editable fields -->
                <div class="detail-item">
                    <label>Account Number</label>
                    <input type="text" value="<%= ((model.Customer) request.getAttribute("Customer")).getAccountNumber() %>" name="accountNumber" readonly>
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
                    <input readonly type="text" name="balance" value="<%= ((model.Customer) request.getAttribute("Customer")).getBalance() %>" placeholder="Enter Balance">
                </div>
                <div class="detail-item">
                    <label>Overdraft</label>
                    <input readonly type="text" name="overdraft" value="<%= ((model.Customer) request.getAttribute("Customer")).getOverdraft() %>" placeholder="Enter Overdraft">
                </div>
                <div class="detail-item">
                    <label>Account Type</label>
                    <input id="accountType" readonly type="text" name="accountType" value="<%= ((model.Customer) request.getAttribute("Customer")).getAccountType() %>" placeholder="Enter Account Type">
                </div>
                <div class="detail-item">
                    <label>Gender</label>
                    <input readonly type="text" name="gender" value="<%= ((model.Customer) request.getAttribute("Customer")).getGender() %>" placeholder="Enter Gender">
                </div>
                <div class="detail-item">
                    <label>Date of Birth</label>
                    <input readonly type="date" name="dob" value="<%= ((model.Customer) request.getAttribute("Customer")).getDob() %>">
                </div>
                <div class="detail-item">
                    <label>Marital Status</label>
                    <input type="text" name="maritalStatus" value="<%= ((model.Customer) request.getAttribute("Customer")).getMaritalStatus() %>" placeholder="Enter Marital Status">
                </div>
            </div>

            <!-- Buttons -->
            <div class="buttons">
                <button type="button" id="update">Update</button>
                <button type="button" class="delete" id="delete">Delete</button>
            </div>
        </form>
    </div>
    <div id='footer'>@ILP</div>
</body>
<script>
    const form = document.getElementById("customerform");
    const deleteBtn = document.getElementById("delete");
    const updateBtn = document.getElementById("update");
	let type = document.getElementById("accountType");
	if(type.value == "1"){
		type.value = "current"
	}
	if(type.value == "0"){
		type.value = "savings"
	}
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