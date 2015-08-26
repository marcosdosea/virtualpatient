<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Paciente Virtual
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%: ViewBag.Message %></h2>
    <br />
    <h5>
        O paciente virtual é um ambiente de aprendizagem que permite estudantes 
        dos cursos de ciências da saúde colocar em prática seus conhecimentos. Através
        de casos clínicos providos pelo tutor da turma, os estudantes podem coletar informações 
        sobre o paciente e registrar as intervenções que considerarem mais apropriada. Essas intervenções
        são corrigidas pelo tutor da turma que pode enviar novas orientações ou atestar que a intervenção 
        realizada pelo aluno foi adequada. Em seguida o tutor poderá atribuir para o aluno um caso clínico 
        de um novo paciente ou ainda uma evolução do caso clínico de um paciente já atendido pelo aluno.
        <!--
        The virtual patient is a learning environment that allows students 
        of health sciences courses exercise their skills. Through clinical 
        reports provided by the class tutor, the student collects information 
        and records which interventions would be most appropriate.
        -->
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
        Leia os tutorias abaixo para aprender sobre as funcionalidades disponíveis no software:
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
