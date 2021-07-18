<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Regstration" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">
    function abc(x)
{
    //alert("AAA");
    document.getElementById(x).style.background="Yellow";
}

function xyz(x)
{
    document.getElementById(x).style.background="";
}

    </script>
    <style type="text/css">
        .style1
        {
            width: 152px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="position:absolute;left:275px;margin-top:0px">
<table cellspacing="5px" width="700px" >
    <tr>
        <td colspan="2"><h1 style="text-align:center">Customer Registration</h1></td>
    </tr>
    
    <tr>
        <td align="right" style="width:250px"><asp:Label ID="Label11" runat="server" Text="Custoer ID" />&nbsp:&nbsp</td>
        <td style="width:450px"> 
            <asp:TextBox ID="TextBox10" runat="server" Width="122px" 
                onfocus="abc(this.id)" onblur="xyz(this.id)" ReadOnly="True" 
                BackColor="#D2DAC0" /> 
        &nbsp;<asp:Label ID="Label12" runat="server" Width="279px"
                Text="Auto Generated, useful later."></asp:Label>
        </td>
    </tr>
    
    <tr>
        <td align="right"><asp:Label ID="Label1" runat="server" Text="Name" />&nbsp:&nbsp</td>
        <td> <asp:TextBox ID="TextBox1" runat="server" Width="197px" 
                onfocus="abc(this.id)" onblur="xyz(this.id)" /> 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox1" ErrorMessage="Enter Name" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="TextBox1" ValidationExpression="[A-Z a-z]+" 
                Display="Dynamic">Enter Proper 
            Name</asp:RegularExpressionValidator>
        </td>
    </tr>
    
     <tr>
        <td align="right" > <asp:Label ID="Label2" runat="server" Text="Contact No 1" />&nbsp:&nbsp</td>
        <td> <asp:TextBox ID="TextBox2" runat="server" MaxLength="10" 
                onfocus="abc(this.id)" onblur="xyz(this.id)" /> 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBox2" Display="Dynamic">Enter Contact No.</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ControlToValidate="TextBox2" ErrorMessage="RegularExpressionValidator" 
                ValidationExpression="[0-9]{10}" Display="Dynamic">Enter Proper Contact No</asp:RegularExpressionValidator>
        </td>
    </tr>
    
    <tr>
        <td align="right" > <asp:Label ID="Label3" runat="server" Text="Contact No 2" />&nbsp:&nbsp</td>
        <td> <asp:TextBox ID="TextBox3" runat="server" MaxLength="10" 
                onfocus="abc(this.id)" onblur="xyz(this.id)" /> 
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                ControlToValidate="TextBox3" ErrorMessage="RegularExpressionValidator" 
                ValidationExpression="[0-9]{10}">Enter Proper Contact No</asp:RegularExpressionValidator>
        </td>
    </tr>
    
    <tr>
        <td align="right" > <asp:Label ID="Label4" runat="server" Text="Address" />&nbsp:&nbsp</td>
        <td> <asp:TextBox ID="TextBox4" runat="server" Height="73px" TextMode="MultiLine"  
                onfocus="abc(this.id)" onblur="xyz(this.id)" Width="233px" /> 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="TextBox4" ErrorMessage="RequiredFieldValidator">Enter 
            Address</asp:RequiredFieldValidator>
        </td>
    </tr>

    <tr>
        <td align="right" > <asp:Label ID="Label5" runat="server" Text="Email" />&nbsp:&nbsp</td>
        <td> <asp:TextBox ID="TextBox5" runat="server"
                onfocus="abc(this.id)" onblur="xyz(this.id)" /> 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="TextBox5" ErrorMessage="RequiredFieldValidator">Enter 
            Email id</asp:RequiredFieldValidator>
        </td>
    </tr>

    <tr>
        <td align="right" > <asp:Label ID="Label6" runat="server" Text="Password" />&nbsp:&nbsp</td>
        <td> <asp:TextBox ID="TextBox6" runat="server" TextMode="Password" 
                onfocus="abc(this.id)" onblur="xyz(this.id)"/>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="TextBox6" ErrorMessage="RequiredFieldValidator">Enter 
            Password</asp:RequiredFieldValidator>
        </td>
    </tr>

    <tr>
        <td align="right" > <asp:Label ID="Label7" runat="server" Text="Confirm Password" />&nbsp:&nbsp</td>
        <td> <asp:TextBox ID="TextBox7" runat="server" TextMode="Password" Width="128px"
                onfocus="abc(this.id)" onblur="xyz(this.id)" /> &nbsp;<asp:CompareValidator 
                ID="CompareValidator1" runat="server" ControlToCompare="TextBox6" 
                ControlToValidate="TextBox7" ErrorMessage="CompareValidator">Password Must 
            Match</asp:CompareValidator>
        </td>
    </tr>

    <tr>
        <td align="right" > <asp:Label ID="Label8" runat="server" Text="Security Question" />&nbsp:&nbsp</td>
        <td> <asp:DropDownList ID="DropDownList1" runat="server" onfocus="abc(this.id)" onblur="xyz(this.id)" >
            <asp:ListItem Selected="True" Value="none"><--select--></asp:ListItem>
            <asp:ListItem>What is the name of your childhood friend ?</asp:ListItem>
            <asp:ListItem>What was your first phone number ?</asp:ListItem>
            <asp:ListItem>What town were you born in ?</asp:ListItem>
            <asp:ListItem>What was the name of your first teacher ?</asp:ListItem>
            <asp:ListItem>Who is your favourite author ?</asp:ListItem>
            <asp:ListItem>What is your favourite food ?</asp:ListItem>
            <asp:ListItem>What was the name of your school ?</asp:ListItem>
        </asp:DropDownList> 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" InitialValue="none"  runat="server" 
                ControlToValidate="DropDownList1" ErrorMessage="RequiredFieldValidator">Select 
            Question</asp:RequiredFieldValidator>
        </td>
    </tr>
    
    <tr>
        <td align="right" > <asp:Label ID="Label9" runat="server" Text="Answer" />&nbsp:&nbsp</td>
        <td> <asp:TextBox ID="TextBox8" runat="server" Width="275px"
                onfocus="abc(this.id)" onblur="xyz(this.id)" /> 
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ControlToValidate="TextBox8" ErrorMessage="RequiredFieldValidator">Write 
            Answer</asp:RequiredFieldValidator>
        </td>
    </tr>
    
    <tr>
        <td align="right" > <asp:Label ID="Label10" runat="server" Text="Reference" />&nbsp:&nbsp</td>
        <td> <asp:TextBox ID="TextBox9" runat="server" 
                onfocus="abc(this.id)" onblur="xyz(this.id)" /> </td>
    </tr>
    <tr>
        <td></td>
        <td>
            <asp:Label ID="lbl_ack" runat="server" Text=""/>
        </td>
    </tr>
    <tr>
        <td  colspan="2" align="center">
            <asp:Button ID="Button1" runat="server"  Text="Submit" 
                onclick="Button1_Click" /> &nbsp
            <asp:Button ID="Button2" runat="server"  Text="Reset" />
        </td>
    </tr>
    
    </table>
    </div>
</asp:Content>

