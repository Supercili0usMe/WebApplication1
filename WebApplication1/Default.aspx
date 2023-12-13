<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.WebForm1" %>
<asp:Content ContentPlaceHolderID="Title" runat="server">
    <title>Main</title>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="article">
        <h1 class="main_title">Хроники веков</h1>
        <p>
            "Xроники веков" — это музей, где каждая экспозиция представляет собой страницу великой книги прошлого.
        </p>
        <div class="add_picture">
            <center><img src="Pages/Styles/museum_logo.jpg" height="225px" class="pic"/></center>
        </div>
        <div class="row">
            <section class="col-md-4" aria-labelledby="gettingStartedTitle">
                <h2 class="submain_title">Добро пожаловать!</h2>
                <p> 
                    Добро пожаловать в музей "Хроники веков" - место, где история оживает на ваших глазах.
                    Откройте двери времени и погрузитель в увлекательное путешествие сквозь века.
                </p>
            </section>
            <section class="col-md-4" aria-labelledby="librariesTitle">
                <h2 class="submain_title">Экспозиции</h2>
                <p>
                    Здесь каждая экспозиция — это страница великой книги прошлого. 
                    Переживите важные моменты истории, ощутите пульс времени, увидьте, как формируется облик эпох, и прочувствуйте влияние прошлого на настоящее. 
                </p>
            </section>
            <section class="col-md-4" aria-labelledby="hostingTitle">
                <h2 class="submain_title">Атмосфера</h2>
                <p>
                    Пройдите вдоль пути истории, переживая важные моменты, ощущая пульс времени. 
                    Здесь вы окунетесь в атмосферу различных эпох, увидите, как формировались облик и характер каждого века, и прочувствуете влияние прошлого на настоящее.
                </p>
            </section>
        </div>
        <div class="row">
            <section class="col-md-2">
                <div class="add_picture">
                    <img src="Pages/Styles/arts.png" height="225px" class="pic"/>
                </div>
            </section>
            <section class="col-md-10" aria-labelledby="aboutOurArts">
                <h2 class="submain_title">Выставки</h2>
                <p>
                    Здесь вы сможете окунуться в прошлое, рассматривая живописные произведения, которые отображают ключевые события и эпохи. 
                    Вас ждет захватывающий путь через времена, начиная с первобытных пещерных рисунков и заканчивая современными произведениями искусства, воплощающими события последних десятилетий. 
                </p>
            </section>
        </div>
    </div>
</asp:Content>
