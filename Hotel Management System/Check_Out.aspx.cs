using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Check_Out : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd, cmd1, cmd2, cmd3, cmd4, cmd5, cmd6;
    SqlDataReader dr, dr1, dr2;    
    
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label14.Text = "";
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        con.Open();
        cmd = new SqlCommand("select check_out from Chk_In where Customer_Id = '"+ txt_chk_out_cust.Text +"'",con);
        dr = cmd.ExecuteReader();
        dr.Read();       
        string date = Convert.ToString(dr[0]);
        txt_chk_out_date.Text = date;        
        dr.Close();

        string time = DateTime.Now.ToString("hh:mm:ss tt");
        txt_chk_out_time.Text = time;

        cmd1 = new SqlCommand("select Room_type,No_of_days from Adv_Booking where Customer_Id = '" + txt_chk_out_cust.Text + "'", con);
        dr1 = cmd1.ExecuteReader();
        dr1.Read();
        int days = Convert.ToInt32(dr1[1]);
        string room_type = Convert.ToString(dr1[0]);
        txt_chk_out_no_days.Text = Convert.ToString(dr1[1]);
        txt_chk_out_rm_tp.Text = room_type;                    
        dr1.Close();

        cmd2 = new SqlCommand("select Room_Tariff from Room_Tariff where Room_Type='"+ txt_chk_out_rm_tp.Text +"'", con);
        dr2 = cmd2.ExecuteReader();
        dr2.Read();
        int w_out_tax = Convert.ToInt32(dr2[0]) * days;
        txt_chk_out_amnt.Text = Convert.ToString(w_out_tax);
        double tax = 0.05 * Convert.ToDouble(dr2[0]);
        txt_chk_out_tax.Text = Convert.ToString(tax);
        double total_amount = Convert.ToInt32(txt_chk_out_amnt.Text) + tax;
        txt_chk_out_t_amnt.Text = Convert.ToString(total_amount);        
        dr2.Close();        
        con.Close();        
    }

    protected void btn_chk_out_Click(object sender, EventArgs e)
    {        
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        con.Open();
        cmd3 = new SqlCommand("delete from Adv_Booking where Customer_Id = '" + txt_chk_out_cust.Text + "' ", con);
        cmd4 = new SqlCommand("delete from Chk_In where Customer_Id = '" + txt_chk_out_cust.Text + "' ", con);
        cmd5 = new SqlCommand("delete from Room_Booking where cus_id = '" + txt_chk_out_cust.Text + "'", con);
        cmd6 = new SqlCommand("insert into Chk_Out (chk_out_date,chk_out_time,Customer_Id,noofdays,total,tax,amount) values (@chk_out_date,@chk_out_time,@Customer_Id,@noofdays,@total,@tax,@amount)",  con);

        cmd6.Parameters.AddWithValue("@chk_out_date", txt_chk_out_date.Text);
        cmd6.Parameters.AddWithValue("@chk_out_time", txt_chk_out_time.Text);
        cmd6.Parameters.AddWithValue("@Customer_Id", txt_chk_out_cust.Text);
        cmd6.Parameters.AddWithValue("@noofdays", txt_chk_out_no_days.Text);
        cmd6.Parameters.AddWithValue("@total", txt_chk_out_amnt.Text);
        cmd6.Parameters.AddWithValue("@tax", txt_chk_out_tax.Text);
        cmd6.Parameters.AddWithValue("@amount", txt_chk_out_t_amnt.Text);
        cmd6.ExecuteNonQuery();
        int rows = cmd3.ExecuteNonQuery();
        int rows1 = cmd4.ExecuteNonQuery();
        int rows2 = cmd5.ExecuteNonQuery();
        if (rows > 0 && rows1 > 0 && rows2 > 0)
        {
            Label14.Text = "Checked Out Successfully";
        }        
        con.Close();
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", 
        "alert('room rent : Rs. "+txt_chk_out_amnt.Text+" | tax : Rs. "+txt_chk_out_tax.Text+" | total payable : Rs. " + txt_chk_out_t_amnt.Text+"')", true);
    }
}