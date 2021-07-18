using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Check_In : System.Web.UI.Page
{
    SqlConnection con;
    SqlDataReader dr, dr1;
    SqlCommand cmd, cmd1;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {                
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        con.Open();

        //Fetching data from table "Registration
        cmd = new SqlCommand("select cname from registration where Customer_Id = '" + txt_cust_id.Text + "' ",con);
        dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            txt_cust_name.Text = Convert.ToString(dr[0]);
        }
        dr.Close();

        //Fetching data from table "Chk_In"
        cmd1 = new SqlCommand("select chk_in_date, Room_No, No_of_Days,check_out from Chk_In where Customer_Id = '" + txt_cust_id.Text + "'",con);
        dr1 = cmd1.ExecuteReader();

        if(dr1.Read())
        {
            txt_chk_dte.Text = Convert.ToString(dr1[0]);
            txt_rm_nu.Text = Convert.ToString(dr1[1]);
            txt_days_nu.Text = Convert.ToString(dr1[2]);
            txt_chk_out.Text = Convert.ToString(dr1[3]);            
        }
        dr1.Close();

        con.Close();
    }

    protected void btn_confirm_Click(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        con.Open();
        cmd = new SqlCommand("insert into Room_Booking (bkng_date,room_no,cus_id) values (@bkng_date,@room_no,@cus_id)", con);
        cmd.Parameters.AddWithValue("@bkng_date",txt_chk_dte.Text);
        cmd.Parameters.AddWithValue("@room_no",txt_rm_nu.Text);
        cmd.Parameters.AddWithValue("@cus_id",txt_cust_id.Text);
        int rows = cmd.ExecuteNonQuery();
        if(rows > 0)
        {
            lbl_ackno.Text = "Room Booked";
        }
    }
}