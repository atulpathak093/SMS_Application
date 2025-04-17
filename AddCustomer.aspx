<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCustomer.aspx.cs" Inherits="SMS_Application.AddCustomer" %>

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
                        <td>Customer Name</td>
                        <td>
                            <asp:TextBox ID="txtCustomerName" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Customer Mobile</td>
                        <td>
                            <%--readonly="true" Enabled="false"--%>
                            <asp:TextBox ID="txtCustomerMobile" runat="server" ></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnAddCustomer" runat="server" Text="Add Customer" OnClick="btnAddCustomer_Click"></asp:Button></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lbl" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </center>
        </div>
    </form>
</body>
</html>
