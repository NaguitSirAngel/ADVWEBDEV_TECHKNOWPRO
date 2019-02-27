<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewIncident.aspx.cs" Inherits="TechKnowPro.ViewIncident" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 20%;
            height: 30px;
        }
        .auto-style2 {
            width: 170px;
        }
        .auto-style3 {
            width: 100%;
        }
        .auto-style5 {
            width: 151px;
            height: 23px;
        }
        .auto-style6 {
            height: 23px;
        }
        .auto-style7 {
            width: 151px;
        }
        .auto-style8 {
            height: 360px;
        }
        .auto-style9 {
            float: left;
            width: 28%;
            height: 300px;
        }
    </style>
    </head>
<body>
    <form id="form1" runat="server">
        <h1>TechKnow Pro - Incident Report Management Software</h1>
        <asp:Button ID="BtnLogout" runat="server" Text="Logout" style="margin-left: 1050px;"/>
        <h2>View Incident</h2>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Text="Select a customer:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlCustomers" runat="server" Height="30px" Width="201px" AppendDataBoundItems="true"
                        DataSourceID="SqlDataSource1" 
                        DataTextField="full_name" 
                        AutoPostBack="True" DataValueField="customer_id">
                        <asp:ListItem>SELECT CUSTOMER</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
        

        <div>
            <p>Incident List:</p>
            <asp:ListBox ID="lbIncidents" runat="server" Height="194px" Width="1100px" DataSourceID="SqlDataSource2" DataTextField="incident_list" DataValueField="incident_id"></asp:ListBox>
            <br />
            <asp:Button ID="btnRetrieve" runat="server" Text="Retrieve" OnClick="Button1_Click" />
        </div>
        <br />

        <div class="auto-style8">
            <div style="width:15%; float:left;">
                <p>Details</p>
                <table class="auto-style3" style="border:solid black 1px; ">
                    <tr>
                        <td class="auto-style5">
                            <asp:Label ID="Label2" runat="server" Text="Customer ID:"></asp:Label>
                        </td>
                        <td class="auto-style6">
                            <asp:Label ID="lblCustomerId" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7">
                            <asp:Label ID="Label3" runat="server" Text="Report Date & Time:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblDateTime" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7">
                            <asp:Label ID="Label4" runat="server" Text="Incident #:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblIncidentNum" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7">
                            <asp:Label ID="Label5" runat="server" Text="Status:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblStatus" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>

            <div style="margin-left:5%;" class="auto-style9">
                <p>Description</p>
                <asp:TextBox ID="txtDescription" runat="server" Height="251px" TextMode="MultiLine" Width="600px"></asp:TextBox>
            </div>
        </div>
        <footer>
            <asp:Button ID="btnHome" runat="server" Text="Home" />
            <asp:SqlDataSource 
                ID="SqlDataSource1" 
                runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [customer_id], ([lastname] + ', ' + [firstname]) as full_name FROM [customers]">
            </asp:SqlDataSource>
            <asp:SqlDataSource 
                ID="SqlDataSource2" 
                runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [incident_id], [incident_number], [customer_id], [user_id], [status], [datetime], [description], [method_of_contact], ('Incident for product ' + [product_name] + ', ' + [status] + ', ' + CONVERT(varchar, [datetime]) + ', '  +[description]) as incident_list FROM [incidents] WHERE ([customer_id] = @customer_id) AND ([status] LIKE 'CLOSED' )">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblCustomerId" Name="customer_id" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </footer>

    </form>

</body>
</html>
