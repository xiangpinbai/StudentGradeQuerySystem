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
using System.Data.Sql;
using System.Data.SqlClient;
using System.IO;
public partial class student_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

        labMsg.Text = "已提交申请！";
    }
    protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        e.Cancel = true;
        string bgqq = ((TextBox)FormView1.FindControl("stdBgqqTextBox")).Text;
        string stdXh = Session["stdXh"].ToString();
        string sql = "update stdInfo set stdBgqq=@bgqq where stdXh=@stdXh";
        SqlParameter[] param ={
                             new SqlParameter("@bgqq",SqlDbType.Text),
                             new SqlParameter("@stdXh",SqlDbType.Char)
                             };
        param[0].Value = bgqq;
        param[1].Value = stdXh;
        sqlHelp.ExecuteNonQuery(sqlHelp.ConnectionStringLocalTransaction, CommandType.Text, sql, param);
        Response.Redirect("ModifyInfo.aspx?stdXh=" + stdXh);

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        bool image_loaded = true;
        string pathName = null;
        if (imgupload.HasFile)
        {
            string extension = System.IO.Path.GetExtension(imgupload.FileName);
            if (extension.ToLower() != ".gif" && extension.ToLower() != ".png" && extension.ToLower() != ".jpg" && extension.ToLower() != ".jpeg")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('invalid image format');", true);
            }
            else
            {
                int file_size = imgupload.PostedFile.ContentLength;
                if (file_size > 1048576)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('max file size is 1 mb');", true);
                    image_loaded = false;
                }
                else
                {
                    pathName = "../uploadedimages/" + Path.GetFileName(imgupload.PostedFile.FileName);

                }
            }
        }
        DataTable dt = new DataTable();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["stuInfoConnectionString"].ConnectionString); //declare and instantiate new SQL connection
        //SqlCommand cmd;
        string stdXh = Session["stdXh"].ToString();
        string s = "update stdInfo set stdFace='" + pathName + "' where stdXh='" + stdXh + "'";
        SqlDataAdapter sda = new SqlDataAdapter(s, con);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        imgupload.SaveAs(Server.MapPath("~/uploadedimages/" + imgupload.FileName));
        Response.Redirect("success.aspx");
    }
}