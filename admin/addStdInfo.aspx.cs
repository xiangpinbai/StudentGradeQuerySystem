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
public partial class admin_addStdInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminuser"] == null || Session["adminuser"].ToString().Length == 0)
            Response.Redirect("../login1.aspx");
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        //获得FormView控件中各个属性控件的值
        string StdXh = ((TextBox)FormView1.FindControl("txtStdXh")).Text;
        string StdMm = ((TextBox)FormView1.FindControl("txtStdMm")).Text;
        string StdSfzhm = ((TextBox)FormView1.FindControl("txtStdSfzhm")).Text;
        string StdXm = ((TextBox)FormView1.FindControl("txtStdXm")).Text;
        string StdRxsj = ((TextBox)FormView1.FindControl("txtStdRxsj")).Text;
        string StdSzbj = ((TextBox)FormView1.FindControl("txtStdSzbj")).Text;
        string StdLxdh = ((TextBox)FormView1.FindControl("txtStdLxdh")).Text;
        string StdJtdz = ((TextBox)FormView1.FindControl("txtStdJtdz")).Text;
        if (StdXh.Length != 10)//验证学号是否符合格式
        {
            labMsg.Text = "学号必须为10位数字字符串！";
        }
        else
        {
            //查询学号是否存在
            string sql = "select count(*) from stdInfo where stdXh=@stdXh";
            SqlParameter[] param = new SqlParameter[]{
                    new SqlParameter("@stdXh",SqlDbType.Char)
                    };
            param[0].Value = StdXh;
            int usercount = ((int)(sqlHelp.ExecuteScalar(sqlHelp.ConnectionStringLocalTransaction,
                CommandType.Text, sql, param)));
            if (usercount == 0)
            {
                //添加学生记录
                string insertsql = "insert into stdInfo(stdXh,stdMm,stdSfzhm,stdXm,stdRxsj,stdSzbj,stdSfby,stdJtdz,stdLxdh)";
                insertsql += " values(@stdXh,@stdMm,@stdSfzhm,@stdXm,@stdRxsj,@stdSzbj,0,@stdJtdz,@stdLxdh)";
                SqlParameter[] insertParam = new SqlParameter[]{
                    new SqlParameter("@stdXh",SqlDbType.Char),
                    new SqlParameter("@stdMm",SqlDbType.Char),
                    new SqlParameter("@stdSfzhm",SqlDbType.Char),
                    new SqlParameter("@stdXm",SqlDbType.Char),
                    new SqlParameter("@stdRxsj",SqlDbType.DateTime),
                    new SqlParameter("@stdSzbj",SqlDbType.Char),
                    new SqlParameter("@stdJtdz",SqlDbType.Char),
                    new SqlParameter("@stdLxdh",SqlDbType.Char)
                    };
                insertParam[0].Value = StdXh;
                insertParam[1].Value = StdMm;
                insertParam[2].Value = StdSfzhm;
                insertParam[3].Value = StdXm;
                insertParam[4].Value = StdRxsj;
                insertParam[5].Value = StdSzbj;
                insertParam[6].Value = StdJtdz;
                insertParam[7].Value = StdLxdh;
                if (sqlHelp.ExecuteNonQuery(sqlHelp.ConnectionStringLocalTransaction,
                CommandType.Text, insertsql, insertParam) > 0)
                {
                    Response.Redirect("success.aspx");
                }
                else
                {
                    labMsg.Text = "操作错误";
                }
            }
            else
            {
                labMsg.Text = "学号已经存在";
            }
        }
    }

    protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {

    }

    protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        Response.Redirect("manageStdInfo.aspx");
    }

    protected void FormView1_PageIndexChanging1(object sender, FormViewPageEventArgs e)
    {

    }
}
