<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/admin/admin.master" CodeFile="addStdInfo.aspx.cs" Inherits="admin_addStdInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <h1>学生成绩管理系统</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <h1 style="text-align:center;color:#CC9900" >学生信息管理</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <div>
    <br />
       <h2> 添加学生信息</h2>
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
                <asp:SessionParameter Name="stdXh" SessionField="stdXh" Type="String" />
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
        <br />
        <br />
        <div style="margin-left:300px;margin-top:-50px">
        <asp:Label ID="labMsg" runat="server" ForeColor="Red"></asp:Label>
        <br />
       <%-- <asp:FormView ID="FormView1" runat="server" DefaultMode="Insert" 
            CellPadding="4" ForeColor="#333333" DataKeyNames="stdXh" DataSourceID="SqlDataSource1" OnItemUpdated="FormView1_ItemUpdated" OnPageIndexChanging="FormView1_PageIndexChanging" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellSpacing="10" Height="200px">
            <EditItemTemplate>
                stdXh:
                <asp:Label ID="stdXhLabel1" runat="server" Text='<%# Eval("stdXh") %>' />
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
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </EditItemTemplate>
            <EditRowStyle Height="200px" HorizontalAlign="Center" Width="200px" />
            <EmptyDataRowStyle HorizontalAlign="Center" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <InsertItemTemplate>
                stdXh: <asp:TextBox ID="stdXhTextBox" runat="server" Text='<%# Bind("stdXh") %>'></asp:TextBox>
                <br />
                stdSfzhm: <asp:TextBox ID="stdSfzhmTextBox" runat="server" Text='<%# Bind("stdSfzhm") %>'></asp:TextBox>
                <br />
                stdXm: <asp:TextBox ID="stdXmTextBox" runat="server" Text='<%# Bind("stdXm") %>'></asp:TextBox>
                <br />
                stdRxsj: <asp:TextBox ID="stdRxsjTextBox" runat="server" Text='<%# Bind("stdRxsj") %>'></asp:TextBox>
                <br />
                stdSzbj: <asp:TextBox ID="stdSzbjTextBox" runat="server" Text='<%# Bind("stdSzbj") %>'></asp:TextBox>
                <br />
                stdSfby:
                <asp:CheckBox ID="stdSfbyCheckBox" runat="server" Checked='<%# Bind("stdSfby") %>' />
                <br />
                stdJtdz: <asp:TextBox ID="stdJtdzTextBox" runat="server" Text='<%# Bind("stdJtdz") %>'></asp:TextBox>
                <br />
                stdLxdh: <asp:TextBox ID="stdLxdhTextBox" runat="server" Text='<%# Bind("stdLxdh") %>'></asp:TextBox>
                <br />
                stdBgqq: <asp:TextBox ID="stdBgqqTextBox" runat="server" Text='<%# Bind("stdBgqq") %>'></asp:TextBox>
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="插入"></asp:LinkButton>
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
            </InsertItemTemplate>
            <InsertRowStyle HorizontalAlign="Left" />
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
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
        </asp:FormView>--%>
             <asp:FormView ID="FormView1" runat="server" DefaultMode="Insert" 
            CellPadding="4" ForeColor="#333333" OnPageIndexChanging="FormView1_PageIndexChanging1" style="margin-top: 0px" CellSpacing="10">
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <InsertItemTemplate>
                学&nbsp &nbsp&nbsp&nbsp&nbsp号：&nbsp&nbsp&nbsp&nbsp<asp:TextBox ID="txtStdXh" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="*" ControlToValidate="txtStdXm"></asp:RequiredFieldValidator>
                <br />
                姓&nbsp &nbsp&nbsp&nbsp&nbsp名：&nbsp&nbsp&nbsp&nbsp<asp:TextBox ID="txtStdXm" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ErrorMessage="*" ControlToValidate="txtStdXm"></asp:RequiredFieldValidator>
                <br />

                初始密码：&nbsp&nbsp&nbsp<asp:TextBox ID="txtStdMm" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ErrorMessage="*" ControlToValidate="txtStdMm"></asp:RequiredFieldValidator>
                <br />
                确认密码：&nbsp&nbsp&nbsp<asp:TextBox ID="txtComfigStdMm" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ErrorMessage="*" ControlToValidate="txtComfigStdMm"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ErrorMessage="2次密码输入不一致" ControlToCompare="txtComfigStdMm" 
                    ControlToValidate="txtStdMm"></asp:CompareValidator>
                <br />
                身份证号码：<asp:TextBox ID="txtStdSfzhm" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ErrorMessage="*" ControlToValidate="txtStdSfzhm"></asp:RequiredFieldValidator>
                <br />
                入学时间：&nbsp&nbsp&nbsp<asp:TextBox ID="txtStdRxsj" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtStdRxsj" ErrorMessage="*日期格式不对" 
                    ValidationExpression="\d{4}-\d{2}-\d{2}"></asp:RegularExpressionValidator>
                <br />
                所在班级：&nbsp&nbsp&nbsp<asp:TextBox ID="txtStdSzbj" runat="server"></asp:TextBox>
                <br />
                家庭地址：&nbsp&nbsp&nbsp<asp:TextBox ID="txtStdJtdz" runat="server"></asp:TextBox>
                <br />
                联系电话：&nbsp&nbsp&nbsp<asp:TextBox ID="txtStdLxdh" runat="server"></asp:TextBox>
                <br />
                                     
                &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <asp:LinkButton ID="btnAdd" runat="server" onclick="btnAdd_Click" Font-Size="Medium" Font-Bold="True" 
                    CssClass="buttonCSS1" Height="20px" Width="60px">添加</asp:LinkButton>
                
            </InsertItemTemplate>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        </asp:FormView>
    </div>
    </div>
</asp:Content>

