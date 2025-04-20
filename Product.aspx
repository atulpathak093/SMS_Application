<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="SMS_Application.Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <center>
        <table style="border:groove">
            <tr>
                <td>Product Name</td>
                <td>
                    <asp:TextBox ID="txtProductName" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Product Quantity</td>
                <td><asp:TextBox ID="txtProductQuantity" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Product Price/Unit</td>
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
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"/>

                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl" runat="server"></asp:Label>
                </td>
            </tr>

            <tr>
                <td></td>
                <td>
                    <asp:GridView ID="gvProduct" runat="server" AutoGenerateColumns="False" OnRowCommand="gvProduct_RowCommand" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
                        <Columns>
                            <asp:TemplateField HeaderText="Product Id">
                                <ItemTemplate>
                                    <%#Eval("ProductId") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Product Name">
                                <ItemTemplate>
                                    <%#Eval("ProductName") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Product Quantity">
                                <ItemTemplate>
                                    <%#Eval("ProductQuantity") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Product Price/Unit">
                                <ItemTemplate>
                                    ₹<%#Eval("ProductPrice") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Product Category">
                                <ItemTemplate>
                                    <%#Eval("CategoryName") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Product Description">
                                <ItemTemplate>
                                    <%#Eval("DescriptionName") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Upsert Date">
                                <ItemTemplate>
                                    <%#Eval("ProductUpsertDate") %>
                                </ItemTemplate>
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
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </center>
</asp:Content>


