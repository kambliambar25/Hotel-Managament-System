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

public partial class Room_Tariff : System.Web.UI.Page
{
     SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
     

    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Header.Title = "Room Tariff";        
    }
    protected void BindDatainGridView(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        con.Open();

        cmd = new SqlCommand("SELECT room_type, AC_NonAc, room_tariff FROM Room_Master where room_no<=103", con);
        dr = cmd.ExecuteReader();
        GridView1.DataSource = dr;
        GridView1.DataBind();
        con.Close();
    }
}
