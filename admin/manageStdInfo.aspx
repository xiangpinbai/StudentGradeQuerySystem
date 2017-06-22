<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="manageStdInfo.aspx.cs" Inherits="admin_manageStdInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <h1>学生成绩管理系统</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <h1 style="text-align:center;color:#CC9900" >学生信息管理</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <div id="maincontent1"  class="GridDock"  style="margin-left:-20px">
    <div style="margin-top=20px">
        <br />
       <h2>学生信息</h2>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:stuInfoConnectionString %>" 
            DeleteCommand="DELETE FROM [stdInfo] WHERE [stdXh] = @stdXh" 
            InsertCommand="INSERT INTO [stdInfo] ([stdXh], [stdXm], [stdSzbj], [stdSfby], [stdJtdz], [stdLxdh], [stdSfzhm], [stdRxsj], [stdBgqq]) VALUES (@stdXh, @stdXm, @stdSzbj, @stdSfby, @stdJtdz, @stdLxdh, @stdSfzhm, @stdRxsj, @stdBgqq)" 
            SelectCommand="SELECT [stdXh], [stdXm], [stdSzbj], [stdSfby], [stdJtdz], [stdLxdh], [stdSfzhm], [stdRxsj], [stdBgqq] FROM [stdInfo]" 
            UpdateCommand="UPDATE [stdInfo] SET [stdXm] = @stdXm, [stdSzbj] = @stdSzbj, [stdSfby] = @stdSfby, [stdJtdz] = @stdJtdz, [stdLxdh] = @stdLxdh, [stdSfzhm] = @stdSfzhm, [stdRxsj] = @stdRxsj, [stdBgqq] = @stdBgqq WHERE [stdXh] = @stdXh">
            <DeleteParameters>
                <asp:Parameter Name="stdXh" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="stdXm" Type="String" />
                <asp:Parameter Name="stdSzbj" Type="String" />
                <asp:Parameter Name="stdSfby" Type="Boolean" />
                <asp:Parameter Name="stdJtdz" Type="String" />
                <asp:Parameter Name="stdLxdh" Type="String" />
                <asp:Parameter Name="stdSfzhm" Type="String" />
                <asp:Parameter Name="stdRxsj" Type="DateTime" />
                <asp:Parameter Name="stdBgqq" Type="String" />
                <asp:Parameter Name="stdXh" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="stdXh" Type="String" />
                <asp:Parameter Name="stdXm" Type="String" />
                <asp:Parameter Name="stdSzbj" Type="String" />
                <asp:Parameter Name="stdSfby" Type="Boolean" />
                <asp:Parameter Name="stdJtdz" Type="String" />
                <asp:Parameter Name="stdLxdh" Type="String" />
                <asp:Parameter Name="stdSfzhm" Type="String" />
                <asp:Parameter Name="stdRxsj" Type="DateTime" />
                <asp:Parameter Name="stdBgqq" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
    
  
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
       DataKeyNames="stdXh" DataSourceID="SqlDataSource1" 
        
 ShowFooter="True" 

                BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" 
        GridLines="Vertical" BackColor="White" ForeColor="Black"  OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" HorizontalAlign="Center" style="margin-left: 0px; margin-right: 23px" Width="894px" >
       
   <AlternatingRowStyle BackColor="White" ForeColor="Black" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True"  ShowEditButton="True" >
            <HeaderStyle Width="80px" />
            </asp:CommandField>
            <asp:HyperLinkField DataNavigateUrlFields="stdXh" 
                DataNavigateUrlFormatString="ModifyStdInfo.aspx?stdXh={0}" 
                HeaderText="修改" Text="修改" NavigateUrl="~/admin/ModifyStdInfo.aspx"  >
                

            <HeaderStyle Width="50px" />
            </asp:HyperLinkField>
                

            <asp:BoundField DataField="stdXh"  HeaderText="学号" ReadOnly="True" 
                SortExpression="stdXh" />
            <asp:BoundField DataField="stdSfzhm" HeaderText="身份证号码" 
                SortExpression="stdSfzhm" />
            <asp:BoundField DataField="stdXm" HeaderText="姓名" SortExpression="stdXm" >
            <HeaderStyle Width="60px" />
            </asp:BoundField>
            <asp:BoundField DataField="stdRxsj" HeaderText="入学时间" 
                SortExpression="stdRxsj" DataFormatString="{0:yyyy-MM-dd}"/>
            <asp:BoundField DataField="stdSzbj" HeaderText="所在班级" 
                SortExpression="stdSzbj" >
            <HeaderStyle Width="100px" />
            </asp:BoundField>
            <asp:CheckBoxField DataField="stdSfby" HeaderText="是否毕业" ReadOnly="True" 
                SortExpression="stdSfby" />
            <asp:BoundField DataField="stdJtdz" HeaderText="家庭地址" 
                SortExpression="stdJtdz" >
            <HeaderStyle Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="stdBgqq" HeaderText="变更请求" 
                SortExpression="stdBgqq" >
            <HeaderStyle Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="stdLxdh" HeaderText="联系电话" 
                SortExpression="stdLxdh" />
            <asp:HyperLinkField DataNavigateUrlFields="stdXh" DataNavigateUrlFormatString="ModifyStdInfo.aspx?stdXh" NavigateUrl="~/admin/manageStdInfo.aspx" >
            <HeaderStyle Width="40px" />
            </asp:HyperLinkField>
        </Columns>
       
        <EditRowStyle ForeColor="Black" />
       
        <FooterStyle  ForeColor="Black" BorderColor="Black" />
             <HeaderStyle  Font-Bold="True" ForeColor="White" HorizontalAlign="Justify" BackColor="#333333" />
             <PagerStyle  ForeColor="Black" HorizontalAlign="Center" BackColor="#BBC565" />
             <RowStyle  ForeColor="Black" BorderColor="White" />
             <SelectedRowStyle Font-Bold="True" ForeColor="#999999" />
             <SortedAscendingCellStyle BackColor="#FFFFCC" />
             <SortedAscendingHeaderStyle BackColor="#487575" />
             <SortedDescendingCellStyle BackColor="#E5E5E5" />
             <SortedDescendingHeaderStyle BackColor="#275353" />
    </asp:GridView>
        </div>
          </div>
</asp:Content>

