<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Authorization.aspx.cs" Inherits="WebApplication1.Authorization" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server"><title>Authorization</title></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:100%; height: 100%">
        <div class="box">
            <h1 class="submain_title">Авторизация</h1>
            <div class="image">
                <img src="Styles/auth.png" height="225" class="pic"/>
            </div>
            <div class="container">
                <label class="text"><b>Имя пользователя</b></label><br />
                <asp:TextBox ID="TextBox1" runat="server" CssClass="text textbox" MaxLength="55"></asp:TextBox> <br />
                <label class="text"><b>Пароль</b></label><asp:Label ID="Label1" runat="server" Text="" CssClass="errorText"></asp:Label><br />
                <asp:TextBox ID="TextBox2" runat="server" CssClass="text textbox" MaxLength="55"></asp:TextBox> <br />
                <asp:Button ID="Button1" runat="server" Text="Войти" CssClass="authButton" OnClick="Button1_Click"/>
            </div>
            
        </div>
    </div>
</asp:Content>
