<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AboutUsPage.aspx.cs" Inherits="WebApplication1.AboutUsPage" %>
<asp:Content ContentPlaceHolderID="Title" runat="server">
    <title>About us</title>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="title">
        <h1 class="main_title">Контакты</h1>
    </div>
    <div>
        <p>
            Все картинки, которые размещены на данном сайте, были созданы при помощи сервиса <a href="https://shedevrum.ai/">Шедеврум</a> и <a href="https://fusionbrain.ai/">Fusion brain</a>
        </p>
    </div>
    <div class="row">
        <section class="col-md-4">
            <h2 class="main_title">График работы</h2>
            <p>
                Ежедневно: с 10:00 до 21:00; <br/>
                Касса работает до 20:00
            </p>
        </section>
        <section class="col-md-4">
            <h2 class="main_title">Расположение</h2>
            <p>
                190000, Санкт-Петербург <br/>
                ул. Большая Морская, д. 67, лит. А
            </p>
        </section>
        <section class="col-md-4">
            <h2 class="main_title">Мы в соцсетях</h2>
            <ul class="footer_list">
                <li><a href="https://vk.com/guap_ru">Vk</a></li>
                <li><a href="https://ok.ru/guapru">Ok</a></li>
                <li><a href="https://rutube.ru/u/guap/">RuTube</a></li>
                <li><a href="https://t.me/new_guap">Tg</a></li>
            </ul>
        </section>
    </div>
</asp:Content>
