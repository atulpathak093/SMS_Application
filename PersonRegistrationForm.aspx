<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonRegistrationForm.aspx.cs" Inherits="SMS_Application.PersonRegistrationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Person Registration - StockManagementSystem</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .form-container {
            margin: 50px auto;
            background: #ffffff;
            padding: 40px 50px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            max-width: 500px;
        }

        .logo-container {
            text-align: center;
            margin-bottom: 20px;
        }

        .logo-container img {
            height: 60px;
            margin-bottom: 10px;
        }

        .app-name {
            font-size: 24px;
            font-weight: bold;
            color: #007bff;
        }

        .title {
            text-align: center;
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 25px;
            color: #444;
        }

        table {
            width: 100%;
        }

        td {
            padding: 12px 8px;
            font-size: 15px;
            color: #333333;
        }

        input[type="text"],
        input[type="password"],
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #cccccc;
            border-radius: 6px;
            font-size: 14px;
        }

        .btn-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .btn-container asp\:button {
            padding: 8px 20px;
            border: none;
            border-radius: 6px;
            background-color: #007bff;
            color: white;
            cursor: pointer;
        }

        .btn-container asp\:button:hover {
            background-color: #0056b3;
        }

        #<%= lbl.ClientID %> {
            color: green;
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <div class="logo-container">
               <div class="title">
                    <img src="Images/logo.png" 
                         alt="Stock Management System Logo"
                         style="height: 180px; width: 180px; border-radius: 50%; object-fit: cover; margin-bottom: 10px;" />
                    <div style="margin-top: 10px;"></div>
               </div>
            </div>
            <div class="title">Person Registration Form</div>
            <table>
                <tr>
                    <td>Person Name</td>
                    <td><asp:TextBox ID="txtPersonName" runat="server" /></td>
                </tr>
                <tr>
                    <td>Person Email</td>
                    <td><asp:TextBox ID="txtPersonEmail" runat="server" /></td>
                </tr>
                <tr>
                    <td>Person Password</td>
                    <td><asp:TextBox ID="txtPersonpassword" runat="server" TextMode="Password" /></td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                    <td><asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" /></td>
                </tr>
                <tr>
                    <td>Person Mobile</td>
                    <td><asp:TextBox ID="txtPersonMobile" runat="server" /></td>
                </tr>
                <tr>
                    <td>Person Role</td>
                    <td><asp:DropDownList ID="ddlRole" runat="server" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="btn-container">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn" OnClick="btnSubmit_Click" />
                            <asp:Label ID="lbl" runat="server" />
                            <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn" OnClick="btnReset_Click" />
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>