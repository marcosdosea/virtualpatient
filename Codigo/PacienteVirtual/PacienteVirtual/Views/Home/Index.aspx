<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Paciente Virtual
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%: ViewBag.Message %></h2>
    <br />
    <h5>
        The virtual patient is a learning environment that allows students 
        of health sciences courses exercise their skills. Through clinical 
        reports provided by the class tutor, the student collects information 
        and records which interventions would be most appropriate.
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
                        Start Nursing Process
                    </a>
                </div>
                <br />
            <% } %>
        <div class="iconesRapidos">
            <a href="<%: Url.Action("Index", "AtivarMatriculasTurma")%>">
                <img alt="logo" src="../../Content/themes/pv/img/Matricula_Turma.JPG" width="70px" height="50px" />
                Enroll Student in Class
            </a>
        </div>
        <% } %>
        <br />
        Read the tutorials to learn more about the virtual patient:
        <br />
        <br />
        <%: Html.ActionLink(Resources.Mensagem.manual_paciente_virtual, "Manual", "Home") %>
        <br />
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
