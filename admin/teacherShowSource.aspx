<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="teacherShowSource.aspx.cs" Inherits="admin_teacherShowSource" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <h1>学生成绩管理系统</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <h1 style="text-align:center;color:#CC9900" >老师信息</h1>
</asp:Content>
    
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
      <div style="margin-left:10px">
    <br />

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:stuInfoConnectionString %>" SelectCommand="SELECT [techNum], [techName], [techCur] FROM [teachersInfo]">
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server"  Font-Size="Large"   
         Width="479px" Style="margin-left:220px;" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="techNum" DataSourceID="SqlDataSource1">
         <FooterStyle  ForeColor="#FFFFCC" />
             <HeaderStyle  Font-Bold="True" ForeColor="White" />
             <PagerStyle  ForeColor="White" HorizontalAlign="Center" />
             <RowStyle  ForeColor="#FFFFCC" />
             <SelectedRowStyle Font-Bold="True" ForeColor="White" />
             <SortedAscendingCellStyle BackColor="#F7F7F7" />
             <SortedAscendingHeaderStyle BackColor="#487575" />
             <SortedDescendingCellStyle BackColor="#E5E5E5" />
             <SortedDescendingHeaderStyle BackColor="#275353" />
               <Columns>
                <asp:BoundField DataField="techNum" HeaderText="techNum" ReadOnly="True" SortExpression="techNum" />
                <asp:BoundField DataField="techName" HeaderText="techName" SortExpression="techName" />
                <asp:BoundField DataField="techCur" HeaderText="techCur" SortExpression="techCur" />
            </Columns>
        </asp:GridView>
          <br />
    
    </div>
</asp:Content>

