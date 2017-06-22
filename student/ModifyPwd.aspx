<%@ Page Language="C#" MasterPageFile="~/student/student.master" AutoEventWireup="true" CodeFile="ModifyPwd.aspx.cs" Debug="true" Inherits="ModifyInfo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>学生成绩管理系统</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
      <h1 style="text-align:center;color:#CC9900">学生密码修改</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
  
   
    <div style="text-align: center">
    
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:stuInfoConnectionString %>" 
            SelectCommand="SELECT [stdXh], [stdSfzhm], [stdXm], [stdRxsj], [stdSzbj], [stdSfby], [stdJtdz], [stdLxdh] FROM [stdInfo] WHERE ([stdXh] = @stdXh)">
            <SelectParameters>
                <asp:SessionParameter Name="stdXh" SessionField="stdXh" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
  
        <p style="margin-top: 20px">
            <h2>修改密码</h2>
          </p>    
         <p style="margin-top: 20px;margin-left:-125px">
                <asp:Label ID="labMsg" ForeColor="Red" runat="server"></asp:Label>
                <br />
                <p1 style="margin-left:90px;color:khaki">旧密码</p1><span style="margin-left: 30px"></span> <asp:TextBox ID="txtOldPassword"  CssClass="textbox"  runat="server" 
            TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtOldPassword" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
             </p>
        <p style="margin-top: 20px;margin-left:-125px">
                <br />
                <p1 style="margin-left:90px;color:khaki">新密码</p1><span style="margin-left: 31px"></span><asp:TextBox ID="txtNewPassword" CssClass="textbox"  runat="server" 
            TextMode="Password" style="margin-left: 0px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtNewPassword" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
             </p>
        <p style="margin-top: 20px;margin-left:-125px">
                <br />
                <p1 style="margin-left:90px;color:khaki">确认密码</p1><span style="margin-left: 20px"></span><asp:TextBox ID="txtComfigPassword" CssClass="textbox"  runat="server" 
            TextMode="Password" style="margin-left: 0px" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtComfigPassword" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtNewPassword" ControlToValidate="txtComfigPassword" 
                    ErrorMessage="2次密码输入不一致" ForeColor="Red"></asp:CompareValidator>
                <br /><br />
                <span style="margin-left:100px">
                <asp:LinkButton ID="LinkButton1" CssClass="buttonCSS" runat="server" onclick="LinkButton1_Click" >修改密码</asp:LinkButton></span>
    
                <br />
             </p>
    
    </div>

    </asp:Content>
