using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
public partial class StudentPages : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {

            if (Session["adminuser"] != null)
            {
                Label_welcome.Text += Session["adminuser"].ToString();


            }
            else
            {
                Response.Redirect("~/Login1.aspx");

            }
        }
        else
        {
            if (Session["adminuser"] == null)
            {
                Response.Redirect("~/Login1.aspx");

            }

        }
    }
    private void LoadImage()
    {


    }
    protected void Log_Out(object sender, EventArgs e)
    {
        Session["adminuser"] = null;
        Response.Redirect("../Login1.aspx");
    }
    //protected void info_modify(object sender, EventArgs e)
    //{
    //    //Session["stdXh"] = null;
    //    Response.Redirect("ModifyInfo.aspx");
    //}
    //protected void chick_score(object sender, EventArgs e)
    //{
    //    //Session["stdXh"] = null;
    //    Response.Redirect("showSource.aspx");
    //}
}
