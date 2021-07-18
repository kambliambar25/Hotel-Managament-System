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

public partial class Forget_PW : System.Web.UI.Page
{
    SqlConnection conn;
    SqlCommand cmd;
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        //4 title of the page
        Page.Header.Title = "Forgot Password";
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        //get question
        conn = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        conn.Open();

        cmd = new SqlCommand("SELECT security_Que FROM Registration where email = '" + TextBox1.Text + "'", conn);
        dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            TextBox2.Text = dr[0].ToString();
        }
        else
        {
            Response.Write("<script type=text/javascript>alert('Invalid Username or Password');</script>");
        }
        dr.Close();
        conn.Close();

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != "" && TextBox2.Text != "" && TextBox3.Text != "")
        {
            //get password
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            conn.Open();

            cmd = new SqlCommand("SELECT cpassword FROM Registration where email = '" + TextBox1.Text + "' AND security_que ='" + TextBox2.Text + "' AND ans = '" + TextBox3.Text + "'", conn);
            dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                TextBox4.Text = dr[0].ToString();
            }
            else
            {
                Response.Write("<script type=text/javascript>alert('Invalid Information');</script>");
                TextBox4.Text = "";
            }
            dr.Close();
            conn.Close();
        }
    }
}
