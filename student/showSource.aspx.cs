using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class showSource : System.Web.UI.Page
{
    private SqlConnection sqlcon;

    protected void Page_Load(object sender, EventArgs e)
    {
        //加载页面是判断用户是否登录

        if (Session["stdXh"] == null || Session["stdXh"].ToString().Length == 0)
            Response.Redirect("../Login1.aspx");
        //如果已经登录显示提示信息
        labUser.Text = "学号为<b><font color=white>[" + Session["stdXh"].ToString() + "]</font></b>的学生的所有考试成绩";
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
