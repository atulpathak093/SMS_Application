<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="SMS_Application.ForgetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forget Password</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to bottom right, #e0f7fa, #ffffff);
            margin: 0;
            padding: 0;
        }

        .form-container {
            margin: 80px auto;
            background: #ffffff;
            padding: 40px 50px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            max-width: 400px;
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

        .btn-submit {
            padding: 8px 20px;
            border: none;
            border-radius: 6px;
            background-color: #28a745;
            color: white;
            cursor: pointer;
        }

        .btn-submit:hover {
            background-color: #218838;
        }

        .title {
            text-align: center;
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #444;
        }

        .message-label {
            color: red;
            text-align: center;
            display: block;
            margin-top: 10px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <div class="title">Reset Your Password</div>
            <table>
                <tr>
                    <td>Mobile Number</td>
                    <td>
                        <asp:TextBox ID="txtPersonMobile" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>New Password</td>
                    <td>
                        <asp:TextBox ID="txtPersonNewPassword" runat="server" TextMode="Password" />
                    </td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                    <td>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center;">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn-submit" OnClick="btnSubmit_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblMsg" runat="server" CssClass="message-label" />
                        <asp:Label ID="lblMobile" runat="server" CssClass="message-label" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>