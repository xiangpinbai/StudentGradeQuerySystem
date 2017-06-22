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

public partial class student_Default : System.Web.UI.Page
{
    public static DataTable TransposeDataTable(DataTable dt)
    {
        DataTable table = new DataTable();
        //Get all the rows and change into columns
        for (int i = 0; i <= dt.Rows.Count; i++)
        {
            table.Columns.Add(Convert.ToString(i));
        }
        DataRow dr;
        //get all the columns and make it as rows
        for (int j = 0; j < dt.Columns.Count; j++)
        {
            dr = table.NewRow();
            dr[0] = dt.Columns[j].ToString();
            for (int k = 1; k <= dt.Rows.Count; k++)
                dr[k] = dt.Rows[k - 1][j];
            table.Rows.Add(dr);
        }

        return table;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["stdXh"] == null || Session["stdXh"].ToString().Length == 0)
            Response.Redirect("../Login1.aspx");
        //如果已经登录显示提示信息
        labUser.Text = "学号为<b><font color=white>[" + Session["stdXh"].ToString() + "]</font></b>的学生的所有已选课程";
        DataTable dt = new DataTable();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["stuInfoConnectionString"].ConnectionString); //declare and instantiate new SQL connection
        //SqlCommand cmd;
        string stdXh = Session["stdXh"].ToString();
        string s = "Select c.curId,curName,curTeacher,curCredit from curriculumInfo as c inner join SelectCurInfo as s on c.curId=s.curId and s.stdXh='" + stdXh + "' ";
        SqlDataAdapter sda = new SqlDataAdapter(s, con);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        //try
        //{ 
        //con.Open(); // open sql Connection

        //cmd = new SqlCommand("Select c.curId,curName,curTeacher,curCredit from curriculumInfo as c inner join SelectCurInfo as s on c.curId=s.curId and s.stdXh='" + stdXh + "' ", con);  //instantiate SQL command 
        //cmd.CommandType = CommandType.Text; //set type of sqL Command

        //using (SqlDataAdapter da = new SqlDataAdapter(cmd))
        //{
        //    da.Fill(dt); //Add the result  set  returned from SQLCommand to datatable
        //}
        //List<stuCur> lstItems = new List<stuCur>();
        //if (stdXh == null)
        //    Response.Redirect("shibai.aspx");
        //if (dt != null && dt.Rows.Count > 0)
        //{
        //    foreach (DataRow row in dt.Rows) // parse each row of datatable
        //    {
        //        stuCur stu_cur = new stuCur();
        //        if (!row["curName"].ToString().Equals(DBNull.Value)) // check if TotalUnits is not null
        //        {
        //            stu_cur.curName = row["curName"].ToString();
        //        }
        //        if (!row["curId"].ToString().Equals(DBNull.Value)) // check if ItemNo is not null
        //        {

        //            stu_cur.curId = row["curId"].ToString();


        //        }
        //        else
        //        {

        //            Response.Redirect("shibai.aspx");

        //        }

        //        if (!row["curTeacher"].ToString().Equals(DBNull.Value)) // check if TotalUnits is not null
        //        {
        //            stu_cur.curTeacher = row["curTeacher"].ToString();
        //        }
        //        if (!row["curCredit"].ToString().Equals(DBNull.Value)) // check if TotalUnits is not null
        //        {
        //            stu_cur.curName = row["curCredit"].ToString();
        //        }
        //        lstItems.Add(stu_cur); // add item to item list
        //    }
        //}
        //else
        //{
        //    stuCur stu_cur = new stuCur();
        //    stu_cur.curId = "没有数据";
        //    lstItems.Add(stu_cur); // add item to item list
        //}
        //dt = TransposeDataTable(dt);
        //GridView1.DataSource = dt;//setting data source for the gridview
        //GridView1.DataBind(); //bind the data source to the gridview
        //GridView1.HeaderRow.Visible = false;
        //GridView1.BorderStyle = BorderStyle.None;

        //for (int i = 0; i < GridView1.Rows.Count; i++)
        //{
        //    GridView1.Rows[i].Cells[1].BorderStyle = BorderStyle.None;
        //    GridView1.Rows[i].Cells[1].ForeColor = Color.White;
        //    GridView1.Rows[i].Cells[1].Font.Bold = false;
        //}
        //for (int i = 0; i < GridView1.Rows.Count; i++)
        //{
        //    GridView1.Rows[i].BorderStyle = BorderStyle.None;
        //    GridView1.Rows[i].Cells[0].BorderStyle = BorderStyle.None;
        //    GridView1.Rows[i].Cells[0].ForeColor = Color.Khaki;
        //    GridView1.Rows[i].Cells[0].Font.Bold = true;
        //}

        //     catch (SqlException)
        //    {
        //        throw;
        //    }
    }
    private void LoadGrid3()
    {
       
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
       
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["stuInfoConnectionString"].ConnectionString); //declare and instantiate new SQL connection
        //SqlCommand cmd;
        string id0 = GridView1.DataKeys[e.RowIndex].Value.ToString();
        string id1 = Session["stdXh"].ToString();
        string s = "delete from SelectCurInfo where stdXh='" + id1 + "' and curId='" + id0 + "'";
        SqlCommand com = new SqlCommand(s, con);
        con.Open();
        com.ExecuteNonQuery();
        //con.Close();
        DataTable dt = new DataTable();
        //SqlCommand cmd;
        string stdXh = Session["stdXh"].ToString();
        string s1 = "Select c.curId,curName,curTeacher,curCredit from curriculumInfo as c inner join SelectCurInfo as s on c.curId=s.curId and s.stdXh='" + stdXh + "' ";
        SqlDataAdapter sda = new SqlDataAdapter(s1, con);
        DataSet ds = new DataSet();
        sda.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
}