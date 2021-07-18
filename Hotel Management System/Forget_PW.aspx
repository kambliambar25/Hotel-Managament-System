<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Forget_PW.aspx.cs" Inherits="Forget_PW" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="JS/JScript.js">
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="position:absolute;left:475px;top:225px;width:500px; border:solid red">
<table cellspacing="5px" cellpadding="5px">
        <tr>
            <td colspan="2" align="center"><h2>Forgot Password?<br /> &nbsp;&nbsp;&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Don't Worry 
                ...</h2></td>
        </tr>
        <tr>
            <td align="right"> <asp:Label ID="Label1" runat="server" Text="Email" /> </td>
            <td> <asp:TextBox ID="TextBox1" runat="server" onfocus="abc(this.id)" 
                    onblur="xyz(this.id)" AutoCompleteType="Email" /> &nbsp;<asp:Button 
                    ID="Button3" runat="server" onclick="Button3_Click" Text="Get Question" 
                    Width="99px" />
            </td>
        </tr>
    
        <tr>
            <td align="right"> <asp:Label ID="Label2" runat="server" Text="Security Question" /> </td>
            <td> 
                <asp:TextBox ID="TextBox2" runat="server" Width="286px" onfocus="abc(this.id)" 
                    onblur="xyz(this.id)" Enabled="False" BackColor="#D2DAC0" 
                    ReadOnly="True" /> </td>
        </tr>
        
        <tr>
            <td align="right"> <asp:Label ID="Label3" runat="server" Text="Answer" onfocus="abc(this.id)" onblur="xyz(this.id)" /> </td>
            <td> <asp:TextBox ID="TextBox3" AutoCompleteType="Disabled" runat="server" 
                    onfocus="abc(this.id)" onblur="xyz(this.id)" /> </td>
        </tr>
        
        <tr>
            <td align="right"> <asp:Label ID="Label4" runat="server" Text="Your Password" /> </td>
            <td> <asp:TextBox ID="TextBox4" runat="server" onfocus="abc(this.id)" 
                    onblur="xyz(this.id)" Enabled="False" ReadOnly="True" 
                    BackColor="#D2DAC0" /> </td>
        </tr>
        
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="Button1" runat="server" Text="Find Password" Width="103px" 
                     style="height: 26px" onclick="Button1_Click" />&nbsp;
                <asp:Button ID="Button2" runat="server" Text="Cancel" Width="60px" /> 
            </td>
        </tr>
    
        
    </table>
</div>

</asp:Content>

