<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="SMS_Application.ForgetPassword" %>

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
                        <td>Person Mobile</td>
                        <td>
                            <asp:TextBox ID="txtPersonMobile" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Person Newn Password</td>
                        <td>
                            <asp:TextBox ID="txtPersonNewPassword" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Confirm Password</td>
                        <td>
                            <asp:TextBox ID="txtConfirmPassword" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button  ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblMsg" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblMobile" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </center>

        </div>
    </form>
</body>
</html>
