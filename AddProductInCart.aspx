<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProductInCart.aspx.cs" Inherits="SMS_Application.AddProductInCart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Product to Cart</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #e0f7fa, #ffffff);
            margin: 0;
            padding: 0;
        }

        .cart-container {
            margin: 50px auto;
            padding: 40px;
            background-color: #ffffff;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            width: 90%;
            max-width: 700px;
        }

        table {
            width: 100%;
        }

        td {
            padding: 12px 10px;
            font-size: 14px;
            color: #333;
        }

        input[type="text"], select {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .btn {
            padding: 10px 18px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            margin-right: 10px;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .form-title {
            font-size: 20px;
            text-align: center;
            margin-bottom: 25px;
            font-weight: bold;
            color: #006699;
        }

        .label-msg {
            color: red;
            font-weight: bold;
        }

        .gridview-style {
            margin-top: 20px;
            border-collapse: collapse;
            width: 100%;
        }

        .gridview-style th, .gridview-style td {
            border: 1px solid #ccc;
            padding: 8px;
        }

        .gridview-style th {
            background-color: #007bff;
            color: white;
        }

        .gridview-style td {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="cart-container">
            <div class="form-title">Add Product to Cart</div>
            <table>
                <tr>
                    <td>Product Category</td>
                    <td>
                        <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Product Description</td>
                    <td>
                        <asp:DropDownList ID="ddlDescription" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlDescription_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Product Name</td>
                    <td>
                        <asp:TextBox ID="txtProductName" ReadOnly="true" Enabled="false" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Available Quantity</td>
                    <td>
                        <asp:TextBox ID="txtAvailableQuantity" ReadOnly="true" Enabled="false" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Purchase Quantity</td>
                    <td>
                        <asp:TextBox ID="txtPurchaseQuantity" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lbl" runat="server" CssClass="label-msg"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnAddItem" runat="server" Text="Add Item" CssClass="btn" OnClick="btnAddItem_Click" />
                        <asp:Button ID="btnForBilling" runat="server" Text="Proceed To Pay" CssClass="btn" OnClick="btnForBilling_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="gvBilling" runat="server" AutoGenerateColumns="false" CssClass="gridview-style">
                            <Columns>
                                <asp:TemplateField HeaderText="Product Name">
                                    <ItemTemplate><%# Eval("ProductName") %></ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Product Quantity">
                                    <ItemTemplate><%# Eval("PurchaseQuantity") %></ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Final Price">
                                    <ItemTemplate><%# Eval("ProductPrice") %> /Per Unit</ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
