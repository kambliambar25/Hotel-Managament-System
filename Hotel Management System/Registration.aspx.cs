using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class Regstration : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Header.Title = "Registration";
        
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        con.Open();

        cmd = new SqlCommand("SELECT max(Customer_Id) FROM Registration", con);
        dr = cmd.ExecuteReader();

        try
        {
            if (dr.Read())
            {
                object o = dr[0];
                int i = Convert.ToInt32(o);
                int c = i + 1;
                TextBox10.Text = " " + c;
            }
        }
        catch
        {
            TextBox10.Text = "1";
        }
            
        dr.Close();
        con.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string x1 = "-";

        if (TextBox3.Text != "" && TextBox9.Text != "")
        {
            TextBox3.Text = x1;
            TextBox9.Text = x1;
        }
        try
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            con.Open();

            cmd = new SqlCommand("INSERT INTO Registration (Customer_Id,cname,contact_1,contact_2,addr,email,cpassword,security_que,ans,ref) VALUES(@Customer_Id,@cname,@contact_1,@contact_2,@addr,@email,@cpassword,@security_que,@ans,@ref)", con);
            cmd.Parameters.AddWithValue("@Customer_Id", TextBox10.Text);
            cmd.Parameters.AddWithValue("@cname", TextBox1.Text);
            cmd.Parameters.AddWithValue("@contact_1", TextBox2.Text);
            cmd.Parameters.AddWithValue("@contact_2", x1);
            cmd.Parameters.AddWithValue("@addr", TextBox4.Text);
            cmd.Parameters.AddWithValue("@email", TextBox5.Text);
            cmd.Parameters.AddWithValue("@cpassword", TextBox6.Text);
            cmd.Parameters.AddWithValue("@security_que", DropDownList1.Text);
            cmd.Parameters.AddWithValue("@ans", TextBox8.Text);
            cmd.Parameters.AddWithValue("@ref", x1);

            int rows = cmd.ExecuteNonQuery();
            if (rows == 1)
            {
                lbl_ack.Text = "Registration successful";
            }
        }
        catch
        {
            lbl_ack.Text = "Error, Contact Admin";
        }

        dr.Close();
        con.Close();

        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";
        TextBox6.Text = "";
        TextBox7.Text = "";
        TextBox8.Text = "";
        TextBox9.Text = "";
        TextBox10.Text = "";
        DropDownList1.Text = "";
    }    
}