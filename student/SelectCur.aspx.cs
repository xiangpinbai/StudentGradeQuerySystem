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


public partial class student_SelectCur : System.Web.UI.Page
{
    SqlConnection connection = new SqlConnection();
    SqlDataAdapter adapter = new SqlDataAdapter();
    string sqlStr, selectCondition;
    string connStr = "server=LIKER;database=SelectCourse;integrated security=SSPI";
    int i;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["stdXh"] == null || Session["stdXh"].ToString().Length == 0)
            Response.Redirect("../Login1.aspx");
    }

    protected void btnSelect_Click(object sender, EventArgs e)
    {
    }


    protected void btnSelect_Click1(object sender, EventArgs e)
    {
        try
        {
            string stdXh = Session["stdXh"].ToString();
            string curId = cmbCourse.SelectedValue.ToString();



            if (cmbCourse.SelectedIndex >= 0)
            {


                //添加课程记录
                string insertsql = "insert into SelectCurInfo(curId,stdXh)";
                insertsql += " values(@curId,@stdXh)";
                SqlParameter[] insertParam = new SqlParameter[]{
                    new SqlParameter("@curId",SqlDbType.Char),
                    new SqlParameter("@stdXh",SqlDbType.Char),

                    };
                insertParam[0].Value = curId;
                insertParam[1].Value = stdXh;




                if (sqlHelp.ExecuteNonQuery(sqlHelp.ConnectionStringLocalTransaction,
                CommandType.Text, insertsql, insertParam) > 0)
                {
                    Response.Redirect("success.aspx");
                }
                else
                {
                    Label1.Text = "操作错误";
                }
            }
            else
            {
                //MessageBox.Show("请先选择学生和课程!");
                Label1.Text = "请先选择学生和课程";
            }
        }
        catch
        {
            Label1.Text = "您已选择此课程！";
        }
    }
}

