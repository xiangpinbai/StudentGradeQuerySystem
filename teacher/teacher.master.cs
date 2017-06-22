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

public partial class teacher_teacher : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            if (Session["techNum"] != null)
            {
                
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["stuInfoConnectionString"].ConnectionString); //declare and instantiate new SQL connection
                                                                                                                                           //SqlCommand cmd;
                string techNum = Session["techNum"].ToString();
                con.Open();
                string s = "Select techName from teachersInfo where techNum='" + techNum + "' ";
                //SqlDataAdapter sda = new SqlDataAdapter(s, con);
                //DataSet ds = new DataSet();
                //sda.Fill(ds);
                //Label_welcome.Text += Session["techNum"].ToString();
                SqlCommand sql = new SqlCommand(s, con);
                SqlDataReader dr = sql.ExecuteReader();
                dr.Read();
                Label_welcome.Text += dr["techName"].ToString();
                con.Close();
                //头像
                con.Open();
                string s2 = "Select techFace from teachersInfo where techNum='" + techNum + "'";
                SqlCommand sql2 = new SqlCommand(s2, con);
                SqlDataReader dr2 = sql2.ExecuteReader();
                string image = "";
                while (dr2.Read())
                {
                    image = dr2["techFace"].ToString();

                }
                if (image.Length <= 0)
                {
                    image = "uploadedimages/default.png";
                }
                Image1.ImageUrl = image;
            }
            else
            {
                Response.Redirect("../Login1.aspx");

            }
        }
        else
        {
            if (Session["techNum"] == null)
            {
                Response.Redirect("../Login1.aspx");

            }

        }
    }
}
