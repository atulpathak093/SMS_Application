<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProductInCart.aspx.cs" Inherits="SMS_Application.AddProductInCart" %>

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
                        <td>
                            <asp:Label ID="lbl" runat="server"></asp:Label></td>
                    </tr>

                    <tr>
                        <td>Product Category</td>
                        <td>
                            <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"></asp:DropDownList></td>
                    </tr>

                    <tr>
                        <td>Product Description</td>
                        <td>
                            <asp:DropDownList ID="ddlDescription" runat="server"></asp:DropDownList></td>
                    </tr>

                    <tr>
                        <td>Product Name</td>
                        <td>
                            <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td>Available Quantity</td>
                        <td>
                            <asp:TextBox ID="txtAvailableQuantity" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td>Purchase Quantity</td>
                        <td>
                            <asp:TextBox ID="txtPurchaseQuantity" runat="server"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button ID="btnAddItem" runat="server" Text="Add Item" />
                            <asp:Button ID="btnForBilling" runat="server" Text="Go To Billing" OnClick="btnForBilling_Click" />
                        </td>
                    </tr>

                </table>
            </center>
        </div>
    </form>
</body>
</html>
