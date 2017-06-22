<%@ Page Title="" Language="C#" MasterPageFile="~/teacher/teacher.master" AutoEventWireup="true" CodeFile="showInfo.aspx.cs" Inherits="teacher_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>学生成绩管理系统</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <h1 style="text-align:center;color:#CC9900" >个 人 信 息</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <br />
    <asp:GridView ID="GridView1" Font-Size="Large"   
         Width="479px" Style="margin-left:220px;"  runat="server" AutoGenerateColumns="False" DataKeyNames="techNum" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="techNum" HeaderText="techNum" ReadOnly="True" SortExpression="techNum" />
            <asp:BoundField DataField="techName" HeaderText="techName" SortExpression="techName" />
            <asp:BoundField DataField="gender" HeaderText="gender" SortExpression="gender" />
            <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
            <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
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
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:stuInfoConnectionString %>" SelectCommand="SELECT [techNum], [techName], [gender], [address], [phone], [email] FROM [teachersInfo] WHERE ([techNum] = @techNum)">
        <SelectParameters>
            <asp:SessionParameter Name="techNum" SessionField="techNum" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

