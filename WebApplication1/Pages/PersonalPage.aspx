<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PersonalPage.aspx.cs" Inherits="WebApplication1.PersonalPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    <title>Personal Page</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 class="submain_title">
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </h2>
    <div class="image">
        <img src="Styles/лк.png" height="300" class="pic" />
    </div>
    <div class="row">
        <section class="col-md-4" aria-labelledby="changePersonalData">
            <div style="text-align:center;"><a class="text" href="ChangePersonalData.aspx">Изменить личные данные</a></div>
        </section>
        <section class="col-md-4" aria-labelledby="getNewTickets">
            <div style="text-align:center;"><a class="text" href="OrderNewTickets.aspx">Забронировать билеты</a></div>
        </section>
        <section class="col-md-4" aria-labelledby="changeTickets">
            <div style="text-align:center;"><a class="text" href="ChangeTickets.aspx">Отменить билеты</a></div>
        </section>
    </div>
    <h2 class="submain_title">Ваши билеты</h2>
    <div style="display: block;margin-left: auto;margin-right: auto; width:1087px;">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table_text" ForeColor="#E5E1DD" GridLines="None" HorizontalAlign="Center" Width="1086px" BackColor="#395464" BorderColor="#462E2F" BorderStyle="Solid" BorderWidth="5px" AllowSorting="True" AllowPaging="True">
            <AlternatingRowStyle BackColor="#234153" />
            <Columns>
                <asp:BoundField DataField="ID_client" HeaderText="ID_client" SortExpression="ID_client" Visible="False"/>
                <asp:BoundField DataField="Login" HeaderText="Login" SortExpression="Login" Visible="False"/>
                <asp:BoundField DataField="ID_ticket" HeaderText="ID_ticket" SortExpression="ID_ticket" Visible="False"/>
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
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString2 %>" SelectCommand="SELECT * FROM [Ticket] WHERE ([Login] = @Login)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="Login" SessionField="IdU" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
