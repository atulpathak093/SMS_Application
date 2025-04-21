<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="SMS_Application.SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign In</title>
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

        .btn-container {
            display: flex;
            gap: 10px;
            justify-content: flex-start;
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

        .link-style {
            margin-top: 10px;
            display: block;
            text-align: left;
            font-size: 13px;
        }

        .link-style asp\:linkbutton {
            color: #007bff;
            text-decoration: none;
        }

        .link-style asp\:linkbutton:hover {
            text-decoration: underline;
        }

        .title {
            text-align: center;
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #444;
        }

        #<%= lbl.ClientID %> {
            color: red;
            margin-top: 10px;
            display: block;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <div class="title">Sign In</div>
            <table>
                <tr>
                    <td>Email</td>
                    <td>
                        <asp:TextBox ID="txtLogInEmail" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>
                        <asp:TextBox ID="txtLogInPassword" runat="server" TextMode="Password" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="btn-container">
                            <asp:Button ID="btnLogin" runat="server" Text="LogIn" OnClick="btnLogin_Click" />
                            <asp:Button ID="GoOnRegister" runat="server" Text="Register" OnClick="GoOnRegister_Click" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="link-style">
                        <asp:LinkButton ID="btnForget" runat="server" Text="Forgot Password?" OnClick="btnForget_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lbl" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>