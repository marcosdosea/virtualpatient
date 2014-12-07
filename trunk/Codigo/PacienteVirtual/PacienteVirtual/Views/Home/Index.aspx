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
            Para aprender mais sobre a utilização software leia:
            <br />
            <a href="#" target="_blank" title="Manual do Paciente Virtual">
                Manual do Paciente Virtual para o Administrador</a>
                <br />
            <a href="../../Content/themes/Manuais/Manual Paciente Virtual para Aluno.html" target="_blank" title="Manual do Paciente Virtual">
                Manual do Paciente Virtual para o Aluno</a>
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
