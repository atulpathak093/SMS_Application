<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonRegistrationForm.aspx.cs" Inherits="SMS_Application.PersonRegistrationForm" %>

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
                        <td>Person Name</td>
                        <td>
                            <asp:TextBox ID="txtPersonName" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Person Email</td>
                        <td>
                            <asp:TextBox ID="txtPersonEmail" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Person Password</td>
                        <td>
                            <asp:TextBox ID="txtPersonpassword" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Person Confirm Password</td>
                        <td>
                            <asp:TextBox ID="txtConfirmPassword" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Person Mobile</td>
                        <td>
                            <asp:TextBox ID="txtPersonMobile" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Person Role</td>
                        <td><asp:DropDownList ID="ddlRole" runat="server" ></asp:DropDownList></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                            <asp:Label ID="lbl" runat="server"></asp:Label>
                            <asp:Button ID="btnReset" runat="server" Text="Reset" OnClick="btnReset_Click" />
                        </td>
                    </tr>
                    
                </table>
            </center>
        </div>
    </form>
</body>
</html>
