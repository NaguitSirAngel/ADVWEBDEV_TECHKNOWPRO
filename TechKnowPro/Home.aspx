<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TechKnowPro.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
        <form id="form1" runat="server">
        <div><h2>
            TechKnow Pro - Incident Report Management Software</h2></div>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" />
    </form>
    <br />
    <div><h3>Welcome to the Techknow Pro Support Portal</h3></div>
    <br />
    <div><h3>Getting Started</h3>
        <asp:Label ID="lblGetStarted" runat="server" Text=""></asp:Label>
    </div>
    <br /><br />
    <div><h3><asp:Label ID="lblContent1" runat="server" Text=""></asp:Label></h3>
        <asp:Label ID="lblContent2" runat="server" Text=""></asp:Label>
    </div>
    <br />
    <br />
    <div>
        <h3>Group Members</h3>
        1. Aldrin Jacinto - 101112293<br />
        2. Francis Victa - 101159185<br />
        3. Maria Lilian Yang - 101151657<br />
        4. Sir Angel Naguit - 101152749<br />
        5. Steven Wemin - 101091788
    </div>
    <br />
    <hr />
    @2019 - COMP2139 - Techknow Pro
</body>
</html>
