<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Completed.aspx.cs" Inherits="NewOgunCBT.Completed" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 151px;
        }
        .auto-style3 {
            width: 151px;
            color: #CC6600;
            font-size: x-large;
        }
        .auto-style4 {
            color: #FFFFFF;
            font-weight: bold;
            background-color: #CC6600;
        }
        .auto-style6 {
            width: 282px;
            color: #CC6600;
            font-size: xx-large;
        }
        .auto-style7 {
            font-size: x-large;
        }
        .auto-style8 {
            font-size: 62px;
        }
        .auto-style9 {
            width: 282px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td colspan="2"><em><strong><span class="auto-style8">DRIVING TEST REPORT<br />
                        <br />
                        </span>
                        <br />
                        </strong></em></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style6">
                        <asp:Label ID="Label7" runat="server" Text="Full Name" Visible="False"></asp:Label>
                    </td>
                    <td class="auto-style7"><strong>
                        <asp:Label ID="Label1" runat="server" Text="Label" CssClass="auto-style7" Visible="False"></asp:Label>
                        </strong></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style6">
                        <asp:Label ID="Label8" runat="server" Text="Exam No" Visible="False"></asp:Label>
                    </td>
                    <td class="auto-style7"><strong>
                        <asp:Label ID="Label2" runat="server" Text="Label" CssClass="auto-style7" Visible="False"></asp:Label>
                        </strong></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style6">
                        <asp:Label ID="Label9" runat="server" Text="Exam Date" Visible="False"></asp:Label>
                    </td>
                    <td class="auto-style7"><strong>
                        <asp:Label ID="Label3" runat="server" Text="Label" CssClass="auto-style7" Visible="False"></asp:Label>
                        </strong></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style6">
                        <asp:Label ID="Label10" runat="server" Text="Exam Venue" Visible="False"></asp:Label>
                    </td>
                    <td class="auto-style7"><strong>
                        <asp:Label ID="Label4" runat="server" Text="Label" CssClass="auto-style7" Visible="False"></asp:Label>
                        </strong></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style6">
                        <asp:Label ID="Label11" runat="server" Text="Exam Score" Visible="False"></asp:Label>
                    </td>
                    <td class="auto-style7"><strong>
                        <asp:Label ID="Label5" runat="server" Text="Label" CssClass="auto-style7" Visible="False"></asp:Label>
                        </strong></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style6">
                        <asp:Label ID="Label12" runat="server" Text="Rating" Visible="False"></asp:Label>
                    </td>
                    <td class="auto-style7"><strong>
                        <asp:Label ID="Label6" runat="server" Text="Label" CssClass="auto-style7" Visible="False"></asp:Label>
                        </strong></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                    <td><asp:Button ID="btnPrint" CssClass="btn btn-primary"  OnClientClick="javascript:window.print();" Text="Print" runat="server" Visible="False" />
                        <asp:TextBox ID="TextBox1" runat="server" Height="33px" Width="320px" Placeholder="Enter ExamID" required=""></asp:TextBox>
                        <strong>
                        <asp:Button ID="Button1" runat="server" BorderStyle="None" CssClass="auto-style4" Height="40px" Text="Pull Data" Width="167px" OnClick="Button1_Click" />
                        </strong></td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
