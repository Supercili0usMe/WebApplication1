<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="OrderNewTickets.aspx.cs" Inherits="WebApplication1.OrderNewTicketsaspx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    <title>Ordering</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="display: flex;justify-content: center;">
        <h2 class="main_title">Бронирование билетов</h2>
    </div>

    <div class="image">
        <img src="Styles/выступление.png" height="300" class="pic" />
    </div>

    <div style="display: flex;justify-content: center;">
        <a class="text" href="PersonalPage.aspx">Вернуться в личный кабинет</a>
    </div>

    <div class="row">
        <section class="col-md-2" aria-labelledby="chooseEventType">
            <p>Выберите тип мероприятия:</p>
            <asp:DropDownList ID="DropDownList1" runat="server" BackColor="#462E2F" Font-Names="Arial" ForeColor="#FEFAF6" AutoPostBack="True" AppendDataBoundItems="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="Event_type" DataValueField="ID_event_type">
                <asp:ListItem Selected="True">-------Выберите-------</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString2 %>" SelectCommand="SELECT * FROM [Event_type]"></asp:SqlDataSource>
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
        </section>    
        <section class="col-md-8" aria-labelledby="chooseEvent">
            <p>Найденные мероприятия:</p>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString2 %>" SelectCommand="SELECT * FROM [Posters] WHERE ([ID_event_type] = @ID_event_type)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="ID_event_type" SessionField="IDType" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" CssClass="table_text" AllowSorting="True" ForeColor="#E5E1DD" GridLines="None" HorizontalAlign="Center" Width="100%" BackColor="#395464" BorderColor="#462E2F" BorderStyle="Solid" BorderWidth="5px" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID_passage" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#234153" />
            <Columns>
                <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                <asp:BoundField DataField="Тип" HeaderText="Тип" SortExpression="Тип"/>
                <asp:BoundField DataField="Название" HeaderText="Название" SortExpression="Название" />
                <asp:BoundField DataField="Описание" HeaderText="Описание" SortExpression="Описание" />
                <asp:BoundField DataField="Цена билета" HeaderText="Цена билета" SortExpression="Цена билета" DataFormatString="{0:C}" />
                <asp:BoundField DataField="Экскурсовод" HeaderText="Экскурсовод" SortExpression="Экскурсовод" ReadOnly="True" />
                <asp:BoundField DataField="Дaта проведения" HeaderText="Дaта проведения" SortExpression="Дaта проведения" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Время" HeaderText="Время" SortExpression="Время" DataFormatString="{0:t}" />
                <asp:BoundField DataField="ID_event_type" HeaderText="ID_event_type" SortExpression="ID_event_type" Visible="False" />
                <asp:BoundField DataField="ID_passage" HeaderText="ID_passage" ReadOnly="True" SortExpression="ID_passage" Visible="False" />
            </Columns>
            <EditRowStyle CssClass="table_text" />
            <SelectedRowStyle BackColor="#101D25" />
        </asp:GridView>
        </section>
    </div>

    <div class="row">
        <br />
        <section class="col-md-2" aria-labelledby="chooseTicketType">
            <p>Выберите тип билета:</p>
                <asp:DropDownList ID="DropDownList2" runat="server" BackColor="#462E2F" Font-Names="Arial" ForeColor="#FEFAF6" AutoPostBack="True" AppendDataBoundItems="True" DataSourceID="SqlDataSource3" DataTextField="Ticket_type" DataValueField="ID_ticket_type" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                    <asp:ListItem Selected="True">-------Выберите-------</asp:ListItem>
            </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString2 %>" SelectCommand="SELECT * FROM [Ticket_type] WHERE ([ID_ticket_type] &gt; @ID_ticket_type)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="0" Name="ID_ticket_type" Type="Int32" />
                    </SelectParameters>
            </asp:SqlDataSource>
        </section>
        <section class="col-md-2" aria-labelledby="chooseEventType">
            <p>Выберите количество билетов:</p>
            <asp:GridView ID="GridView3" runat="server" CssClass="table_text" ForeColor="#E5E1DD" GridLines="None" HorizontalAlign="Center" BackColor="#395464" BorderColor="#462E2F" BorderStyle="Solid" BorderWidth="2px" AutoGenerateColumns="False" DataSourceID="SqlDataSource4">
                <Columns>
                    <asp:BoundField DataField="Количество" HeaderText="Количество" ReadOnly="True" SortExpression="Количество" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString2 %>" SelectCommand="Check_free_tickets_admin" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="id_passage" SessionField="Event" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </section>

        <section class="col-md-2">
            <asp:TextBox ID="TextBox1" runat="server" CssClass="text textbox2" MaxLength="2" Width="30%"></asp:TextBox>
            <asp:Button ID="Button2" runat="server" Text="Добавить" CssClass="verifyButton" OnClick="Button2_Click" /> <br />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="errorText2" Width="80%" ErrorMessage="В строке должны быть только цифры" ControlToValidate="TextBox1" EnableClientScript="False" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
            <asp:Label ID="Label3" runat="server" Text="" CssClass="errorText2"></asp:Label>
        </section>
    </div>

    <div style="padding-left: 10px;">
        <br />
        <p>Подтвердите бронирование билета:</p>
        <asp:GridView ID="GridView2" runat="server" CssClass="table_text" AllowSorting="True" ForeColor="#E5E1DD" GridLines="None" HorizontalAlign="Center" Width="1400px" BackColor="#395464" BorderColor="#462E2F" BorderStyle="Solid" BorderWidth="5px" AllowPaging="True" DataSourceID="SqlDataSource5" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="ID_ticket_type" HeaderText="ID_ticket_type"  SortExpression="ID_ticket_type" Visible="False"></asp:BoundField>
                <asp:BoundField DataField="ID_event_type" HeaderText="ID_event_type"  SortExpression="ID_event_type" Visible="False"></asp:BoundField>
                <asp:BoundField DataField="ID_passage" HeaderText="ID_passage"  SortExpression="ID_passage" Visible="False" ></asp:BoundField>
                <asp:BoundField DataField="Тип" HeaderText="Тип" SortExpression="Тип"></asp:BoundField>
                <asp:BoundField DataField="Название" HeaderText="Название" SortExpression="Название"></asp:BoundField>
                <asp:BoundField DataField="Описание" HeaderText="Описание" SortExpression="Описание"></asp:BoundField>
                <asp:BoundField DataField="Дата" HeaderText="Дата" SortExpression="Дата" ></asp:BoundField>
                <asp:BoundField DataField="Время" HeaderText="Время" SortExpression="Время"></asp:BoundField>
                <asp:BoundField DataField="Цена билета" HeaderText="Цена билета" SortExpression="Цена билета" ></asp:BoundField>
                <asp:BoundField DataField="Тип билета" HeaderText="Тип билета" SortExpression="Тип билета"></asp:BoundField>
                <asp:BoundField DataField="Итоговая цена одного билета" HeaderText="Итоговая цена одного билета" ReadOnly="True" SortExpression="Итоговая цена одного билета" ></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString2 %>" SelectCommand="SELECT * FROM [Verifying2] WHERE (([ID_event_type] = @ID_event_type) AND ([ID_passage] = @ID_passage) AND ([ID_ticket_type] = @ID_ticket_type))">
            <SelectParameters>
                <asp:SessionParameter SessionField="IDType" DefaultValue="0" Name="ID_event_type" Type="Int32"></asp:SessionParameter>
                <asp:SessionParameter SessionField="Event" DefaultValue="0" Name="ID_passage" Type="Int32"></asp:SessionParameter>
                <asp:SessionParameter SessionField="Ticket_Type" DefaultValue="0" Name="ID_ticket_type" Type="Int32"></asp:SessionParameter>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Button ID="Button1" runat="server" Text="Подтвердить" CssClass="verifyButton" OnClick="Button1_Click"/>
        <asp:Label ID="Label1" runat="server" Text="" CssClass="errorText"></asp:Label>
    </div>
    
    

</asp:Content>
