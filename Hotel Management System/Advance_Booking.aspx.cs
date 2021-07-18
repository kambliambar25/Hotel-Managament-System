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

public partial class Advance_Booking : System.Web.UI.Page
{
    SqlConnection con, con1;
    SqlCommand cmd, cmd1;
    SqlDataReader dr, dr1;

    protected void Page_Load(object sender, EventArgs e)
    {
        //4 cid and name automatically from session
        if (Session["adminid"] != null)
        {
            TextBox1.ReadOnly = false;
            TextBox2.ReadOnly = false;

            Label1.Visible = false;
            Label13.Visible = false;
            Label14.Visible = false;

            TextBox1.Visible = false;
            TextBox2.Visible = false;

            Label12.Text = "Customer Id & Name";
            DropDownList2.Visible = true;
            if (!Page.IsPostBack)
            {
                Page.Header.Title = "Advance Booking";

                con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
                con.Open();

                cmd = new SqlCommand("SELECT Customer_Id,cname FROM Registration", con);
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    DropDownList2.Items.Add(dr[0].ToString() + " - " + dr[1].ToString());
                }
                dr.Close();
                con.Close();
            }

        }
        else if (Session["cid"] != null)
        {
            Label1.Visible = true;
            Label13.Visible = true;
            Label14.Visible = true;

            TextBox1.Visible = true;
            TextBox2.Visible = true;
            Label15.Visible = true;
            Label12.Text = "Customer Name";
            DropDownList2.Visible = false;

            TextBox1.Text = Session["cid"].ToString();
            TextBox2.Text = Session["cnm"].ToString();
            TextBox1.ReadOnly = true;
            TextBox2.ReadOnly = true;
        }
        else
        {
            Session["wronglongin"] = "yes";
            Response.Redirect("Login.aspx");
        }

        TextBox3.Text = DateTime.Now.ToString("D");
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        TextBox3.Text = Calendar1.SelectedDate.ToString("D");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox3.Text = DateTime.Now.ToString("D");
        TextBox5.Text = "1";
    }
  
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        if (e.Day.Date < System.DateTime.Today)
        {
            // Disable date
            e.Day.IsSelectable = false;
            // Change color of disabled date
            e.Cell.ForeColor = System.Drawing.Color.Red;
            e.Cell.ToolTip = "This date is not available";
        }
    }   

    protected void Button3_Click(object sender, EventArgs e)
    {
         if (TextBox3.Text != "" && TextBox4.Text != "" && TextBox5.Text != "")
         {
            int totroom = 0, availableroom = 0, bookedroom = 0, r = 0;

            con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
            con.Open();

            cmd = new SqlCommand("SELECT count(Room_type) FROM Room_Master where room_type ='" + DropDownList1.Text + "'", con);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                totroom = Convert.ToInt32(dr[0].ToString());
            }
            dr.Close();
            
            cmd1 = new SqlCommand("SELECT count(Room_type) FROM Adv_Booking where Adv_Date = '"+TextBox3.Text+"' AND Room_type ='" + DropDownList1.Text + "'", con);
            dr1 = cmd1.ExecuteReader();
            if (dr1.Read())
            {
                bookedroom = Convert.ToInt32(dr1[0]);
                availableroom = (totroom - bookedroom);
            }
            r = Convert.ToInt32(TextBox4.Text);

            if (availableroom >= r)
            {
                Button1.Enabled = true;
                lbl1.Visible = true;
                lbl1.Text = "Rooms Available";
            }
            else
            {
                Button1.Enabled = false;
                lbl1.Visible = true;
                lbl1.Text = "Sorry, Rooms are NOT Available";
            }
            dr1.Close();
            con.Close();
        }
        else
        {
            Response.Write("<script type='text/javascript'>alert('Enter necessary information');</script>");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int i = Convert.ToInt32(TextBox5.Text);
        DateTime j = Convert.ToDateTime(TextBox3.Text);       

        string onlydate = j.ToShortDateString();

        DateTime Chk_out_dte = j.AddDays(i);


        string nowtime = DateTime.Now.ToShortTimeString();

        string blank = "-";
        int No_days = Convert.ToInt32(TextBox5.Text);
        lbl1.Visible = false;
        string[] temp = new string[2];
        if (DropDownList2.Visible == true)
        {
            temp = ((DropDownList2.Text).Split('-'));
        }
        else if (TextBox1.Visible == true)
        {
            temp[0] = TextBox1.Text;
            temp[1] = TextBox2.Text;
        }

        con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        con.Open();

        cmd = new SqlCommand("INSERT INTO Adv_Booking(Customer_Id,cname,Adv_Date,Room_type,No_of_rooms,No_of_days,check_in) values(@Customer_Id,@cname,@Adv_Date,@Room_type,@No_of_rooms,@No_of_days,@check_in)", con);

        cmd.Parameters.AddWithValue("@Customer_Id", temp[0].Trim());
        cmd.Parameters.AddWithValue("@cname", temp[1].Trim());
        cmd.Parameters.AddWithValue("@Adv_Date", Convert.ToDateTime(onlydate));
        cmd.Parameters.AddWithValue("@Room_type", DropDownList1.Text);
        cmd.Parameters.AddWithValue("@No_of_rooms", Convert.ToInt32(TextBox4.Text));
        cmd.Parameters.AddWithValue("@No_of_days", TextBox5.Text);
        cmd.Parameters.AddWithValue("@check_in", blank);

        Label15.Text = "Registered for Advanced Booking successfully";
        int rows = cmd.ExecuteNonQuery();
        TextBox3.Text = "";
        TextBox4.Text = "";
        TextBox5.Text = "";

        con.Close();

        SqlConnection connection;
        SqlCommand command;

        connection = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        connection.Open();

        command = new SqlCommand("insert into Chk_In (chk_in_date,chk_in_time,Customer_Id,Room_No,No_of_Days,check_out) values (@chk_in_date,@chk_in_time,@Customer_Id,@Room_No,@No_of_Days,@check_out)", connection);
        command.Parameters.AddWithValue("@chk_in_date", Convert.ToDateTime(onlydate));
        command.Parameters.AddWithValue("@chk_in_time", Convert.ToDateTime(nowtime));
        command.Parameters.AddWithValue("@Customer_Id", TextBox1.Text);
        command.Parameters.AddWithValue("@Room_no", blank);
        command.Parameters.AddWithValue("@No_of_Days", No_days);
        command.Parameters.AddWithValue("@check_out", Chk_out_dte);

        command.ExecuteNonQuery();

        Button1.Enabled = false;
        command.Dispose();       
        connection.Close();
    }
}
