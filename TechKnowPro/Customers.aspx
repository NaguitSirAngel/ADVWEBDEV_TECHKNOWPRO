<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="TechKnowPro.Customers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 134px;
        }
        .auto-style3 {
            width: 114px;
        }
        .auto-style4 {
            width: 114px;
            height: 23px;
        }
        .auto-style5 {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <p>TechKnow Pro - Incident Report Management Software</p>
            </div>
            <div>
                <p>Customer - Search and view your customer contact information</p>
            </div>
            <div>

                <table class="auto-style1">
                    <tr>
                        <td>
                            <table class="auto-style1">
                                <tr>
                                    <td class="auto-style2">
                                        <%-- Bounded to Customers, throught custoemr ID --%>
                                        <asp:Label ID="Label1" runat="server" Text="Select a customer"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddlSelectCustomer" runat="server" Height="16px" Width="122px" DataSourceID="SqlDataSource1" DataTextField="fullname" DataValueField="customer_id" AutoPostBack="True">
                                           
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                            SelectCommand="SELECT [customer_id], CONCAT([lastname],', ',[firstname]) AS fullname, [address], [email], [phone] FROM [customers] ORDER BY [lastname]" 
                                            InsertCommand="INSERT INTO contact_list (customer_id, contact_details) VALUES(@CustID, @Description)">
                                            <InsertParameters>
                                                <asp:formparameter Name="CustID" formfield="hfCustId" Type="String"/>
                                                <asp:formparameter Name="Description" formfield="hfDescription" Type="String"/>
                                            </InsertParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="auto-style1">
                                <tr>
                                    <td class="auto-style3">
                                        <asp:Label ID="Label2" runat="server" Text="Address:"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblAddress" runat="server" Text="" name="address"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style4">
                                        <asp:Label ID="Label3" runat="server" Text="Phone:"></asp:Label>
                                    </td>
                                    <td class="auto-style5">
                                        <asp:Label ID="lblPhone" runat="server" Text="" ></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style4">
                                        <asp:Label ID="Label4" runat="server" Text="Email:"></asp:Label>
                                    </td>
                                    <td class="auto-style5">
                                        <asp:Label ID="lblEmail" runat="server" Text="" ></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <asp:Button ID="btnAddContactList" runat="server" Text="Add to Contact List" OnClick="btnAddContactList_Click"/> &nbsp&nbsp
                            <asp:Button ID="btnDisplayContactList" runat="server" 
                                Text="Display Contact List" OnClick="btnDisplayContactList_Click" />
                            <br />
                            <br />
                            <asp:Label ID="lblSuccess" runat="server" Text=""></asp:Label>
                            <asp:HiddenField ID="hfCustId" runat="server" />
                            <asp:HiddenField ID="hfDescription" runat="server" />
                            
                        </td>
                    </tr>
                </table>

            </div>
        
        </div>
    </form>
</body>
</html>
