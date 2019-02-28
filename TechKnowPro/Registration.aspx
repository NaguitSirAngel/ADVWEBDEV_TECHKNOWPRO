<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="TechKnowPro.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 1072px;
        }
        .auto-style6 {
            width: 1069px;
            text-align: center;
        }
        .auto-style7 {
            text-align: center;
        }
        .auto-style8 {
            width: 725px;
        }
        .auto-style12 {
            margin-left: 5px;
        }
        .auto-style22 {
            width: 100%;
        }
        .auto-style23 {
            width: 481px;
        }
        .auto-style24 {
            width: 481px;
            text-align: right;
        }
        .auto-style25 {
            width: 342px;
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
           <h1 class="auto-style6"> <asp:Label ID="Label1" runat="server" Text="Registration Page"></asp:Label>
        
            </h1>
            <div class="auto-style7">
            </div>
            <div class="auto-style7">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" Width="1072px" ForeColor="Red" />
            </div>
        </div>
        
        <table class="auto-style22">
            <tr>
                <td class="auto-style24">
                    <asp:Label ID="Label2" runat="server" Text="Firstname*"></asp:Label>
                    <asp:TextBox ID="txtFN" runat="server" Width="118px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFN" Display="Dynamic" ErrorMessage="First Name is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Lastname*"></asp:Label>
                    <asp:TextBox ID="txtLN" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLN" Display="Dynamic" ErrorMessage="Last Name is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            </asp:Table>
            <table class="auto-style22">
                <td class="auto-style25">
                    <asp:Label ID="Label4" runat="server" Text="Address*"></asp:Label>
                    </td>
                <td>
                    <asp:TextBox ID="txtAddr" runat="server" CssClass="auto-style12" Width="322px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtAddr" Display="Dynamic" ErrorMessage="Address is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
            </tr></asp:Table>
            <table class="auto-style22">
                <tr>
                <td class="auto-style24">
                    <asp:Label ID="Label5" runat="server" Text="Email*"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEm" runat="server" Width="134px" CssClass="auto-style8" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEm" Display="Dynamic" ErrorMessage="Email is required" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
                    
            </tr>
            <tr>
                <td class="auto-style24">
                    <asp:Label ID="Label6" runat="server" Text="Password*"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPass1" runat="server" Width="132px" MaxLength="12" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPass1" Display="Dynamic" ErrorMessage="Password required" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="User must enter the same password" ControlToCompare="txtPass1" ControlToValidate="txtPass2" ForeColor="Red">*</asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style24">
                    <asp:Label ID="Label7" runat="server" Text="Confirm Password*"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPass2" runat="server" Width="131px" MaxLength="12" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPass2" Display="Dynamic" ErrorMessage="Confirmation Password required" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style24">
                    <asp:CheckBox ID="cbAgree" runat="server" /></td>
                <td>
                   &nbsp; <asp:Label ID="Label8" runat="server" Text="I agree to the"></asp:Label>&nbsp;
                    <asp:HyperLink href="#" ID="HyperLink1" runat="server">terms of service</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td class="auto-style23">
                    &nbsp;</td>
                <td>
                    &nbsp;
                    <asp:Label ID="lblSuccOrErr" runat="server" Text=""></asp:Label>

                 <asp:SqlDataSource ID="sdsUserCheck" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [users] WHERE ([username] = @username)" >
                         <SelectParameters>
                            <asp:ControlParameter ControlID="txtEm" Name="username" PropertyName="Text" Type="String" />
                        </SelectParameters>
                        
                 </asp:SqlDataSource>


                    <asp:SqlDataSource ID="sdsUser" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [users] WHERE ([username] = @username)" InsertCommand="INSERT INTO [users] ([username], [password]) VALUES (@username, @password)" >
                         
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtEm" Name="username" PropertyName="Text" Type="String" />
                        </SelectParameters>
                        <InsertParameters>
                            <asp:ControlParameter Name="username" Type="String" ControlId="txtEm"/>
                            <asp:ControlParameter Name="password" Type="String" ControlId="txtPass1"/>
                        </InsertParameters>
                       
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="sdsRole" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"  InsertCommand="INSERT INTO [user_roles] ([user_id], [role_id]) VALUES (@user_id, @role_id)">
                       
                        <InsertParameters>
                            <asp:SessionParameter Name="user_id" SessionField="user_id" Type="Int32" />
                            <asp:SessionParameter Name="role_id" SessionField="rol_id" Type="Int32" />
                        </InsertParameters>
                       
                    </asp:SqlDataSource>
                    
                    <asp:SqlDataSource ID="sdsCustomers" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"  InsertCommand="INSERT INTO [customers] ([user_id], [firstname], [lastname], [address], [position_title], [email], [phone], [question_id], [question_answer]) VALUES (@user_id, @firstname, @lastname, @address, @position_title, @email, @phone, @question_id, @question_answer)" >
                       
                        <InsertParameters>
                            <asp:SessionParameter Name="user_id" SessionField="user_id" Type="Int32" />
                            <asp:SessionParameter Name="firstname" SessionField="firstN" Type="String" />
                            <asp:SessionParameter DefaultValue="" Name="lastname" SessionField="lastN" Type="String" />
                            <asp:SessionParameter DefaultValue="" Name="address" SessionField="address" Type="String" />
                            <asp:Parameter Name="position_title" Type="String" DefaultValue="null" />
                            <asp:SessionParameter DefaultValue="" Name="email" Type="String" SessionField="email" />
                            <asp:Parameter Name="phone" Type="String" DefaultValue="null" />
                            <asp:SessionParameter DefaultValue="" Name="question_id" SessionField="questId" Type="Int32" />
                            <asp:Parameter Name="question_answer" Type="String" DefaultValue="secret" />
                        </InsertParameters>
                       
                    </asp:SqlDataSource>
                    </td>
            </tr>
            <tr>
                <td class="auto-style23">&nbsp;</td>
                <td>
                    <asp:Button ID="btnRegis" runat="server" Text="Register" OnClick="btnRegis_Click" />&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="False" />
                </td>
            </tr>
        </table>
    </form>
</body>

</html>
