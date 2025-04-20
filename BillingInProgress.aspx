<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BillingInProgress.aspx.cs" Inherits="SMS_Application.BillingInProgress" %>

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
                        <td>Customer Mobile</td>
                        <td>
                            <asp:TextBox ID="txtCustomerMobile" runat="server"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td>Customer Name</td>
                        <td>
                            <asp:TextBox ID="txtCustomerName" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnCustomerDetails" runat="server" Text="GetCustomerDetails" OnClick="btnCustomerDetails_Click" />
                            <asp:Button ID="btnProceed" runat="server" Text="Proceed" OnClick="btnProceed_Click" />
                        </td>

                        <td>
                            <asp:Label ID="lbl" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </center>
        </div>
    </form>
</body>
</html>
