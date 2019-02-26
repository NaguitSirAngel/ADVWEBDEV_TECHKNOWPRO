<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubmitSurvey.aspx.cs" Inherits="TechKnowPro.SubmitSurvey" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 108px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <h1>TechKnow Pro - Incident Report Management Software</h1>
            <br/>
            <h2>Survey Complete</h2>
        </div>
        <p>
            Thank you for your feedback!</p>
        <p>
            A customer service representative will contact you within 24 hours.</p>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnHome" runat="server" Text="Home" Width="69px" />
                </td>
                <td>
                    <asp:Button ID="btnReturnSurvey" runat="server" Text="Return to Survey" PostBackUrl="~/Survey.aspx" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
