<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Hello World!
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" AllowSorting="true" OnSorting="GridView1_Sorting">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField>
                        <HeaderTemplate>
                            Action
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="SelectLinkButton" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="Select">Select</asp:LinkButton>
                            <br />
                            <asp:LinkButton ID="EditLinkButton" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="Edit">Edit</asp:LinkButton>
                            <br />
                            <asp:LinkButton ID="DeleteLinkButton" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="Delete">Delete</asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="UpdateLinkButton" runat="server" CommandArgument='' CommandName="Update">Update</asp:LinkButton>
                            <br />
                            <asp:LinkButton ID="CancelLinkButton" runat="server" CommandArgument='' CommandName="Cancel">Cancel</asp:LinkButton>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:LinkButton ID="InsertLinkButton" runat="server" CommandArgument='' CommandName="Insert" OnClick="InsertLinkButton_Click">Insert</asp:LinkButton>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ID" SortExpression="Id">
                        <HeaderTemplate>ID</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="IdEditItemLabel" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                        </EditItemTemplate>
                        <FooterTemplate></FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Enr No." SortExpression="Eno">
                        <HeaderTemplate>Enr No</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="EnoLabel" runat="server" Text='<%# Eval("Eno") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="EnoEditItemTextBox" runat="server" Text='<%# Eval("Eno") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="EnoInsertItemTextBox" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name" SortExpression="Name">
                        <HeaderTemplate>Name</HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="NameEditItemTextBox" runat="server" Text='<%# Eval("Name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="NameInsertItemTextBox" runat="server"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
