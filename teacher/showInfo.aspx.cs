using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class teacher_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["techNum"] == null || Session["techNum"].ToString().Length == 0)
            Response.Redirect("../Login1.aspx");
        //如果已经登录显示提示信息

    }
}