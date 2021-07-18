<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Advance_Booking.aspx.cs" Inherits="Advance_Booking" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    #dtpick{display:none;}
</style>

<script type="text/javascript">
    function show1()
    {
        var datePicker = document.getElementById('dtpick');
        if(datePicker.style.display == 'block')
        {
            datePicker.style.display='none';
        }
        else
        {
            datePicker.style.display='block';
        }
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="position:absolute;left:325px;margin-top:0px; top: 213px; width: 647px;">
<table cellspacing="5px" width="600px">
    <tr>
        <td colspan="2"><h1 style="text-align:center">Advance Booking</h1></td>
    </tr>
    
    <tr>
        <td align="right" ><asp:Label ID="Label1" runat="server" 
                Text="Customer ID" Width="200px" />&nbsp:&nbsp</td>
        <td> 
            <asp:TextBox ID="TextBox1" runat="server" Width="95px" 
                 ReadOnly="True" 
                BackColor="#D2DAC0" /> 
            <asp:Label ID="Label13" runat="server" Width="125px"
                Text="Auto Generated."></asp:Label>
        </td>
    </tr>
    
    <tr>
        <td align="right" ><asp:Label ID="Label12" runat="server" 
                Text="Customer Name" />&nbsp:&nbsp</td>
        <td> 
            <asp:TextBox ID="TextBox2" runat="server" Width="192px" 
                 ReadOnly="True" 
                BackColor="#D2DAC0" /> 
            <asp:Label ID="Label14" runat="server" Width="125px"
                Text="Auto Generated."></asp:Label>
            <asp:DropDownList ID="DropDownList2" runat="server" Visible="False">
            </asp:DropDownList>
        </td>
    </tr>
    
    <tr>
        <td align="right" ><asp:Label ID="Label11" runat="server" 
                Text="Date" />&nbsp:&nbsp</td>
        <td> 
            <asp:TextBox ID="TextBox3" runat="server" Width="192px" 
                 ReadOnly="True" /> 
                <img src="Images/Calendar.gif"alt="Text alternative when image is not available" onclick="show1()" />
        <div id="dtpick"><asp:Calendar ID="Calendar1" SelectedDayStyle-BackColor="Gray" 
                runat="server" SelectedDate="<%# DateTime.Now %>" 
                OnSelectionChanged="Calendar1_SelectionChanged" 
                ondayrender="Calendar1_DayRender"></asp:Calendar></div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox3">Enter Date</asp:RequiredFieldValidator>
        </td>
    </tr>
    
    <tr>
        <td align="right" > <asp:Label ID="Label2" runat="server" Text="Room Type" />&nbsp:&nbsp</td>
        <td> 
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="Hotel_mgt" DataTextField="Room_Type" DataValueField="Room_Type" Height="16px" Width="145px">
                <asp:ListItem Selected="True">Select</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="Hotel_mgt" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>" SelectCommand="SELECT * FROM [Room_Tariff]"></asp:SqlDataSource>
        </td>
    </tr>
    
    <tr>
        <td align="right" > <asp:Label ID="Label3" runat="server" Text="No. of Rooms" />&nbsp:&nbsp</td>
        <td> 
            <asp:TextBox ID="TextBox4" runat="server" Width="74px" 
                 /> 
        </td>
    </tr>
    
    <tr>
        <td align="right" > No. of Days&nbsp:&nbsp</td>
        <td> 
            <asp:TextBox ID="TextBox5" runat="server" MaxLength="10" 
                 Width="74px" ></asp:TextBox>
            &nbsp;
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ControlToValidate="TextBox5" ErrorMessage="RegularExpressionValidator" 
                ValidationExpression="[0-9]{1,}">Enter necessary Information</asp:RegularExpressionValidator>
        </td>
    </tr>
    
    <tr>
        <td colspan="2" align="center">
            <br />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Check Availability" />
            <br />
            <br />
            <asp:Label ID="Label15" runat="server"></asp:Label>
            <asp:Label ID="lbl1" Text="Rooms Available" runat="server" Visible="false"></asp:Label>
            <br />
        </td>
    </tr>
        
    <tr>
        <td colspan="2" align="center">
            <asp:Button ID="Button1" runat="server"  Text="Submit" 
                onclick="Button1_Click" Enabled="False" /> &nbsp
            <asp:Button ID="Button2" runat="server"  Text="Cancel" 
                onclick="Button2_Click" />
            
        </td>
    </tr>
    
    </table>
    </div>

</asp:Content>

