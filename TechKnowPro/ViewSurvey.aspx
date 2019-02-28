<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSurvey.aspx.cs" Inherits="TechKnowPro.ViewSurvey" %>

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
        .auto-style7 {
            width: 304px;
            height: 30px;
        }
        .auto-style8 {
            width: 403px;
            height: 30px;
        }
        .auto-style9 {
            height: 30px;
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
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="25px" Width="239px" DataSourceID="SqlDataSource1" DataTextField="quer" DataValueField="customer_id" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * , [lastname] + ', ' + [firstname] as quer FROM [customers]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="This Field is Required " ForeColor="#CC0000"></asp:RequiredFieldValidator>
                </td>
                <td>Customer Id:</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" enabled="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Survey List:</td>
                <td class="auto-style3">
                    <asp:DropDownList ID="DropDownList2" runat="server" Height="25px" Width="350px" DataSourceID="SqlDataSource2" DataTextField="quer" DataValueField="survey_id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [survey_id], 'Survey result for incident '+ CONVERT(varchar(20), [incident_number]) as quer, [response_time], [technician_efficiency], [problem_efficiency], [contact_to_discuss], [preferred_contact], [additional_comment], [datetime], [customer_id] FROM [surveys] WHERE ([customer_id] = @customer_id)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="5" Name="customer_id" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="DropDownList2" ErrorMessage="This Field is Required" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Button ID="btnRetrieve" runat="server" Text="Retrieve Survey Details" OnClick="btnRetrieve_Click" />
                </td>
                <td class="auto-style8"></td>
                <td class="auto-style9"></td>
                <td class="auto-style9"></td>
            </tr>
            <tr>
                <td class="auto-style4">Customer Rating:</td>
                <td class="auto-style5"></td>
                <td class="auto-style6"></td>
                <td class="auto-style6"></td>
            </tr>
            <tr>
                <td class="auto-style4">Response Time:</td>
                <td class="auto-style5">
                    <asp:Label ID="lblResponseTime" runat="server"></asp:Label>
                </td>
                <td class="auto-style6">Contact to discuss Incident:</td>
                <td class="auto-style6">
                    <asp:Label ID="lblContactToDiscuss" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Technician Efficiency:</td>
                <td class="auto-style3">
                    <asp:Label ID="lblTechEfficiency" runat="server"></asp:Label>
                </td>
                <td>Preferred Contact Method:</td>
                <td>
                    <asp:Label ID="lblPreferredContactMethod" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Problem Resolution:</td>
                <td class="auto-style3">
                    <asp:Label ID="lblProbReso" runat="server"></asp:Label>
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
                    <asp:TextBox ID="txtAdditionalComments" runat="server" textmode="MultiLine" Style="resize:none" Height="123px" Width="572px" Enabled="false"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [surveys] WHERE ([survey_id] = @survey_id)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList2" Name="survey_id" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
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
