<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ChangePersonalData.aspx.cs" Inherits="WebApplication1.ChangePersonalData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    <title>Change Personal Data</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="submain_title">
        Изменить личные данные
    </h2>
    <div class="image">
        <img src="Styles/котенок.png" height="300" class="pic" />
    </div>
    <div style="display: flex;justify-content: center;">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID_client" DataSourceID="SqlDataSource1" HorizontalAlign="Center" CssClass="table_text" ForeColor="#E5E1DD" GridLines="None" Width="970px" BackColor="#395464" BorderColor="#462E2F" BorderStyle="Solid" BorderWidth="5px" >
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="ID_client" HeaderText="ID_client" InsertVisible="False" ReadOnly="True" SortExpression="ID_client" Visible="False" />
                <asp:BoundField DataField="Login" HeaderText="Login" SortExpression="Login" />
                <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                <asp:BoundField DataField="Client_name" HeaderText="Имя" SortExpression="Client_name" />
                <asp:BoundField DataField="Client_surname" HeaderText="Фамилия" SortExpression="Client_surname" />
                <asp:BoundField DataField="Client_Patronymic" HeaderText="Отчество" SortExpression="Client_Patronymic" />
                <asp:BoundField DataField="Client_birthday" HeaderText="Дата рождения" SortExpression="Client_birthday" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Client_phoneNum" HeaderText="Номер телефона" SortExpression="Client_phoneNum" />
                <asp:BoundField DataField="Client_e_mail" HeaderText="Эл. почта" SortExpression="Client_e_mail" />
            </Columns>
        </asp:GridView>
    </div>
    <br />
    <div style="display: flex;justify-content: center;">
        <a class="text" href="PersonalPage.aspx">Вернуться в личный кабинет</a>
    </div>
    <br />
    <br />
    <div style="display: flex;justify-content: center;">
        <asp:Button ID="Button1" runat="server" Text="Удалить аккаунт" CssClass="deleteAccountButton" OnClick="Button1_Click" />
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString2 %>" DeleteCommand="DELETE FROM [Clients] WHERE [ID_client] = @original_ID_client AND [Login] = @original_Login AND [Password] = @original_Password AND (([Client_name] = @original_Client_name) OR ([Client_name] IS NULL AND @original_Client_name IS NULL)) AND (([Client_surname] = @original_Client_surname) OR ([Client_surname] IS NULL AND @original_Client_surname IS NULL)) AND (([Client_Patronymic] = @original_Client_Patronymic) OR ([Client_Patronymic] IS NULL AND @original_Client_Patronymic IS NULL)) AND (([Client_birthday] = @original_Client_birthday) OR ([Client_birthday] IS NULL AND @original_Client_birthday IS NULL)) AND (([Client_phoneNum] = @original_Client_phoneNum) OR ([Client_phoneNum] IS NULL AND @original_Client_phoneNum IS NULL)) AND (([Client_e_mail] = @original_Client_e_mail) OR ([Client_e_mail] IS NULL AND @original_Client_e_mail IS NULL))" InsertCommand="INSERT INTO [Clients] ([Login], [Password], [Client_name], [Client_surname], [Client_Patronymic], [Client_birthday], [Client_phoneNum], [Client_e_mail]) VALUES (@Login, @Password, @Client_name, @Client_surname, @Client_Patronymic, @Client_birthday, @Client_phoneNum, @Client_e_mail)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Clients] WHERE ([Login] = @Login)" UpdateCommand="UPDATE [Clients] SET [Login] = @Login, [Password] = @Password, [Client_name] = @Client_name, [Client_surname] = @Client_surname, [Client_Patronymic] = @Client_Patronymic, [Client_birthday] = @Client_birthday, [Client_phoneNum] = @Client_phoneNum, [Client_e_mail] = @Client_e_mail WHERE [ID_client] = @original_ID_client AND [Login] = @original_Login AND [Password] = @original_Password AND (([Client_name] = @original_Client_name) OR ([Client_name] IS NULL AND @original_Client_name IS NULL)) AND (([Client_surname] = @original_Client_surname) OR ([Client_surname] IS NULL AND @original_Client_surname IS NULL)) AND (([Client_Patronymic] = @original_Client_Patronymic) OR ([Client_Patronymic] IS NULL AND @original_Client_Patronymic IS NULL)) AND (([Client_birthday] = @original_Client_birthday) OR ([Client_birthday] IS NULL AND @original_Client_birthday IS NULL)) AND (([Client_phoneNum] = @original_Client_phoneNum) OR ([Client_phoneNum] IS NULL AND @original_Client_phoneNum IS NULL)) AND (([Client_e_mail] = @original_Client_e_mail) OR ([Client_e_mail] IS NULL AND @original_Client_e_mail IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_ID_client" Type="Int32" />
            <asp:Parameter Name="original_Login" Type="String"  />
            <asp:Parameter Name="original_Password" Type="String"  />
            <asp:Parameter Name="original_Client_name" Type="String"  />
            <asp:Parameter Name="original_Client_surname" Type="String"  />
            <asp:Parameter Name="original_Client_Patronymic" Type="String" />
            <asp:Parameter DbType="Date" Name="original_Client_birthday" />
            <asp:Parameter Name="original_Client_phoneNum" Type="String"  />
            <asp:Parameter Name="original_Client_e_mail" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Login" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Client_name" Type="String" />
            <asp:Parameter Name="Client_surname" Type="String" />
            <asp:Parameter Name="Client_Patronymic" Type="String" />
            <asp:Parameter DbType="Date" Name="Client_birthday" />
            <asp:Parameter Name="Client_phoneNum" Type="String" />
            <asp:Parameter Name="Client_e_mail" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="Login" SessionField="IdU" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Login" Type="String" />
            <asp:Parameter Name="Password" Type="String" />
            <asp:Parameter Name="Client_name" Type="String" />
            <asp:Parameter Name="Client_surname" Type="String" />
            <asp:Parameter Name="Client_Patronymic" Type="String" />
            <asp:Parameter DbType="Date" Name="Client_birthday" />
            <asp:Parameter Name="Client_phoneNum" Type="String" />
            <asp:Parameter Name="Client_e_mail" Type="String" />
            <asp:Parameter Name="original_ID_client" Type="Int32" />
            <asp:Parameter Name="original_Login" Type="String" />
            <asp:Parameter Name="original_Password" Type="String" />
            <asp:Parameter Name="original_Client_name" Type="String" />
            <asp:Parameter Name="original_Client_surname" Type="String" />
            <asp:Parameter Name="original_Client_Patronymic" Type="String" />
            <asp:Parameter DbType="Date" Name="original_Client_birthday" />
            <asp:Parameter Name="original_Client_phoneNum" Type="String" />
            <asp:Parameter Name="original_Client_e_mail" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
