<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="SMS_Application.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table>
        <tr>
            <td>Product Name</td>
            <td>
                <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Product Quantity</td>
            <td>
                <asp:DropDownList ID="ddlQuantity" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
            <td>Product Price</td>
            <td>
                <asp:TextBox ID="txtProductPrice" runat="server"></asp:TextBox></td>
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
            <td></td>
            <td>
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" /></td>
        </tr>
    </table>

</asp:Content>
