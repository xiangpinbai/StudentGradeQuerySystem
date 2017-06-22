using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Configuration;
using System.IO;
public partial class StudentPages : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!Page.IsPostBack)
        {

            if (Session["stdXh"] != null)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["stuInfoConnectionString"].ConnectionString); //declare and instantiate new SQL connection
                                                                                                                                           //SqlCommand cmd;
                string stdXh = Session["stdXh"].ToString();
                con.Open();
                string s = "Select stdXm from stdInfo where stdXh='" + stdXh + "' ";
                //SqlDataAdapter sda = new SqlDataAdapter(s, con);
                //DataSet ds = new DataSet();
                //sda.Fill(ds);
                //Label_welcome.Text += Session["techNum"].ToString();
                SqlCommand sql = new SqlCommand(s, con);
                SqlDataReader dr = sql.ExecuteReader();
                while(dr.Read())
                { 
                Label_welcome.Text += dr["stdXm"].ToString();
                }
                con.Close();
                //头像
                con.Open();
                string s2 = "Select stdFace from stdInfo where stdXh='" + stdXh + "'";
                SqlCommand sql2 = new SqlCommand(s2, con);
                SqlDataReader dr2 = sql2.ExecuteReader();
                string image="";
                while (dr2.Read())
                { 
                    image = dr2["stdFace"].ToString() ;
                
                }
                if (image.Length <= 0)
                {
                    image = "uploadedimages/default.png";
                }
                Image1.ImageUrl = image;

            }
            else
            {
                Response.Redirect("~/Login1.aspx");

            }
        }
        else
        {
            if (Session["stdXh"] == null)
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
        Session["stdXh"] = null;
        Response.Redirect("~/Login1.aspx");
    }
    protected void info_modify(object sender, EventArgs e)
    {
        //Session["stdXh"] = null;
        Response.Redirect("ModifyPwd.aspx");
    }
    protected void chick_score(object sender, EventArgs e)
    {
        //Session["stdXh"] = null;
        Response.Redirect("showSource.aspx");
    }
}
