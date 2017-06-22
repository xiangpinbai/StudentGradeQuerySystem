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
public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {


        }

    }
    protected void b1_Click(object sender, EventArgs e)
    {
        try
        {
            
            string username = user_id.Text;
            //string campus = logincampus.SelectedItem.ToString();
            int LoginAs = Login_As.SelectedIndex;
           // int temp = 0, temp2 = 1;
            if (LoginAs == 0)
            {
                //获得登陆控件的各个属性值
                string stdXh = user_id.Text;
                string password = user_pass.Text;
                //生成SQL语句和参数对象
                string sql = "select count(*) from stdInfo where stdXh=@stdXh and stdMm=@stdMm";
                SqlParameter[] param ={
                             new SqlParameter("@stdXh",SqlDbType.Char),
                             new SqlParameter("@stdMm",SqlDbType.VarChar)
                             };
                param[0].Value = stdXh;
                param[1].Value = password;
                //执行SQL语句
                int usercount = ((int)(sqlHelp.ExecuteScalar(sqlHelp.ConnectionStringLocalTransaction,
                    CommandType.Text, sql, param)));
                //Convert.ToString(stdXh);
               
                //判断登陆成功
                if (usercount <=0)
                {
                    Response.Write("登录失败");
                    
                }
                else
                {
                    Response.Write("登录成功");
                    Session["stdXh"] = stdXh;
                    //Session["stdXh"].ToString();
                    Response.Redirect("~/student/showSource.aspx");
                }
            }
            if (LoginAs == 1)
            {
                //获得登陆控件的各个属性值
                string techNum = user_id.Text;
                string techPsw = user_pass.Text;
                //生成SQL语句和参数对象
                string sql = "select count(*) from teachersInfo where techNum=@techNum and techPsw=@techPsw";
                SqlParameter[] param ={
                             new SqlParameter("@techNum",SqlDbType.VarChar),
                             new SqlParameter("@techPsw",SqlDbType.VarChar)
                             };
                param[0].Value = techNum;
                param[1].Value = techPsw;
                //执行SQL语句
                int usercount = ((int)(sqlHelp.ExecuteScalar(sqlHelp.ConnectionStringLocalTransaction,
                    CommandType.Text, sql, param)));
                //Convert.ToString(stdXh);

                //判断登陆成功
                if (usercount <= 0)
                {
                    Response.Write("登录失败");

                }
                else
                {
                    Response.Write("登录成功");
                    Session["techNum"] = techNum;
                    //Session["stdXh"].ToString();
                    Response.Redirect("teacher/showInfo.aspx");
                }
            }
            else if (LoginAs == 2)
            {
                //获得登录控件的各个属性值
                string adminuser = user_id.Text;
                string adminpass = user_pass.Text;
                //生成sql语句和参数对象
                string sql = "select count(*) from administrator where adminuser=@adminuser and adminpass=@adminpass";
                SqlParameter[] param ={
                             new SqlParameter("@adminuser",SqlDbType.Char),
                             new SqlParameter("@adminpass",SqlDbType.VarChar)
                             };
                param[0].Value = adminuser;
                param[1].Value = adminpass;
                //执行sql语句
                int usercount = ((int)(sqlHelp.ExecuteScalar(sqlHelp.ConnectionStringLocalTransaction,
                    CommandType.Text, sql, param)));
                //判断登录成功
                if (usercount <= 0)
                {
                    Response.Write("登录失败");
                    
                }
                else
                { 
                    Response.Write("登录成功");
                    Session["adminuser"] = adminuser;
                    Response.Redirect("~/admin/manageStdInfo.aspx");
                }
            }
           /* else if (LoginAs == 1)
            {
                temp = objBL.check_Emp_username(username);
                if (temp == 1)
                {
                    temp2 = objBL.check_Emp_campus(username, campus);
                    if (temp2 == 0)
                    {
                        string password = user_pass.Text;
                        int temp1 = objBL.check_Emp_password(username, password);
                        if (temp1 == 0)
                        {
                            Session["New"] = user_id.Text;
                            Response.Write("Password is correct");
                            Response.Redirect("EmployeeProfile.aspx");
                        }
                        else
                        {
                            Response.Write("Incorrect Password");
                        }
                    }
                    else
                    {
                        Response.Write("incorrect username");
                    }
                }
                else
                {
                    Response.Write("incorrect username");

                }
            }
            */
        }
        catch (SqlException)
        {
            throw;
        }

    }
}