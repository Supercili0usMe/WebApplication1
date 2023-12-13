<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FreeTicketWorks.aspx.cs" Inherits="WebApplication1.FreeTicketWorks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
    <title>Free Tickets</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="display: flex;justify-content: center;">
         <section class="col-md-6">
             <h3 class="submain_title">Таблица мероприятий</h3>
                 <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource10" AllowSorting="True" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ID_passage" Width="100%" CssClass="table_text" ForeColor="#E5E1DD" GridLines="None" HorizontalAlign="Center" BackColor="#395464" BorderColor="#462E2F" BorderStyle="Solid" BorderWidth="5px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                 <AlternatingRowStyle BackColor="#234153" />
                 <SelectedRowStyle BackColor="#101D25" />
                 <Columns>
                     <asp:CommandField ShowSelectButton="True" />
                     <asp:BoundField DataField="ID_passage" HeaderText="ID_passage" ReadOnly="True" SortExpression="ID_passage" />
                     <asp:BoundField DataField="Название" HeaderText="Название" SortExpression="Название"></asp:BoundField>
                     <asp:BoundField DataField="Экскурсовод" HeaderText="Экскурсовод" SortExpression="Экскурсовод" ReadOnly="True"></asp:BoundField>
                     <asp:BoundField DataField="Дaта проведения" HeaderText="Дaта проведения" SortExpression="Дaта проведения" DataFormatString="{0:d}" />
                     <asp:BoundField DataField="Время" HeaderText="Время" SortExpression="Время" DataFormatString="{0:t}" />
                     <asp:BoundField DataField="ID_event_type" HeaderText="ID_event_type" SortExpression="ID_event_type" Visible="False" />
                     <asp:BoundField DataField="Тип" HeaderText="Тип" SortExpression="Тип" Visible="False"></asp:BoundField>
                     <asp:BoundField DataField="Описание" HeaderText="Описание" SortExpression="Описание" Visible="False"></asp:BoundField>
                     <asp:BoundField DataField="Цена билета" HeaderText="Цена билета" SortExpression="Цена билета" Visible="False"></asp:BoundField>
                 </Columns>
             </asp:GridView>
             <asp:SqlDataSource runat="server" ID="SqlDataSource10" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString2 %>" SelectCommand="SELECT * FROM [Posters]"></asp:SqlDataSource>
         </section>
    </div>

    <h4 class="main_title">Создать новое мероприятие:</h4>
    <div class="row">
        <section class="col-md-2">
            <p>Выберите название мероприятия: </p> 
            <asp:RadioButtonList ID="RadioButtonList2" runat="server" BackColor="#462E2F" Font-Names="Arial" ForeColor="#FEFAF6" AutoPostBack="True" DataSourceID="SqlDataSource11" DataTextField="Event_name" DataValueField="ID_event" Font-Size="Small" OnSelectedIndexChanged="RadioButtonList2_SelectedIndexChanged"></asp:RadioButtonList>
            <asp:SqlDataSource runat="server" ID="SqlDataSource11" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString2 %>" SelectCommand="SELECT * FROM [Poster]"></asp:SqlDataSource>
        </section>

        <section class="col-md-2">
            <p>Выберите экскурсовода:</p>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" BackColor="#462E2F" Font-Names="Arial" ForeColor="#FEFAF6" AutoPostBack="True" DataSourceID="SqlDataSource12" DataTextField="Экскурсовод" DataValueField="ID_guide" Font-Size="Small" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged"></asp:RadioButtonList>
            <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString2 %>" SelectCommand="SELECT * FROM [Guide]"></asp:SqlDataSource>
        </section>

        <section class="col-md-3">
            <p>Выберите дату:</p>
            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" Font-Names="Arial" Font-Size="9pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" Width="400px" BorderColor="white" DayNameFormat="Shortest" TitleFormat="Month" OnSelectionChanged="Calendar1_SelectionChanged">
                <DayHeaderStyle Font-Bold="True" Font-Size="7pt" BackColor="#CCCCCC" ForeColor="#333333" Height="12pt" />
                <DayStyle Width="10%" />
                <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                <TitleStyle BackColor="#462E2F" Font-Bold="True" Font-Size="10pt" ForeColor="White" Height="14pt" />
                <TodayDayStyle BackColor="#CCCC99" />
            </asp:Calendar>
        </section>

        <section class="col-md-2">
            <p>Выберите время:</p>
            <asp:DropDownList ID="DropDownList1" runat="server" BackColor="#462E2F" Font-Names="Arial" ForeColor="#FEFAF6" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
        </section>

        <section class="col-md-2">
            <p>Подтвердите создание</p>
            <asp:Button ID="Button1" runat="server" Text="Подтвердить" CssClass="verifyButton" OnClick="Button1_Click" />
        </section>
    </div>

    <h4 class="main_title">Создать билеты на мероприятие:</h4>
    <div class="row">
        <section class="col-md-2">
            <p>Выбранное мероприятие:</p>
            <asp:BulletedList ID="BulletedList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Название" DataValueField="ID_passage" CssClass="text"></asp:BulletedList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString2 %>" SelectCommand="SELECT * FROM [Posters] WHERE ([ID_passage] = @ID_passage)">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="ID_passage" SessionField="ID_passage" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </section>

        <section class="col-md-3">
            <p>Количество свободных билетов на данное мероприятие:</p>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CssClass="table_text" ForeColor="#E5E1DD" GridLines="None" HorizontalAlign="Center" BackColor="#395464" BorderColor="#462E2F" BorderStyle="Solid" BorderWidth="2px">
                <Columns>
                    <asp:BoundField DataField="Количество" HeaderText="Количество" ReadOnly="True" SortExpression="Количество" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MuseumDBConnectionString2 %>" SelectCommand="Check_free_tickets_admin" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="id_passage" SessionField="ID_passage" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </section>

        <section class="col-md-2">
            <p>Добавить свободных билетов:</p>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="text textbox2" MaxLength="3" Width="30%"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="errorText2" Width="90%" ErrorMessage="В строке должны быть только цифры" ControlToValidate="TextBox1" EnableClientScript="False" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
            <asp:Button ID="Button2" runat="server" Text="Добавить" CssClass="verifyButton" OnClick="Button2_Click" />
        </section>

        <section class="col-md-2">
            <p>Удалить свободные билеты:</p>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="text textbox2" MaxLength="3" Width="30%"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" CssClass="errorText2" Width="90%" ErrorMessage="В строке должны быть только цифры" ControlToValidate="TextBox2" EnableClientScript="False" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
            <asp:Button ID="Button3" runat="server" Text="Удалить" CssClass="verifyButton" OnClick="Button3_Click1"  />
        </section>

        <section class="col-md-3">
            <a class="text" href="AdminPage.aspx">Вернуться на панель администрирования</a>
        </section>
    </div>
    
</asp:Content>




