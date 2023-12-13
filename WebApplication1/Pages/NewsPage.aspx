<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="NewsPage.aspx.cs" Inherits="WebApplication1.NewsPage" %>
<asp:Content ContentPlaceHolderID="Title" runat="server">
    <title>News</title>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="display: block;margin-left: auto;margin-right: auto; width:410px">
        <h2 class="submain_title">Раздел с новыми меропрятиями</h2>
        <p>Вы можете задать фильтры и на их основе посмотреть мероприятия, проводимые в музее</p>
        <br />
        <div class="lists">
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Event_type" DataValueField="ID_event_type" BackColor="#462E2F" Font-Names="Arial" ForeColor="#FEFAF6" AppendDataBoundItems="True">
                <asp:ListItem Selected="True" Value="0">Не выбрано</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Event_date" DataValueField="Event_date" BackColor="#462E2F" Font-Names="Arial" ForeColor="#FEFAF6" AppendDataBoundItems="True">
                <asp:ListItem Selected="True" Value="0">Не выбрано</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="buttons">
            <asp:Button ID="Button1" runat="server" Text="Поиск по типу" OnClick="Button1_Click" BackColor="#395464" BorderColor="#395464" ForeColor="#E5E1DD" />
            <asp:Button ID="Button3" runat="server" Text="Поиск по типу и дате" OnClick="Button3_Click" BackColor="#395464" BorderColor="#395464" ForeColor="#E5E1DD" />
            <asp:Button ID="Button2" runat="server" Text="Поиск по дате" OnClick="Button2_Click" BackColor="#395464" BorderColor="#395464" ForeColor="#E5E1DD" />
        </div>
        <div class="table">
             <center>
                <asp:GridView ID="GridView1" runat="server" CssClass="table_text" AutoGenerateColumns="False" ForeColor="#E5E1DD" DataSourceID="SqlDataSource3" AllowPaging="True" BackColor="#395464" Width="410px" AllowSorting="True">
                    <AlternatingRowStyle BackColor="#234153" />
                    <Columns>
                        <asp:BoundField DataField="ID_event" HeaderText="ID_event" SortExpression="ID_event" Visible="False" />
                        <asp:BoundField DataField="Event_name" HeaderText="Название" SortExpression="Event_name" />
                        <asp:BoundField DataField="ID_event_type" HeaderText="ID_event_type" SortExpression="ID_event_type" Visible="False" />
                        <asp:BoundField DataField="Event_type" HeaderText="Тип" SortExpression="Event_type" />
                        <asp:BoundField DataField="Event_date" HeaderText="Дата проведения" SortExpression="Event_date" DataFormatString="{0:d}" />
                    </Columns>
                </asp:GridView>
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </center>
        </div>
        <div class="last_button">
            <asp:Button ID="Button4" runat="server" Text="Сброс" OnClick="Button4_Click" BackColor="#395464" BorderColor="#395464" ForeColor="#E5E1DD" />
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString2 %>" SelectCommand="SELECT * FROM [Events]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString2 %>" SelectCommand="SELECT * FROM [Event_type]" ></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString2 %>" SelectCommand="SELECT DISTINCT [Event_date] FROM [Events]" OldValuesParameterFormatString="{0: d}"></asp:SqlDataSource>
</asp:Content>
