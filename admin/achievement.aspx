<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin/admin.master" CodeFile="achievement.aspx.cs" Inherits="admin_achievement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <h1>学生成绩管理系统</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <h1 style="text-align:center;color:#CC9900" >成绩信息添加</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <div>
    
<table border="0" align="center" style="width: 373px;margin-left:350px">
  <tr>
    <td class="style2">&nbsp;</td>
    <td class="style1">
        <asp:Label ID="labMessage" runat="server" Font-Size="Medium" ForeColor="Red"></asp:Label>
      </td>
  </tr>
  <tr>
    <td class="style2"><div align="right">姓名：</div></td>
    <td class="style1">
        <asp:DropDownList ID="ddlXtdXh" runat="server" DataSourceID="SqlDataSource2" 
            DataTextField="stdXm" DataValueField="stdXh">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:stuInfoConnectionString %>" SelectCommand="SELECT * FROM [stdInfo]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:stuInfoConnectionString %>" 
            SelectCommand="SELECT [stdXh], [stdXm] FROM [stdInfo]"></asp:SqlDataSource>
      </td>
  </tr>
  <tr>
    <td class="style2"><div align="right">课程名称：</div></td>
    <td class="style1">
        <asp:TextBox ID="txtAeKcmc" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ErrorMessage="*" ControlToValidate="txtAeKcmc"></asp:RequiredFieldValidator>
                    </td>
  </tr>
  <tr>
    <td class="style2"><div align="right">考试时间：</div></td>
    <td class="style1">
        <asp:TextBox ID="txtAeKssj" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ErrorMessage="*" ControlToValidate="txtAeKssj"></asp:RequiredFieldValidator>
                    
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtAeKssj" ErrorMessage="日期格式不对" 
                    ValidationExpression="\d{4}-\d{2}-\d{2}"></asp:RegularExpressionValidator></td>
  </tr>
  <tr>
    <td class="style2"><div align="right">考试次数：</div></td>
    <td class="style1">
        <asp:TextBox ID="txtAeKscs" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ErrorMessage="*" ControlToValidate="txtAeKscs"></asp:RequiredFieldValidator>
                    </td>
  </tr>
  <tr>
    <td class="style2"><div align="right">考试成绩：</div></td>
    <td class="style1" align="left">
        <asp:TextBox ID="txtAeKscj" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
            ErrorMessage="*" ControlToValidate="txtAeKscj" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>

  </tr>
  <tr >
    <td colspan="2" align="center">
        <asp:Button ID="btnAdd" runat="server" Text="添加成绩" onclick="btnAdd_Click" />
      </td>
  </tr>
</table>
    </div>
</asp:Content>

