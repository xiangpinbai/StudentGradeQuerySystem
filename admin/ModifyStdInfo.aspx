<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ModifyStdInfo.aspx.cs" Inherits="admin_alterStdInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <h1>学生成绩管理系统</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <h1 style="text-align:center;color:#CC9900" >学生信息管理</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
     <div>
     <br />
       <h2> 修改学生信息</h2>
         <div style="margin-left:350px;">
               <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:stuInfoConnectionString %>" DeleteCommand="DELETE FROM [stdInfo] WHERE [stdXh] = @stdXh" InsertCommand="INSERT INTO [stdInfo] ([stdXh], [stdSfzhm], [stdXm], [stdRxsj], [stdSzbj], [stdSfby], [stdJtdz], [stdLxdh], [stdBgqq]) VALUES (@stdXh, @stdSfzhm, @stdXm, @stdRxsj, @stdSzbj, @stdSfby, @stdJtdz, @stdLxdh, @stdBgqq)" SelectCommand="SELECT [stdXh], [stdSfzhm], [stdXm], [stdRxsj], [stdSzbj], [stdSfby], [stdJtdz], [stdLxdh], [stdBgqq] FROM [stdInfo] WHERE ([stdXh] = @stdXh)" UpdateCommand="UPDATE [stdInfo] SET [stdSfzhm] = @stdSfzhm, [stdXm] = @stdXm, [stdRxsj] = @stdRxsj, [stdSzbj] = @stdSzbj, [stdSfby] = @stdSfby, [stdJtdz] = @stdJtdz, [stdLxdh] = @stdLxdh, [stdBgqq] = @stdBgqq WHERE [stdXh] = @stdXh">
            <DeleteParameters>
                <asp:Parameter Name="stdXh" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="stdXh" Type="String" />
                <asp:Parameter Name="stdSfzhm" Type="String" />
                <asp:Parameter Name="stdXm" Type="String" />
                <asp:Parameter Name="stdRxsj" Type="DateTime" />
                <asp:Parameter Name="stdSzbj" Type="String" />
                <asp:Parameter Name="stdSfby" Type="Boolean" />
                <asp:Parameter Name="stdJtdz" Type="String" />
                <asp:Parameter Name="stdLxdh" Type="String" />
                <asp:Parameter Name="stdBgqq" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="stdXh" QueryStringField="stdXh" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="stdSfzhm" Type="String" />
                <asp:Parameter Name="stdXm" Type="String" />
                <asp:Parameter Name="stdRxsj" Type="DateTime" />
                <asp:Parameter Name="stdSzbj" Type="String" />
                <asp:Parameter Name="stdSfby" Type="Boolean" />
                <asp:Parameter Name="stdJtdz" Type="String" />
                <asp:Parameter Name="stdLxdh" Type="String" />
                <asp:Parameter Name="stdBgqq" Type="String" />
                <asp:Parameter Name="stdXh" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="stdXh" DataSourceID="SqlDataSource1" DefaultMode="Edit" OnItemUpdated="FormView1_ItemUpdated" OnPageIndexChanging="FormView1_PageIndexChanging" AllowPaging="True" Height="269px" style="margin-left: 0px" Width="265px">
            <EditItemTemplate>
                <br />
                学&nbsp;&nbsp; 号:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="stdXhLabel1" runat="server" Text='<%# Eval("stdXh") %>' />
                <br />
                <br />
                身份证号码:&nbsp;
                <asp:TextBox ID="stdSfzhmTextBox" runat="server" Text='<%# Bind("stdSfzhm") %>' />
                <br />
                <br />
                姓&nbsp;&nbsp; 名:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="stdXmTextBox" runat="server" Text='<%# Bind("stdXm") %>' />
                <br />
                <br />
                入学时间:&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="stdRxsjTextBox" runat="server" Text='<%# Bind("stdRxsj") %>' />
                <br />
                <br />
                所在班级:&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="stdSzbjTextBox" runat="server" Text='<%# Bind("stdSzbj") %>' />
                <br />
                <br />
                是否毕业:&nbsp;&nbsp;&nbsp;
                <asp:CheckBox ID="stdSfbyCheckBox" runat="server" Checked='<%# Bind("stdSfby") %>' />
                <br />
                <br />
                家庭住址:&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="stdJtdzTextBox" runat="server" Text='<%# Bind("stdJtdz") %>' />
                <br />
                <br />
                联系电话:&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="stdLxdhTextBox" runat="server" Text='<%# Bind("stdLxdh") %>' />
                <br />
                <br />
                变更请求:&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="stdBgqqTextBox" runat="server" Text='<%# Bind("stdBgqq") %>' />
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </EditItemTemplate>
            <InsertItemTemplate>
                stdXh:
                <asp:TextBox ID="stdXhTextBox" runat="server" Text='<%# Bind("stdXh") %>' />
                <br />
                stdSfzhm:
                <asp:TextBox ID="stdSfzhmTextBox" runat="server" Text='<%# Bind("stdSfzhm") %>' />
                <br />
                stdXm:
                <asp:TextBox ID="stdXmTextBox" runat="server" Text='<%# Bind("stdXm") %>' />
                <br />
                stdRxsj:
                <asp:TextBox ID="stdRxsjTextBox" runat="server" Text='<%# Bind("stdRxsj") %>' />
                <br />
                stdSzbj:
                <asp:TextBox ID="stdSzbjTextBox" runat="server" Text='<%# Bind("stdSzbj") %>' />
                <br />
                stdSfby:
                <asp:CheckBox ID="stdSfbyCheckBox" runat="server" Checked='<%# Bind("stdSfby") %>' />
                <br />
                stdJtdz:
                <asp:TextBox ID="stdJtdzTextBox" runat="server" Text='<%# Bind("stdJtdz") %>' />
                <br />
                stdLxdh:
                <asp:TextBox ID="stdLxdhTextBox" runat="server" Text='<%# Bind("stdLxdh") %>' />
                <br />
                stdBgqq:
                <asp:TextBox ID="stdBgqqTextBox" runat="server" Text='<%# Bind("stdBgqq") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </InsertItemTemplate>
            <ItemTemplate>
                stdXh:
                <asp:Label ID="stdXhLabel" runat="server" Text='<%# Eval("stdXh") %>' />
                <br />
                stdSfzhm:
                <asp:Label ID="stdSfzhmLabel" runat="server" Text='<%# Bind("stdSfzhm") %>' />
                <br />
                stdXm:
                <asp:Label ID="stdXmLabel" runat="server" Text='<%# Bind("stdXm") %>' />
                <br />
                stdRxsj:
                <asp:Label ID="stdRxsjLabel" runat="server" Text='<%# Bind("stdRxsj") %>' />
                <br />
                stdSzbj:
                <asp:Label ID="stdSzbjLabel" runat="server" Text='<%# Bind("stdSzbj") %>' />
                <br />
                stdSfby:
                <asp:CheckBox ID="stdSfbyCheckBox" runat="server" Checked='<%# Bind("stdSfby") %>' Enabled="false" />
                <br />
                stdJtdz:
                <asp:Label ID="stdJtdzLabel" runat="server" Text='<%# Bind("stdJtdz") %>' />
                <br />
                stdLxdh:
                <asp:Label ID="stdLxdhLabel" runat="server" Text='<%# Bind("stdLxdh") %>' />
                <br />
                stdBgqq:
                <asp:Label ID="stdBgqqLabel" runat="server" Text='<%# Bind("stdBgqq") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="编辑" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="新建" />
            </ItemTemplate>
            
            
             <RowStyle BackColor="#F7F7DE" ForeColor="Black" />
        </asp:FormView></div>
         <br />
    </div>
</asp:Content>

