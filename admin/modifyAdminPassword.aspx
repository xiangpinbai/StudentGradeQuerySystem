<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/admin/admin.master" CodeFile="modifyAdminPassword.aspx.cs" Inherits="admin_modifyAdminPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <h1>学生成绩管理系统</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <h1 style="text-align:center;color:#CC9900" >管理员密码修改</h1>
</asp:Content><asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <div align="center">
    
        <br />
        <h2>修改密码</h2>
        <p style="margin-top: 20px;margin-left:-125px">
                <asp:Label ID="labMsg"  ForeColor="Red" runat="server"></asp:Label>
                <br />
                <p1 style="margin-left:90px;color:khaki">旧密码</p1><span style="margin-left: 30px"></span> <asp:TextBox ID="txtOldPassword" runat="server"  CssClass="textbox"
            TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtOldPassword" ForeColor="Red"  ErrorMessage="*"></asp:RequiredFieldValidator>
              </p>
         <p style="margin-top: 20px;margin-left:-125px"> 
              <br />
            
                <p1 style="margin-left:90px;color:khaki">新密码</p1><span style="margin-left: 31px"></span><asp:TextBox ID="txtNewPassword" runat="server"  CssClass="textbox"
            TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtNewPassword" ForeColor="Red"  ErrorMessage="*"></asp:RequiredFieldValidator>
                 </p>
         <p style="margin-top: 20px;margin-left:-125px"><br />
            
                <p1 style="margin-left:90px;color:khaki">确认密码</p1><span style="margin-left: 20px"></span><asp:TextBox ID="txtComfigPassword" runat="server"  CssClass="textbox"
            TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtComfigPassword" ErrorMessage="*"></asp:RequiredFieldValidator>
               </p>  <br />
            
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtNewPassword" ControlToValidate="txtComfigPassword" 
                    ErrorMessage="2次密码输入不一致"  ForeColor="Red"></asp:CompareValidator>
                <br />
                <asp:LinkButton ID="LinkButton1"  CssClass="buttonCSS" runat="server" onclick="LinkButton1_Click">修改密码</asp:LinkButton>
    
    </div>
</asp:Content>

