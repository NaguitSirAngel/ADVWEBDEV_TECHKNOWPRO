<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSurvey.aspx.cs" Inherits="TechKnowPro.ViewSurvey" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 304px;
        }
        .auto-style3 {
            width: 403px;
        }
        .auto-style4 {
            width: 304px;
            height: 23px;
        }
        .auto-style5 {
            width: 403px;
            height: 23px;
        }
        .auto-style6 {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <h1>
                 <table class="auto-style1">
                     <tr>
                         <td>TechKnow Pro - Incident Report Management Software</td>
                         <td>
                             <asp:Button ID="btnLogout" runat="server" Text="Logout" Width="77px" />
                         </td>
                     </tr>
                     <tr>
                         <td>&nbsp;</td>
                         <td>&nbsp;</td>
                     </tr>
                 </table>
             </h1>
            <h2>View Survey</h2>
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Select Customer:</td>
                <td class="auto-style3">
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="16px" Width="239px">
                    </asp:DropDownList>
                </td>
                <td>Customer Id:</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Survey List:</td>
                <td class="auto-style3">
                    <asp:DropDownList ID="DropDownList2" runat="server" Height="16px" Width="239px">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnRetrieve" runat="server" Text="Retrieve Survey Details" />
                </td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">Customer Rating:</td>
                <td class="auto-style5"></td>
                <td class="auto-style6"></td>
                <td class="auto-style6"></td>
            </tr>
            <tr>
                <td class="auto-style2">Response Time:</td>
                <td class="auto-style3">
                    <asp:Label ID="lblResponseTime" runat="server" Text="Label"></asp:Label>
                </td>
                <td>Contact to discuss Incident:</td>
                <td>
                    <asp:Label ID="lblContactToDiscuss" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Technician Efficiency:</td>
                <td class="auto-style3">
                    <asp:Label ID="lblTechEfficiency" runat="server" Text="Label"></asp:Label>
                </td>
                <td>Preferred Contact Method:</td>
                <td>
                    <asp:Label ID="lblPreferredContactMethod" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Problem Resolution:</td>
                <td class="auto-style3">
                    <asp:Label ID="lblProbReso" runat="server" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Additional Comment:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="TextBox2" runat="server" textmode="MultiLine" Style="resize:none" Height="123px" Width="572px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Button ID="btnHome" runat="server" Text="Home" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
