<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ChangeTickets.aspx.cs" Inherits="WebApplication1.ChangeTickets" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    <title>Delete Tickets</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="submain_title">
        Отменить билет
    </h2>
    <div class="image">
        <img src="Styles/отмена.png" height="300" class="pic" />
    </div>
    <div style="display: flex;justify-content: center;">
        <asp:GridView ID="GridView1" runat="server" CssClass="table_text" DataKeyNames="ID_ticket" ForeColor="#E5E1DD" GridLines="None" HorizontalAlign="Center" BackColor="#395464" BorderColor="#462E2F" BorderStyle="Solid" BorderWidth="5px" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="1570px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#234153" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="ID_client" HeaderText="ID_client" SortExpression="ID_client" Visible="False"/>
                <asp:BoundField DataField="Login" HeaderText="Login" SortExpression="Login" Visible="False"/>
                <asp:BoundField DataField="ID_ticket" HeaderText="ID_билета" SortExpression="ID_ticket"/>
                <asp:BoundField DataField="ID_passage" HeaderText="ID_passage" SortExpression="ID_passage" Visible="False"/>
                <asp:BoundField DataField="ID_ticket_type" HeaderText="ID_ticket_type" SortExpression="ID_ticket_type" Visible="False"/>
                <asp:BoundField DataField="ID_event" HeaderText="ID_event" SortExpression="ID_event" Visible="False"/>
                <asp:BoundField DataField="ID_event_type" HeaderText="ID_event_type" SortExpression="ID_event_type" Visible="False" />
                <asp:BoundField DataField="Event_type" HeaderText="Тип" SortExpression="Event_type" />
                <asp:BoundField DataField="Event_name" HeaderText="Название" SortExpression="Event_name" />
                <asp:BoundField DataField="Event_description" HeaderText="Описание" SortExpression="Event_description" />
                <asp:BoundField DataField="Ticket_type" HeaderText="Тип билета" SortExpression="Ticket_type" />
                <asp:BoundField DataField="Event_date" HeaderText="Дата проведения" SortExpression="Event_date" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Event_time" HeaderText="Время проведения" SortExpression="Event_time" DataFormatString="{0:t}" />
                <asp:BoundField DataField="Summ_price" HeaderText="Цена билета" SortExpression="Summ_price" DataFormatString="{0:C}" />
            </Columns>
            <SelectedRowStyle BackColor="#101D25" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString2 %>" SelectCommand="SELECT * FROM [Ticket] WHERE ([Login] = @Login)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="Login" SessionField="IdU" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <br />
    <br />
    <div style="display: flex;justify-content: center;">
        <a class="text" href="PersonalPage.aspx">Вернуться в личный кабинет</a>
    </div>
    <br />
    <br />
    <div style="display: flex;justify-content: center;">
        <asp:Button ID="Button1" runat="server" Text="Удалить выбранный билет" CssClass="deleteAccountButton" OnClick="Button1_Click" />
    </div>
</asp:Content>
