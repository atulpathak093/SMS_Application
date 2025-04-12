<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="SMS_Application.SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center>
                <table>
                    <tr>
                        <td>Person Email</td>
                        <td>
                            <asp:TextBox ID="txtLogInEmail" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Person Password</td>
                        <td>
                            <asp:TextBox ID="txtLogInPassword" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnLogin" runat="server" Text="LogIn" OnClick="btnLogin_Click" /></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="btnForget" runat="server" Text="Forget Password?" OnClick="btnForget_Click"></asp:LinkButton></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbl" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </center>
        </div>
    </form>
</body>
</html>
