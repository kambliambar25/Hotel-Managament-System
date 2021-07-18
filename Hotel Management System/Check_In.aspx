<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Check_In.aspx.cs" Inherits="Check_In" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
    </p>
    <table  width="100%" style="border:dotted red">
        <tr>
            <td align="right">                
                <asp:Label ID="lbl_cust_id" runat="server" Text="Customer ID : "></asp:Label>&nbsp;&nbsp;                
            </td>
            <td>              
                <asp:Label ID="id_notice" runat="server" Text="Enter Customer ID to fill in Details"></asp:Label>
                <br />
                <asp:TextBox ID="txt_cust_id" runat="server" Width="158px"></asp:TextBox> 
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Check" />
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td align="right">                
                <asp:Label ID="lbl_cust_name" runat="server" Text="Customer Name : "></asp:Label>&nbsp;<br />
                &nbsp;&nbsp;                
            </td>
            <td>              
                <asp:TextBox ID="txt_cust_name" runat="server" Text="" ReadOnly="true" Width="158px"></asp:TextBox>
                <br />
                <br />
            </td>
        </tr>         
        <tr>
            <td align="right">
                <asp:Label ID="lbl_chk_dte" runat="server" Text="Check In Date :"></asp:Label>&nbsp;&nbsp;&nbsp<br />
                &nbsp
            </td>
            <td>
                <asp:TextBox ID="txt_chk_dte" runat="server" Text="" Width="158px"></asp:TextBox>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td align="right">                
                <asp:Label ID="lbl_rm_nu" runat="server" Text="Room Number : "></asp:Label>&nbsp;<br />
                &nbsp;&nbsp;                
            </td>
            <td>              
                <asp:TextBox ID="txt_rm_nu" runat="server" Text="" ReadOnly="true" Width="158px"></asp:TextBox>
                <br />
                <br />
            </td>
        </tr>
         <tr>
            <td align="right">                
                <asp:Label ID="lbl_days_nu" runat="server" Text="Number Of Days : "></asp:Label>&nbsp;&nbsp;<br />
                &nbsp;                
            </td>
            <td>              
                <asp:TextBox ID="txt_days_nu" runat="server" Text="" ReadOnly="true" Width="158px"></asp:TextBox>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td align="right">                
                <asp:Label ID="lbl_chk_out" runat="server" Text="Check Out : "></asp:Label>&nbsp;&nbsp;<br />
                &nbsp;                
            </td>
            <td>              
                <asp:TextBox ID="txt_chk_out" runat="server" Text="" ReadOnly="true" Width="158px"></asp:TextBox>
                <br />
                <br />
            </td>
        </tr>
    </table>

    <%-- Section code for spacing --%>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp

    <%-- confirm Button --%>
    <asp:Button ID="btn_confirm" runat="server" Text="  CONFIRM !  " OnClick="btn_confirm_Click" />

    <%-- Section code for spacing --%>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 

    <%-- Cancel buttom --%>
    <asp:Button ID="btn_cancel" runat="server" Text=" RETURN / CANCEL  " />

                                                                                                               
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    <asp:Label ID="lbl_ackno" runat="server" Text=""></asp:Label>

</asp:Content>