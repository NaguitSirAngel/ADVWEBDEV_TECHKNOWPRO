﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateIncident.aspx.cs" Inherits="TechKnowPro.CreateIncident" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 438px;
        }
        .auto-style3 {
            width: 95%;
            margin-top: 0px;
        }
        .auto-style4 {
            height: 26px;
        }
        .auto-style7 {
            margin-top: 0px;
        }
        .auto-style8 {
            width: 182px;
        }
        .auto-style9 {
            height: 26px;
            width: 182px;
        }
    </style>
</head>
<body>    
    <form id="form1" runat="server">
        <h1>TechKnow Pro - Incident Report Management Software</h1>
        <asp:Button ID="BtnLogout" runat="server" Text="Logout" style="margin-left: 800px;"/>
        <h2>Incident Report Page</h2>         
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <table class="auto-style3">
                            <tr>
                                <td class="auto-style8">
                                    <asp:Label ID="Label1" runat="server" Text="Select a Customer:"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlCustomers" runat="server" Height="25px" Width="160px" CssClass="auto-style7" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="customer_name" DataValueField="customer_id">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style9">
                                    <asp:Label ID="Label2" runat="server" Text="Customer ID:"></asp:Label>
                                </td>
                                <td class="auto-style4">
                                    <asp:TextBox ID="txtCustomerId" runat="server" Width="155px" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style9">
                                    <asp:Label ID="Label7" runat="server" Text="Product Name:"></asp:Label>
                                </td>
                                <td class="auto-style4">
                                    <asp:TextBox ID="txtProductName" runat="server" Width="155px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style8">
                                    <asp:Label ID="Label3" runat="server" Text="Report Date and Time:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDateTime" runat="server" Width="230px" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style9">
                                    <asp:Label ID="Label4" runat="server" Text="Incident #: "></asp:Label>
                                </td>
                                <td class="auto-style4">
                                    <asp:TextBox ID="txtIncidentNum" runat="server" Width="230px" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style8">
                                    <asp:Label ID="Label5" runat="server" Text="Status: "></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlStatus" runat="server" Height="25px" Width="235px">
                                        <asp:ListItem Selected="True">NEW</asp:ListItem>
                                        <asp:ListItem>IN PROGRESS</asp:ListItem>
                                        <asp:ListItem>CLOSED</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <p>Description of Problem:</p>
            <asp:TextBox ID="txtDescription" runat="server" Height="177px" TextMode="MultiLine" Width="869px"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDescription" ErrorMessage="Description of the problem is required!!" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <br />
        </div>
        <div>
            <asp:Label ID="Label6" runat="server" Text="Method of Contact: "></asp:Label>
            <br />
            &nbsp;
            <asp:RadioButtonList ID="rblContactMethod" runat="server">
                <asp:ListItem>Phone</asp:ListItem>
                <asp:ListItem>Email</asp:ListItem>
                <asp:ListItem>In Person</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <br />
            <asp:Button ID="BtnSubmit" runat="server" Text="Submit" OnClick="BtnSubmit_Click" PostBackUrl="~/CreateIncident.aspx" />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [customer_id], [user_id], ([lastname]+',  ' + [firstname]) as customer_name FROM [customers]" 
                InsertCommand="INSERT INTO [incidents] 
                                        (incident_number, customer_id, datetime, status, description, method_of_contact, product_name)
                                    VALUES
                                        (@incident_number, @customer_id, @datetime, @status, @description, @method_of_contact, @product_name)">
                <InsertParameters>
                    <asp:FormParameter Name="incident_number" FormField="txtIncidentNum" Type="Int32"/>
                    <asp:FormParameter Name="customer_id" formfield="txtCustomerId" Type="Int32"/>
                    <asp:FormParameter Name="user_id" Type="Int32" />
                    <asp:FormParameter Name="datetime" Type="DateTime" />
                    <asp:FormParameter Name="status" FormField="ddlStatus" Type="String"/>
                    <asp:FormParameter Name="description" FormField="txtDescription" Type="String"/>
                    <asp:FormParameter Name="method_of_contact" FormField="rblContactMethod" Type="String"/>
                    <asp:FormParameter Name="product_name" FormField="txtProductName" Type="String"/>
                </InsertParameters>
                


            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="select [incident_id] from incidents order by [incident_id] desc;"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
