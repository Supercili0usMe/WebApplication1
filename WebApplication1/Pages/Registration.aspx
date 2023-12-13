<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="WebApplication1.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server"><title>Registration</title></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:100%; height: 100%">
        <div class="box">
            <h1 class="submain_title">Регистрация</h1>
            <div class="image">
                <img src="Styles/registration.png" height="225" class="pic" />
            </div>
            <div class="container">
                <asp:Label ID="Label1" runat="server" CssClass="errorText" Text=""></asp:Label><br />
                <label class="text"><b>Электронная почта</b></label>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="errorText" ErrorMessage="Введите адрес почты" EnableClientScript="False" ControlToValidate="TextBox1" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator><br />
                <asp:TextBox ID="TextBox1" runat="server" CssClass="text textbox" ControlToValidate="TextBox1" MaxLength="55"></asp:TextBox> <br />
                <label class="text"><b>Пароль</b></label><asp:CompareValidator runat="server" ErrorMessage="Введённые пароли не совпадают" CssClass="errorText" ControlToValidate="TextBox2" EnableClientScript="False" ControlToCompare="TextBox3"></asp:CompareValidator><br />
                <asp:TextBox ID="TextBox2" runat="server" CssClass="text textbox" MaxLength="55"></asp:TextBox> <br />
                <label class="text"><b>Повторите пароль</b></label><br />
                <asp:TextBox ID="TextBox3" runat="server" CssClass="text textbox" MaxLength="55"></asp:TextBox> <br />
                <asp:Button ID="Button1" runat="server" Text="Войти" CssClass="authButton" OnClick="Button1_Click"/>
            </div>
        </div>
    </div>
</asp:Content>
