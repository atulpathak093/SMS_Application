<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowEventActivity.aspx.cs" Inherits="SMS_Application.ShowEventActivity" %>

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
                        <tr>
                            <td>
                                <h1>Welcome to event Activity page</h1>
                            </td>
                        </tr>
                        <asp:GridView ID="gvShowEvent" runat="server" AutoGenerateColumns="false">
                            <Columns>
                                <asp:TemplateField HeaderText="Event Id">
                                    <ItemTemplate>
                                        <%#Eval("EventId") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Product Id">
                                    <ItemTemplate>
                                        <%#Eval("ProductId") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Event Name">
                                    <ItemTemplate>
                                        <%#Eval("EventName") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Event Executer">
                                    <ItemTemplate>
                                        <%#Eval("EventExecuter") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Event Occured">
                                    <ItemTemplate>
                                        <%#Eval("EventOccured") %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                    </tr>
                </table>
            </center>
        </div>
    </form>
</body>
</html>
