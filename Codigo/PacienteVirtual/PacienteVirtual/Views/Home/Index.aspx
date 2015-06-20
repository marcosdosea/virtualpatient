<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Paciente Virtual
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%: ViewBag.Message %></h2>
    <br />
    <h5>
        O paciente virtual é um ambiente virtual de aprendizagem que permite que alunos
        dos cursos das ciências da saúde exercitem suas habilidades. Através de relatos
        clínicos disponibilizados pelo tutor da turma o aluno coleta informações e registra
        quais as intervenções seriam mais adequadas.
        <br />
        <br />
        <% if (HttpContext.Current.Request.IsAuthenticated && Session["_DadosTurmaPessoa"] != null)
           { %>
           <% if (Session["_Curso"].Equals("Bacharelado em Enfermagem"))
                                   { %>
                <div class="iconesRapidos">
                    &nbsp&nbsp&nbsp&nbsp
                    <a href="<%: Url.Action("Index", "Consulta")%>">
                        <img alt="logo" src="../../Content/themes/pv/img/Iniciar_Processo_Enfermagem.jpg" width="70px" height="50px" />
                        Iniciar Processo de Enfermagem
                    </a>
                </div>
                <br />
            <% } %>
        <div class="iconesRapidos">
            <a href="<%: Url.Action("Index", "AtivarMatriculasTurma")%>">
                <img alt="logo" src="../../Content/themes/pv/img/Matricula_Turma.JPG" width="70px" height="50px" />
                Matricular Aluno na Turma
            </a>
        </div>
        <% } %>
        <br />
        Para aprender mais sobre a utilização software leia:
        <br />
        <br />
        <%: Html.ActionLink(Resources.Mensagem.manual_paciente_virtual, "Manual", "Home") %>
        <br />
        <br />
        Abaixo também segue a lista de publicações realizadas através do software:
    </h5>
    <script type="text/javascript">
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-57310117-1', 'auto');
        ga('send', 'pageview');

    </script>
</asp:Content>
