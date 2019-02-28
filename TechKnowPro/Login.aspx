<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TechKnowPro.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 100px;
        }
        .auto-style3 {
            width: 100px;
            height: 29px;
        }
        .auto-style4 {
            height: 29px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        LOGIN
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Username:</td>
                <td>
                    <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Password:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                    <asp:Button ID="btnRegister" runat="server" Text="Register" CausesValidation="False" OnClick="btnRegister_Click" />
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT users.user_id, users.username, users.password, roles.definition FROM roles INNER JOIN user_roles ON roles.role_id = user_roles.role_id INNER JOIN users ON user_roles.user_id = users.user_id"></asp:SqlDataSource>
        <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>
