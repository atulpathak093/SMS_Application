<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BillingInProgress.aspx.cs" Inherits="SMS_Application.BillingInProgress" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Billing In Progress</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #e3f2fd, #ffffff);
            margin: 0;
            padding: 0;
        }

        .billing-container {
            margin: 60px auto;
            padding: 40px;
            background-color: #ffffff;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            width: 90%;
            max-width: 600px;
        }

        table {
            width: 100%;
        }

        td {
            padding: 12px 10px;
            font-size: 14px;
            color: #333;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .btn {
            padding: 10px 18px;
            margin-right: 8px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .form-title {
            font-size: 20px;
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
            color: #006699;
        }

        .label-msg {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="billing-container">
            <div class="form-title">Billing In Progress</div>
            <table>
                <tr>
                    <td>Customer Mobile</td>
                    <td>
                        <asp:TextBox ID="txtCustomerMobile" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Customer Name</td>
                    <td>
                        <asp:TextBox ID="txtCustomerName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnCustomerDetails" runat="server" Text="Get Customer Details" CssClass="btn" OnClick="btnCustomerDetails_Click" />
                        <asp:Button ID="btnProceed" runat="server" Text="Proceed" CssClass="btn" OnClick="btnProceed_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lbl" runat="server" CssClass="label-msg"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
