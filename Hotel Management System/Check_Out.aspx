<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Check_Out.aspx.cs" Inherits="Check_Out" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellspacing="5px" width="100%">
    <tr>
        <td colspan="2"><h1 style="text-align:center">Check Out</h1></td>
    </tr>
    
    <tr>
        <td align="right" class="auto-style1" ><asp:Label ID="Label1" runat="server" 
                Text="Customer ID" Width="200px" />&nbsp:&nbsp</td>
        <td class="auto-style2"> 
            
            <br />
            <br />
            
            <asp:TextBox ID="txt_chk_out_cust" runat="server"></asp:TextBox>
        &nbsp;&nbsp;<br />
            <br />
&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Fill" Width="54px" />
        </td>
    </tr>
        <tr>
        <td align="right" class="auto-style1" ><asp:Label ID="Label2" runat="server" 
                Text="Check Out Date" Width="200px" />&nbsp:&nbsp</td>
        <td class="auto-style2"> 
            
            <asp:TextBox ID="txt_chk_out_date" runat="server"></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td align="right" class="auto-style1" ><asp:Label ID="Label3" runat="server" 
                Text="Check Out Time" Width="200px" />&nbsp:&nbsp</td>
        <td class="auto-style2"> 
            
            <asp:TextBox ID="txt_chk_out_time" runat="server"></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td align="right" class="auto-style1" ><asp:Label ID="Label4" runat="server" 
                Text="Number of Days" Width="200px" />&nbsp:&nbsp</td>
        <td class="auto-style2"> 
            
            <asp:TextBox ID="txt_chk_out_no_days" runat="server"></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td align="right" class="auto-style1" ><asp:Label ID="Label8" runat="server" 
                Text="Room Type" Width="200px" />&nbsp:&nbsp</td>
        <td class="auto-style2"> 
            
            <asp:TextBox ID="txt_chk_out_rm_tp" runat="server"></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td align="right" class="auto-style1" ><asp:Label ID="Label5" runat="server" 
                Text="Amount " Width="200px" />&nbsp:&nbsp</td>
        <td class="auto-style2"> 
            
            <asp:TextBox ID="txt_chk_out_amnt" runat="server"></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td align="right" class="auto-style1" ><asp:Label ID="Label6" runat="server" 
                Text="G.S.T (services)" Width="200px" />&nbsp:&nbsp</td>
        <td class="auto-style2"> 
            
            <asp:TextBox ID="txt_chk_out_tax" runat="server" ReadOnly="true" Text=""></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td align="right" class="auto-style1" ><asp:Label ID="Label7" runat="server" 
                Text="Total Amount" Width="200px" />&nbsp:&nbsp</td>
        <td class="auto-style2"> 
            
            <asp:TextBox ID="txt_chk_out_t_amnt" runat="server"></asp:TextBox>
        </td>
    </tr>
        <tr>
        <td class="auto-style1">
            <asp:Label ID="lbl_usable" runat="server"></asp:Label>
            </td>
        <td class="auto-style2"> 
            <br />
            <asp:Button ID="btn_bill" runat="server" OnClick="Button2_Click" Text="Generate Bill" />
            <br />
            <br />
            <asp:Button ID="btn_chk_out" runat="server" Text="CHECK OUT !!!" OnClick="btn_chk_out_Click" />
            <br />
            <br />
            <asp:Label ID="Label14" runat="server"></asp:Label>
        </td>
    </tr>
        </table>
</asp:Content>

