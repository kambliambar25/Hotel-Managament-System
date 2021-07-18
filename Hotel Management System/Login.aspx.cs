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

public partial class Login : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd,cmd1;
    SqlDataReader dr, dr1;

    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Header.Title = "Login";

        //wrong login      
            if (Session["wronglongin"] != null)
            {
                lbl1.Visible = true;
            }
            else
            {
                lbl1.Visible = false;
            }      
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        con.Open();

        cmd = new SqlCommand("SELECT Customer_Id,cname,email,cpassword FROM Registration where email = '" + TextBox1.Text + "' AND cpassword ='" + TextBox2.Text + "'", con);
        cmd1 = new SqlCommand("select admin_Id,admin_name,email,admin_password from Admin_Registration where email = '" + TextBox1.Text + "' and admin_password = '" + TextBox2.Text + "'", con);
               
        dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            Session["cid"] = dr["Customer_Id"];
            Session["cnm"] = dr["cname"];
            Session["wronglongin"] = null;

            
            Response.Write("<script language='javascript'>alert('Login successful!');</script>");
            Response.Redirect("Advance_Booking.aspx");
        }
        else
        {
            Response.Write("<script type=text/javascript>alert('Please Enter Correct Details');</script>");
        }
        dr.Close();

        dr1 = cmd1.ExecuteReader();

        if (dr1.Read())
        {
            Session["adminid"] = dr1["admin_Id"];
            Session["adminnm"] = dr1["admin_name"];
            Session["wronglongin"] = null;
            
            Response.Redirect("Check_In.aspx");
            Response.Write("<script type=text/javascript>alert('Login Successful');</script>");
        }
        else
        {
            Response.Write("<script type=text/javascript>alert('Please Enter Correct Details');</script>");
        }
        dr1.Close();
        con.Close();
    }
}
