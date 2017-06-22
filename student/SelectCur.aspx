<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.master" AutoEventWireup="true" CodeFile="SelectCur.aspx.cs" Inherits="student_SelectCur" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>学生成绩管理系统</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
      <h1 style="text-align:center;color:#CC9900">个人信息修改</h1>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <br />
 
            <h2 style="align-content:unset">选择课程：</h2>
           
     
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:stuInfoConnectionString %>" SelectCommand="SELECT [curName], [curId] FROM [curriculumInfo]"></asp:SqlDataSource>
    
    
      
     
   <div style="margin-left:400px"> <asp:DropDownList ID="cmbCourse" runat="server" DataSourceID="SqlDataSource2" DataTextField="curName" DataValueField="curId" Width="152px" Height="35px">
            </asp:DropDownList><br /><br />
        <asp:Button ID="btnSelect" CssClass="buttonCSS" runat="server" OnClick="btnSelect_Click1"  Text="选定课程"  />
        <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
        </p></div>
</asp:Content>


