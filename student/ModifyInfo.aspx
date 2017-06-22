<%@ Page Title="" Language="C#" MasterPageFile="~/student/student.master" AutoEventWireup="true" CodeFile="ModifyInfo.aspx.cs" Inherits="student_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>学生成绩管理系统</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
      <h1 style="text-align:center;color:#CC9900">个人信息修改</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <br />
    
    <h2>您的个人信息</h2>
    <div style="margin-left:200px">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:stuInfoConnectionString %>" SelectCommand="SELECT [stdXh], [stdSfzhm], [stdXm], [stdRxsj], [stdSzbj], [stdSfby], [stdJtdz], [stdLxdh] FROM [stdInfo] WHERE ([stdXh] = @stdXh)">
    <SelectParameters>
        <asp:SessionParameter Name="stdXh" SessionField="stdXh" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
      <asp:Label ID="labMsg" ForeColor="Red" runat="server"></asp:Label>
<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="stdXh" DataSourceID="SqlDataSource1" Height="50px" Width="559px">
    <Fields>
        <asp:BoundField DataField="stdXh" HeaderText="学号" ReadOnly="True" SortExpression="stdXh" />
        <asp:BoundField DataField="stdSfzhm" HeaderText="身份证号码" SortExpression="stdSfzhm" />
        <asp:BoundField DataField="stdXm" HeaderText="姓名" SortExpression="stdXm" />
        <asp:BoundField DataField="stdRxsj" HeaderText="入学时间" SortExpression="stdRxsj" />
        <asp:BoundField DataField="stdSzbj" HeaderText="所在班级" SortExpression="stdSzbj" />
        <asp:CheckBoxField DataField="stdSfby" HeaderText="是否毕业" SortExpression="stdSfby" />
        <asp:BoundField DataField="stdLxdh" HeaderText="联系方式" SortExpression="stdLxdh" />
        <asp:BoundField DataField="stdJtdz" HeaderText="家庭住址" />
    </Fields>
</asp:DetailsView>

    </div>
        <div style="margin-left:300px">
    <br />
    <br />
<asp:FormView ID="FormView1" runat="server" DataKeyNames="stdXh" DataSourceID="SqlDataSource2" DefaultMode="Edit" OnItemUpdating="FormView1_ItemUpdating">
    <EditItemTemplate>
        <br />
        变更请求:
        <asp:TextBox ID="stdBgqqTextBox" runat="server" Text='<%# Bind("stdBgqq") %>' TextMode="MultiLine" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="stdBgqqTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" CssClass="buttonCSS" OnClientClick="LinkButton1_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" CssClass="buttonCSS" />
    </EditItemTemplate>
    <InsertItemTemplate>
        stdXh:
        <asp:TextBox ID="stdXhTextBox" runat="server" Text='<%# Bind("stdXh") %>' />
        <br />
        stdMm:
        <asp:TextBox ID="stdMmTextBox" runat="server" Text='<%# Bind("stdMm") %>' />
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
        stdMm:
        <asp:Label ID="stdMmLabel" runat="server" Text='<%# Bind("stdMm") %>' />
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
    </ItemTemplate>
     <FooterStyle BackColor="#CCCC99" />
             <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#F7F7DE" ForeColor="Black" 
            HorizontalAlign="Right" />
             <RowStyle BackColor="#F7F7DE" ForeColor="Black" />
            
</asp:FormView>
            <br /><br /> 
            <h2><div style="margin-left:-300px">
                更新个人照片</div>
                <br /><div style="margin-left:60px"><asp:FileUpload ID="imgupload" runat="server" />
             <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="imgUpload" ErrorMessage="Upload Image" ForeColor="Red"></asp:RequiredFieldValidator>
          </h2>
            <div style="margin-left:119px"><asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Submit" /> </div>
            </div>
<%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" 
                    CssClass="buttonCSS" onclientclick="Button2_Click()" Text="Reset" Width="63px" />--%>
    </div>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:stuInfoConnectionString %>" SelectCommand="SELECT * FROM [stdInfo] WHERE ([stdXh] = @stdXh)">
    <SelectParameters>
        <asp:SessionParameter Name="stdXh" SessionField="stdXh" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>

