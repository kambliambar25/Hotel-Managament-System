<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
	/*function showhide(x1)
	{
		if(document.getElementById(x1).style.display=='block')
		{
			document.getElementById(x1).style.display='none';
		}
		else
		{
			document.getElementById(x1).style.display='block';
		}
	}*/
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
	//setInterval( "showhide('div1')", 500 );
</script>

<div id="div1" style="position:absolute;left:300px;top:225px">
    <asp:Label runat="server" ID="lbl1" Text="Login Required" Visible="false"></asp:Label>
</div>
<div style="position:absolute;left:675px;top:225px;border:solid red">
<table cellspacing="5px" cellpadding="5px">
        <tr>
            <td align="right"> <asp:Label ID="Label1" runat="server" Text="Email" /> </td>
            <td> <asp:TextBox ID="TextBox1" runat="server"  AutoCompleteType="Email" /> </td>
        </tr>
    
        <tr>
            <td align="right"> <asp:Label ID="Label2" runat="server" Text="Password" /> </td>
            <td> <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"  /> </td>
        </tr>
        
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="Button1" runat="server" Text="Login" Width="60px" 
                     style="height: 26px" onclick="Button1_Click" />&nbsp;
                <asp:Button ID="Button2" runat="server" Text="Cancel" Width="60px" /> 
            </td>
        </tr>
    
        <tr>
            <td>
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Registration.aspx">Registration</asp:HyperLink>
            </td>
            <td align="right">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Forget_PW.aspx">Forgot Password</asp:HyperLink>
            </td>
        </tr>
    </table>
</div>
</asp:Content>