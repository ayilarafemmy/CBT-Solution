<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="NewOgunCBT.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 93px;
        }
        .auto-style3 {
            font-size: x-large;
        }
        .auto-style4 {
            font-size: large;
        }
        .auto-style5 {
            width: 274px;
        }
        .auto-style6 {
            font-weight: bold;
        }
    </style>
</head>
<body style="background-image:url(bg.jpg)">
    <form id="form1" runat="server">
        <div>
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3" colspan="3"><strong>Ogun TMAS CBT Portal</strong></td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Examination Instructions&nbsp;</strong></td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:TextBox ID="TextBox3" runat="server" Height="35px" Width="250px" Placeholder="CBT Access Code" required=""></asp:TextBox>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                    <td rowspan="6"><span class="auto-style4">1. There is a Countdown of 50 Minutes&nbsp; for All 25 Questions</span><br class="auto-style4" />
                        <span class="auto-style4">2. Passmark is 65% </span><br class="auto-style4" />
                        <span class="auto-style4">3. Click Next after each Multiple Choice selection</span><br class="auto-style4" />
                        <span class="auto-style4">4. Cheating is not allowed</span><br class="auto-style4" />
                        <span class="auto-style4">5. The system will automatically Close after successful Exams</span><br class="auto-style4" />
                        <span class="auto-style4">6. Users Score is rated real time!</span><br class="auto-style4" />
                        <span class="auto-style4">7. Read Each Question Carefully.</span></td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <asp:TextBox ID="TextBox2" runat="server" Height="35px" Width="250px" Placeholder="Candidate Phone No" required="" MaxLength="11"></asp:TextBox>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">
                        <strong>
                        <asp:Button ID="Button1" runat="server" Height="38px" Text="Login" Width="265px" BackColor="#FF9900" BorderStyle="None" CssClass="auto-style6" ForeColor="White" OnClick="Button1_Click" />
                        </strong>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5"><strong>Today&#39;s Date:&nbsp; </strong>
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style5"><strong>
                        <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
                        </strong></td>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
