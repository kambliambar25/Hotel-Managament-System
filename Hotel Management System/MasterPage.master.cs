using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["cid"] != null)
        {
            LinkButton1.Visible = true;
            HyperLink8.Visible = false; //4 customer login  
            HyperLink2.Visible = false;
            HyperLink3.Visible = false;
        }
        else if (Session["adminid"] != null)
        {
            LinkButton1.Visible = true;            
            HyperLink8.Visible = false;//4 admin login
        }
        else
        {
            LinkButton1.Visible = false;
            HyperLink2.Visible = false;
            HyperLink3.Visible = false;
            HyperLink8.Visible = true;
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton1.Visible = false;
        string s11 = "";

        if (Session["cid"] == null)
        {
            s11 = "/Home.aspx";
        }
        else if (Session["adminid"] == null)
        {
            s11 = "/Home.aspx";
        }
        Session.RemoveAll();
        Response.Redirect(s11);

    }
}
