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

public partial class admin_curriculum : System.Web.UI.Page
{
    /*void ObjOpen()
    {
        curNumTextBox.Enabled = true;
        txtName.Enabled = true;
        txtAge.Enabled = true;
        cmbSex.Enabled = true;
        txtDept.Enabled = true;
        txtNo.Focus();
    }
    //文本框和组合框不可用
    void ObjClose()
    {
        txtNo.Enabled = false;
        txtName.Enabled = false;
        txtAge.Enabled = false;
        cmbSex.Enabled = false;
        txtDept.Enabled = false;
    }*/

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["adminuser"] == null || Session["adminuser"].ToString().Length == 0)
            Response.Redirect("../login1.aspx");
    }

    protected void UpdateButton_Click(object sender, EventArgs e)
    {

    }

    //protected void AddButton_Click(object sender, EventArgs e)
    //{
    //    //获得FormView控件中各个属性控件的值
    //    string CurNum = ((TextBox)FormView1.FindControl("curNumTextBox")).Text;
    //    string CurId = ((TextBox)FormView1.FindControl("curIdTextBox")).Text;
    //    string CurName = ((TextBox)FormView1.FindControl("curNameTextBox")).Text;
    //    string CurCredit = ((TextBox)FormView1.FindControl("curCreditTextBox")).Text;
    //    string CurTeacher = ((TextBox)FormView1.FindControl("curTeacherTextBox")).Text;

    //}

    protected void UpdateButton_Click1(object sender, EventArgs e)
    {
        //获得FormView控件中各个属性控件的值

        //string CurNum = ((TextBox)FormView1.FindControl("curNumTextBox")).Text;
        string curId = ((TextBox)FormView1.FindControl("txtCurId")).Text;
        string curName = ((TextBox)FormView1.FindControl("txtCurName")).Text;
        string curCredit = ((TextBox)FormView1.FindControl("txtCurTeacher")).Text;
        string curTeacher = ((TextBox)FormView1.FindControl("txtCurCredit")).Text;
        if (curId.Length != 10)//验证学号是否符合格式
        {
            labMsg.Text = "课程号必须为10位数字字符串！";
        }
        else
        {
            //查询课程号是否存在
            string sql = "select count(*) from curriculumInfo where curId=@curId";
            SqlParameter[] param = new SqlParameter[]{
                    new SqlParameter("@curId",SqlDbType.Char)
                    };
            param[0].Value = curId;
            int usercount = ((int)(sqlHelp.ExecuteScalar(sqlHelp.ConnectionStringLocalTransaction,
                CommandType.Text, sql, param)));
            if (usercount == 0)
            {
                //添加课程记录
                string insertsql = "insert into curriculumInfo(curId,curName,curTeacher,curCredit)";
                insertsql += " values(@curId,@curName,@curTeacher,@curCredit)";

                SqlParameter[] insertParam = new SqlParameter[]{
                    new SqlParameter("@curId",SqlDbType.Char),
                    new SqlParameter("@curName",SqlDbType.Char),
                    new SqlParameter("@curTeacher",SqlDbType.Char),
                    new SqlParameter("@curCredit",SqlDbType.Char),

                    };

                insertParam[0].Value = curId;
                insertParam[1].Value = curName;
                insertParam[2].Value = curTeacher;
                insertParam[3].Value = curCredit;




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
                labMsg.Text = "课程号已经存在";
            }
        }
    }

    protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
    {

    }

    protected void curNameTextBox_TextChanged(object sender, EventArgs e)
    {

    }
}