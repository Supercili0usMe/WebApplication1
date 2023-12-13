<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PosterPage.aspx.cs" Inherits="WebApplication1.WebForm2" %>
<asp:Content ContentPlaceHolderID="Title" runat="server">
    <title>Poster</title>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <p>Выберите тип мероприятия:</p>
        <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="Event_type" DataValueField="ID_event_type" DataSourceID="SqlDataSource8" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1" BackColor="#462E2F" Font-Names="Arial" ForeColor="#FEFAF6" AutoPostBack="True" AppendDataBoundItems="True"></asp:DropDownList>
        <asp:SqlDataSource runat="server" ID="SqlDataSource8" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString2 %>" SelectCommand="SELECT * FROM [Event_type]"></asp:SqlDataSource>
    <br />
    </div>
    <div>
        <br />
        <p>Найденные мероприятия:</p>
        <asp:GridView OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table_text" ID="GridView1" runat="server" AutoGenerateColumns="False" AllowSorting="True" DataSourceID="SqlDataSource4" DataKeyNames="ID_passage" CellPadding="4" ForeColor="#E5E1DD" GridLines="None" HorizontalAlign="Center" Width="970px" BackColor="#395464" BorderColor="#462E2F" BorderStyle="Solid" BorderWidth="5px">
            <AlternatingRowStyle BackColor="#234153" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Тип" HeaderText="Тип" SortExpression="Тип"></asp:BoundField>
                <asp:BoundField DataField="Название" HeaderText="Название" SortExpression="Название"></asp:BoundField>
                <asp:BoundField DataField="Описание" HeaderText="Описание" SortExpression="Описание" Visible="False"></asp:BoundField>
                <asp:BoundField DataField="Цена билета" HeaderText="Цена билета" SortExpression="Цена билета" DataFormatString="{0:C}" ></asp:BoundField>
                <asp:BoundField DataField="Фамилия экскурсовода" HeaderText="Фамилия экскурсовода" SortExpression="Фамилия экскурсовода" Visible="False" ></asp:BoundField>
                <asp:BoundField DataField="Имя экскурсовода" HeaderText="Имя экскурсовода" SortExpression="Имя экскурсовода" Visible="False" ></asp:BoundField>
                <asp:BoundField DataField="Отчество экскурсовода" HeaderText="Отчество экскурсовода" SortExpression="Отчество экскурсовода" Visible="False" ></asp:BoundField>
                <asp:BoundField DataField="Дaта проведения" HeaderText="Дaта проведения" SortExpression="Дaта проведения" ApplyFormatInEditMode="True" DataFormatString="{0:d}"></asp:BoundField>
                <asp:BoundField DataField="Время" HeaderText="Время" SortExpression="Время" DataFormatString="{0:t}"></asp:BoundField>
                <asp:BoundField DataField="ID_event_type" HeaderText="ID_event_type" SortExpression="ID_event_type" Visible="False"></asp:BoundField>
                <asp:BoundField DataField="ID_passage" HeaderText="ID_passage" ReadOnly="True" SortExpression="ID_passage" Visible="False"></asp:BoundField>
            </Columns>
            <EditRowStyle CssClass="table_text" />
            <SelectedRowStyle BackColor="#101D25" />
        </asp:GridView>
        <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString2 %>" SelectCommand="SELECT * FROM [Posters] WHERE ([ID_event_type] = @ID_event_type)">
            <SelectParameters>
                <asp:SessionParameter SessionField="IDT" DefaultValue="0" Name="ID_event_type" Type="Int32"></asp:SessionParameter>
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <p>Для того, чтобы узнать подробную информацию о мероприятии, нажмите на кнопку "Выбор"</p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="ID_passage" DataSourceID="SqlDataSource1" ForeColor="#E5E1DD" GridLines="None" Height="50px" HorizontalAlign="Center" Width="595px" BackColor="#395464" CssClass="table_text table_text_1" Font-Names="Arial" BorderColor="#462E2F" BorderStyle="Solid" BorderWidth="5px" >
            <Fields>
                <asp:BoundField DataField="Тип" HeaderText="Тип" SortExpression="Тип" />
                <asp:BoundField DataField="Название" HeaderText="Название" SortExpression="Название" />
                <asp:BoundField DataField="Описание" HeaderText="Описание" SortExpression="Описание" />
                <asp:BoundField DataField="Цена билета" HeaderText="Цена билета" SortExpression="Цена билета" DataFormatString="{0:C}" />
                <asp:BoundField DataField="Экскурсовод" HeaderText="Экскурсовод" SortExpression="Экскурсовод" ReadOnly="True" />
                <asp:BoundField DataField="Дaта проведения" HeaderText="Дaта проведения" SortExpression="Дaта проведения" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Время" HeaderText="Время" SortExpression="Время" DataFormatString="{0:t}" />
                <asp:BoundField DataField="ID_event_type" HeaderText="ID_event_type" SortExpression="ID_event_type" Visible="False" />
                <asp:BoundField DataField="ID_passage" HeaderText="ID_passage" SortExpression="ID_passage" ReadOnly="True" Visible="False" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString2 %>" SelectCommand="SELECT * FROM [Posters] WHERE ([ID_passage] = @ID_passage)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="ID_passage" SessionField="IDG" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
