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

public partial class ModifyInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
    }

    protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

    }

    //protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    //{
    //    e.Cancel = true;
    //    string bgqq = ((TextBox)FormView1.FindControl("stdBgqqTextBox")).Text;
    //    string stdXh = Session["stdXh"].ToString();
    //    string sql = "update stdInfo set stdBgqq=@bgqq where stdXh=@stdXh";
    //    SqlParameter[] param ={
    //                         new SqlParameter("@bgqq",SqlDbType.Text),
    //                         new SqlParameter("@stdXh",SqlDbType.Char)
    //                         };
    //    param[0].Value = bgqq;
    //    param[1].Value = stdXh;
    //    sqlHelp.ExecuteNonQuery(sqlHelp.ConnectionStringLocalTransaction, CommandType.Text, sql, param);
    //    Response.Redirect("ModifyInfo.aspx?stdXh=" + stdXh);

    //}
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //获得次输入的新旧密码，及登陆时保存的用户名
        string oldPassword = txtOldPassword.Text.Replace("'", "");
        string newPassword = txtNewPassword.Text.Replace("'", "");
        string stdXh = Session["stdXh"].ToString();
        //查询数据库，验证旧密码是否正确
        string sql = "select count(*) from stdInfo where stdXh=@stdXh and stdMm=@stdMm";
        SqlParameter[] param ={
                             new SqlParameter("@stdXh",SqlDbType.Char),
                             new SqlParameter("@stdMm",SqlDbType.VarChar)
                             };
        param[0].Value = stdXh;
        param[1].Value = oldPassword;
        int usercount = ((int)(sqlHelp.ExecuteScalar(sqlHelp.ConnectionStringLocalTransaction,
            CommandType.Text, sql, param)));
        if (usercount <= 0)
        {
            labMsg.Text = "旧密码错误!";
        }
        else
        {
            //执行数据库操作效果密码
            string updatesql = "update stdInfo set stdMm=@stdMm where stdXh=@stdXh";
            SqlParameter[] updateParam ={
                                 new SqlParameter("@stdMm",SqlDbType.VarChar),
                                 new SqlParameter("@stdXh",SqlDbType.Char)
                                 };
            updateParam[0].Value = newPassword;
            updateParam[1].Value = stdXh;
            if (sqlHelp.ExecuteNonQuery(sqlHelp.ConnectionStringLocalTransaction,
                CommandType.Text, updatesql, updateParam) > 0)
            {
                Response.Redirect("success.aspx");
            }
            else
            {
                labMsg.Text = "操作错误!";
            }
        }
    }

    protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {

    }

    protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {

    }

    //protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    //{
    //    //取消修改事件发到系统框架
    //    e.Cancel = true;
    //    //获得输入信息，并组成sql语句
    //    string bgqq = ((TextBox)FormView1.FindControl("stdBgqqTextBox")).Text;
    //    string stdXh = Session["stdXh"].ToString();
    //    string sql = "update stdInfo set stdBgqq=@bgqq where stdXh=@stdXh";
    //    SqlParameter[] param ={
    //                         new SqlParameter("@bgqq",SqlDbType.Text),
    //                         new SqlParameter("@stdXh",SqlDbType.Char)
    //                         };
    //    param[0].Value = bgqq;
    //    param[1].Value = stdXh;
    //    //执行sql语句，修改数据库
    //    sqlHelp.ExecuteNonQuery(sqlHelp.ConnectionStringLocalTransaction, CommandType.Text, sql, param);
    //    //重新加载本页面，刷新数据
    //    Response.Redirect("ModifyInfo.aspx?stdXh=" + stdXh);
    //}
}

