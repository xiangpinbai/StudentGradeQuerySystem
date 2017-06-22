<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="student_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>学生成绩管理系统</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
      <h1 style="text-align:center;color:#CC9900" >已选课程查看</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    
   <h2 style=" padding-top:20px;"><asp:Label ID="labUser" runat="server" Text="Label"></asp:Label></h2> 
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Style="margin-left:220px;" Font-Size="Large"   
         Width="479px" ShowHeaderWhenEmpty="True" DataKeyNames="curId" OnRowDeleting="GridView1_RowDeleting">
    <Columns>


        <asp:CommandField ShowDeleteButton="True" />


        <asp:BoundField DataField="curId" HeaderText="课程编号" />
        <asp:BoundField DataField="curName" HeaderText="课程名称" />
        <asp:BoundField DataField="curTeacher" HeaderText="授课老师" />
        <asp:BoundField DataField="curCredit" HeaderText="学分" />


    </Columns>
      <FooterStyle  ForeColor="#FFFFCC" />
             <HeaderStyle  Font-Bold="True" ForeColor="White" />
             <PagerStyle  ForeColor="White" HorizontalAlign="Center" />
             <RowStyle  ForeColor="#FFFFCC" />
             <SelectedRowStyle Font-Bold="True" ForeColor="White" />
             <SortedAscendingCellStyle BackColor="#F7F7F7" />
             <SortedAscendingHeaderStyle BackColor="#487575" />
             <SortedDescendingCellStyle BackColor="#E5E5E5" />
             <SortedDescendingHeaderStyle BackColor="#275353" />
    <EmptyDataTemplate>
        <pre id="best-content-1471933487" accuse="aContent" class="best-text mb-10" style="min-height: 55px;">&nbsp;</pre>
    </EmptyDataTemplate>
</asp:GridView>
    <br />
</asp:Content>

