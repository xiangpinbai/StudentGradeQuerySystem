<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="curriculum.aspx.cs" Inherits="admin_curriculum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <h1>学生成绩管理系统</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <h1 style="text-align:center;color:#CC9900" >课程添加</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
  
    <br />
      <h2> 添加课程</h2>
     
    <div style="margin-left:350px">

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:stuInfoConnectionString %>" DeleteCommand="DELETE FROM [curriculumInfo] WHERE [curId] = @curId" InsertCommand="INSERT INTO [curriculumInfo] ([curId], [curName], [curTeacher], [curCredit]) VALUES (@curId, @curName, @curTeacher, @curCredit)" SelectCommand="SELECT [curNum], [curId], [curName], [curTeacher], [curCredit] FROM [curriculumInfo]" UpdateCommand="UPDATE [curriculumInfo] SET [curNum] = @curNum, [curName] = @curName, [curTeacher] = @curTeacher, [curCredit] = @curCredit WHERE [curId] = @curId">
            <DeleteParameters>
                <asp:Parameter Name="curId" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="curId" Type="String" />
                <asp:Parameter Name="curName" Type="String" />
                <asp:Parameter Name="curTeacher" Type="String" />
                <asp:Parameter Name="curCredit" Type="Double" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="curNum" Type="Int32" />
                <asp:Parameter Name="curName" Type="String" />
                <asp:Parameter Name="curTeacher" Type="String" />
                <asp:Parameter Name="curCredit" Type="Double" />
                <asp:Parameter Name="curId" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
         <asp:Label ID="labMsg" runat="server" ForeColor="Red"></asp:Label>
       
            <%--<EditItemTemplate>
                课程编号:
                <asp:Label ID="curNumLabel1" runat="server" Text='<%# Eval("curNum") %>' />
                <br />
                课程号:
                <asp:Label ID="curIdLabel1" runat="server" Text='<%# Eval("curId") %>' />
                <br />
                课程名称:
                <asp:TextBox ID="curNameTextBox" runat="server" Text='<%# Bind("curName") %>' OnTextChanged="curNameTextBox_TextChanged" />
                <br />
                授课老师:
                <asp:TextBox ID="curTeacherTextBox" runat="server" Text='<%# Bind("curTeacher") %>' />
                <br />
                课程学分:
                <asp:TextBox ID="curCreditTextBox" runat="server" Text='<%# Bind("curCredit") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" OnClick="UpdateButton_Click1" Text="更新" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </EditItemTemplate>--%>
         <asp:FormView ID="FormView1" runat="server" DefaultMode="Insert" CellPadding="4" ForeColor="#333333" style="margin-top: 0px" CellSpacing="10" AllowPaging="True" DataKeyNames="curId" DataSourceID="SqlDataSource1"  OnPageIndexChanging="FormView1_PageIndexChanging">
             <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
              
            <InsertItemTemplate>
                课程编号:
                <asp:TextBox ID="txtCurId" runat="server" Text='<%# Bind("curId") %>' />
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="*" ControlToValidate="txtCurId"></asp:RequiredFieldValidator>
                <br />
                <br />
                课程名称:
                <asp:TextBox ID="txtCurName" runat="server" Text='<%# Bind("curName") %>' />
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="*" ControlToValidate="txtCurName"></asp:RequiredFieldValidator>
                <br />
                <br />
                授课老师:
                <asp:TextBox ID="txtCurTeacher" runat="server" Text='<%# Bind("curTeacher") %>' />
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ErrorMessage="*" ControlToValidate="txtCurTeacher"></asp:RequiredFieldValidator>
                <br />
                <br />
                课程学分:
                <asp:TextBox ID="txtCurCredit" runat="server" Text='<%# Bind("curCredit") %>' />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ErrorMessage="*" ControlToValidate="txtCurCredit"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" OnClick="UpdateButton_Click1" CommandName="Insert" Text="插入"  Font-Size="Medium" Font-Bold="True" 
                    CssClass="buttonCSS1" Height="20px" Width="60px" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"  Font-Size="Medium" Font-Bold="True" 
                    CssClass="buttonCSS1" Height="20px" Width="60px"/>
            </InsertItemTemplate>
           <%-- <ItemTemplate>
                课程编号:
                <asp:Label ID="curNumLabel" runat="server" Text='<%# Eval("curNum") %>' />
                <br />
                课程号:
                <asp:Label ID="curIdLabel" runat="server" Text='<%# Eval("curId") %>' />
                <br />
                课程名称:
                <asp:Label ID="curNameLabel" runat="server" Text='<%# Bind("curName") %>' />
                <br />
                授课老师:
                <asp:Label ID="curTeacherLabel" runat="server" Text='<%# Bind("curTeacher") %>' />
                <br />
                课程学分:
                <asp:Label ID="curCreditLabel" runat="server" Text='<%# Bind("curCredit") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="编辑" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="新建" />
            </ItemTemplate>--%>
        </asp:FormView>
        <br />
    
    </div>
</asp:Content>

