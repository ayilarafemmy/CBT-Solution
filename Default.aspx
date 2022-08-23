<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="NewOgunCBT.lol" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style6 {
            height: 25px;
        }
        .auto-style7 {
            font-size: large;
        }
        .auto-style8 {
            font-size: xx-large;
        }
        .auto-style9 {
            font-size: x-large;
        }
        .auto-style10 {
            color: #FFFFFF;
            font-weight: bold;
        }
        .auto-style11 {
            color: #FF9900;
        }
        .auto-style12 {
            font-size: medium;
            font-weight: bold;
            color: #FFFFFF;
            background-color: #CC3300;
        }
        .auto-style13 {
            font-size: medium;
            color: #FFFFFF;
            background-color: #FF9900;
        }
        .auto-style14 {
            color: #003366;
            font-size: x-large;
        }
    </style>
</head>
<body style="background-image:url(tonight.jpg)">
    <form id="form1" runat="server">
        <div>
            <strong><span class="auto-style7"><span class="auto-style11">Name:</span> </span>
            <asp:Label ID="Label10" runat="server" Text="Label" CssClass="auto-style7"></asp:Label>
            <span class="auto-style7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style11">Exam No:</span> </span>
            <asp:Label ID="Label11" runat="server" Text="Label" CssClass="auto-style7"></asp:Label>
            <span class="auto-style7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style11">Phone:</span></span><asp:Label ID="Label15" runat="server" Text="Label" CssClass="auto-style7"></asp:Label>
            <span class="auto-style7">&nbsp;&nbsp;&nbsp;</span></strong><span class="auto-style9">&nbsp;&nbsp; </span>
            <br />
            <br />
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>     

<asp:UpdatePanel runat="server" UpdateMode="Conditional">

    <ContentTemplate>
         <asp:Label ID="Label1" runat="server" Text="*" Visible="False"></asp:Label>
       
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" runat="server" Text="*" CssClass="auto-style8" Visible="False"></asp:Label>
         &nbsp;<asp:Label ID="Label4" runat="server" Text="*" Visible="False"></asp:Label>

    </ContentTemplate>

    <Triggers>

        <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />

    </Triggers>

</asp:UpdatePanel>

<asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>

            <asp:Label ID="Label2" runat="server" Text="Label2" Visible="False"></asp:Label>

           
            <strong>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Start Exam" BackColor="#FF9900" BorderStyle="None" CssClass="auto-style10" Height="35px" Width="1052px" />
            </strong>
            <br />
            <asp:Panel ID="Panel1" runat="server" BorderColor="#FF9900" BorderStyle="Solid" BorderWidth="1px" Visible="False">
                <strong><span class="auto-style7">No of Questions Answered: </span>
                <asp:Label ID="Label6" runat="server" CssClass="auto-style7" Text="Label"></asp:Label>
                <span class="auto-style7">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label17" runat="server" CssClass="auto-style7" Text="Questions Left:"></asp:Label>
                </span>
                <asp:Label ID="Label7" runat="server" CssClass="auto-style7" Text="Label"></asp:Label>
                &nbsp; </strong>
                <asp:Label ID="Label13" runat="server" Text="Label" Visible="False"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label16" runat="server" Text="Label" Visible="False"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label8" runat="server" Text="Question No:"></asp:Label>
                <asp:Label ID="Label12" runat="server" Text="Label"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label14" runat="server" Text="Label" Visible="False"></asp:Label>
                <br />
                <br />
                <strong>
                <asp:Label ID="Label9" runat="server" CssClass="auto-style14" Text="Label"></asp:Label>
                </strong>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Image ID="Image1" runat="server" />
                <br />
                <br />
                <table class="auto-style1">
                    <tr>
                        <td>
                            <strong>
                            <asp:CheckBox ID="CheckBox1" runat="server" CssClass="auto-style7" Text="Checkkkk" />
                            </strong>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style6">
                            <strong>
                            <asp:CheckBox ID="CheckBox2" runat="server" CssClass="auto-style7" Text="Checkkkk" />
                            </strong>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>
                            <asp:CheckBox ID="CheckBox3" runat="server" CssClass="auto-style7" Text="Checkkkk" />
                            </strong>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <strong>
                            <asp:CheckBox ID="CheckBox4" runat="server" CssClass="auto-style7" Text="Checkkkk" />
                            </strong>
                        </td>
                    </tr>
                </table>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <strong>
                <asp:Button ID="Button2" runat="server" BorderStyle="None" CssClass="auto-style13" Height="45px" OnClick="Button2_Click" Text="Next" Width="225px" />
                <asp:Button ID="Button3" runat="server" BorderStyle="None" CssClass="auto-style12" Height="45px" OnClick="Button3_Click" Text="Submit" Width="225px" />
                </strong>
            </asp:Panel>
            <br />
        </div>
    </form>
</body>
</html>
