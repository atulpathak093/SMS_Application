<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="SMS_Application.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #e3f2fd, #ffffff);
        }

        .product-container {
            margin: 40px auto;
            padding: 40px;
            background-color: #ffffff;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            width: 90%;
            max-width: 900px;
        }

        table {
            width: 100%;
        }

        td {
            padding: 12px 10px;
            font-size: 14px;
            color: #333;
        }

        input[type="text"],
        select {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .btn-save {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

            .btn-save:hover {
                background-color: #0056b3;
            }

        .form-title {
            font-size: 20px;
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
            color: #006699;
        }

        .product-grid {
            margin-top: 30px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product-container">
        <div class="form-title">Product Management</div>
        <table>
            <tr>
                <td>Product Name</td>
                <td>
                    <asp:TextBox ID="txtProductName" runat="server" /></td>
            </tr>
            <tr>
                <td>Product Quantity</td>
                <td>
                    <asp:TextBox ID="txtProductQuantity" runat="server" /></td>
            </tr>
            <tr>
                <td>Product Price/Unit</td>
                <td>
                    <asp:TextBox ID="txtProductPrice" runat="server" /></td>
            </tr>
            <tr>
                <td>Product Category</td>
                <td>
                    <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" />
                </td>
            </tr>
            <tr>
                <td>Product Description</td>
                <td>
                    <asp:DropDownList ID="ddlDescription" runat="server" /></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn-save" OnClick="btnSave_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lbl" runat="server" ForeColor="Red" />
                </td>
            </tr>
        </table>

        <div class="product-grid">
            <asp:GridView ID="gvProduct" runat="server" AutoGenerateColumns="False" OnRowCommand="gvProduct_RowCommand"
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                <Columns>
                    <asp:TemplateField HeaderText="Product Id">
                        <ItemTemplate><%#Eval("ProductId") %></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product Name">
                        <ItemTemplate><%#Eval("ProductName") %></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product Quantity">
                        <ItemTemplate><%#Eval("ProductQuantity") %></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product Price/Unit">
                        <ItemTemplate>₹<%#Eval("ProductPrice") %></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product Category">
                        <ItemTemplate><%#Eval("CategoryName") %></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product Description">
                        <ItemTemplate><%#Eval("DescriptionName") %></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Upsert Date">
                        <ItemTemplate><%#Eval("ProductUpsertDate") %></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Del" CommandArgument='<%#Eval("ProductId") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="Upd" CommandArgument='<%#Eval("ProductId") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <RowStyle ForeColor="#000066" />
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>

