<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contactlist.aspx.cs" Inherits="TechKnowPro.Contactlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>TechKnow Pro - Incident Report Management Software</p>
        </div>
        <div>
            <p>Contact List - Manage your contact list</p>
            <table class="auto-style1">
                <tr>
                    <td>Contact List</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><%-- Bound to Contact list table --%>
                        <asp:ListBox ID="lbContacts" runat="server" Height="172px" Width="441px" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="contact_details" DataValueField="contact_id">
                        </asp:ListBox>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT [contact_id], [contact_details] FROM [contact_list]" 
                            DeleteCommand="DELETE FROM [contact_list] WHERE contact_id=@ContactID;">
                            <DeleteParameters>
                                <asp:ControlParameter Name="ContactID" ControlId="lbContacts" PropertyName="SelectedValue"/>
                            </DeleteParameters>
                        </asp:SqlDataSource>
                        <asp:Button ID="btnRemoveContact" runat="server" Text="Remove Contact" OnClick="btnRemoveContact_Click" /> &nbsp 
                        <asp:Button ID="btnEmptyList" runat="server" Text="Empty List" OnClick="btnEmptyList_Click" />
                        
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT * FROM [contact_list]"
                            DeleteCommand="DELETE FROM contact_list" ></asp:SqlDataSource>
                        <br />
                        <asp:Button ID="btnSelectAddCust" runat="server" Text="Select Additional Customers" OnClick="btnSelectAddCust_Click" />
                        <br />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
        </div>

    </form>
</body>
</html>
