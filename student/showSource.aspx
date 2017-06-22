<%@ Page Language="C#" MasterPageFile="~/student/student.master" AutoEventWireup="true" CodeFile="showSource.aspx.cs" Inherits="showSource" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>学生成绩管理系统</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <h1 style="text-align:center;color:#CC9900" >个 人 信 息</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <%--<h2 style="text-align:center">个 人 信 息</h2>--%>
   <%-- <form id="form1" runat="server">
    <div>
    
        <br />
        <br />--%>
    <div style="text-align:center">
        <h2 style=" padding-top:20px;">
        <asp:Label ID="labUser" runat="server" Text="Label"></asp:Label></h2></div>
        <%--<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/student/ModifyInfo.aspx">修改个人信息</asp:HyperLink>--%>
    
        <asp:GridView ID="GridView1" Font-Size="Large"   
         Width="479px" Style="margin-left:220px;" runat="server" AutoGenerateColumns="False" DataKeyNames="aeid" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ShowHeaderWhenEmpty="True">
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
                <asp:BoundField DataField="aeid" HeaderText="编号" InsertVisible="False" ReadOnly="True" SortExpression="aeid" />
                <asp:BoundField DataField="stdXh" HeaderText="学号" SortExpression="stdXh" />
                <asp:BoundField DataField="aeKcmc" HeaderText="课程名称" />
                <asp:BoundField DataField="aeKssj" HeaderText="考试时间" SortExpression="aeKssj" />
                <asp:BoundField DataField="aeKscs" HeaderText="考试次数" SortExpression="aeKscs" />
                <asp:BoundField DataField="aeKscj" HeaderText="考试成绩" SortExpression="aeKscj" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:stuInfoConnectionString %>" SelectCommand="SELECT * FROM [achievement] WHERE ([stdXh] = @stdXh2)">
            <SelectParameters>
                <asp:SessionParameter Name="stdXh2" SessionField="stdXh" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
   <%-- </div>
    </form>--%>
  </asp:Content>
