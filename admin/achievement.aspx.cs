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

public partial class admin_achievement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminuser"] == null || Session["adminuser"].ToString().Length == 0)
            Response.Redirect("login.aspx");
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string stdXh = ddlXtdXh.SelectedValue;
        string aeKcmc = txtAeKcmc.Text;
        string aeKssj = txtAeKssj.Text;
        string aeKscs = txtAeKscs.Text;
        string aeKscj = txtAeKscj.Text;
        string sql = "select count(*) from achievement where stdXh=@stdXh and aeKcmc=@aeKcmc and aeKscs=@aeKscs";
        SqlParameter[] param = new SqlParameter[]{
                    new SqlParameter("@stdXh",SqlDbType.Char),
                    new SqlParameter("@aeKcmc",SqlDbType.Char),
                    new SqlParameter("@aeKscs",SqlDbType.Int)
                    };
        param[0].Value = stdXh;
        param[1].Value = aeKcmc;
        param[2].Value = aeKscs;
        int aetcount = ((int)(sqlHelp.ExecuteScalar(sqlHelp.ConnectionStringLocalTransaction,
            CommandType.Text, sql, param)));
        if (aetcount <= 0)
        {
            string insertSql = "insert into achievement(stdXh,aeKcmc,aeKssj,aeKscs,aeKscj) values(@stdXh,@aeKcmc,@aeKssj,@aeKscs,@aeKscj)";
            SqlParameter[] insertParam = new SqlParameter[]{
                    new SqlParameter("@stdXh",SqlDbType.Char),
                    new SqlParameter("@aeKcmc",SqlDbType.Char),
                    new SqlParameter("@aeKssj",SqlDbType.DateTime),
                    new SqlParameter("@aeKscs",SqlDbType.Int),
                    new SqlParameter("@aeKscj",SqlDbType.Float)
                    };
            insertParam[0].Value = stdXh;
            insertParam[1].Value = aeKcmc;
            insertParam[2].Value = aeKssj;
            insertParam[3].Value = aeKscs;
            insertParam[4].Value = aeKscj;
            if (sqlHelp.ExecuteNonQuery(sqlHelp.ConnectionStringLocalTransaction,
                 CommandType.Text, insertSql, insertParam) > 0)
            {
                Response.Redirect("success.aspx");
            }
            else
            {
                labMessage.Text = "操作错误";
            }
        }
        else
        {
            labMessage.Text = "学号为【" + stdXh + "】学生 【" + aeKcmc + "】课程 第" + aeKscs + "次考试成绩已经录入！";
        }
    }
}
