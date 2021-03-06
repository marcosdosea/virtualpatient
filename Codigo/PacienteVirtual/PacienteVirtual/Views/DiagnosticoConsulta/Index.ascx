﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.DiagnosticoConsultaModel>>" %>
<div id="minhaBarra">
    <div class="box-content">
        <table class="table table-bordered">
            <tr>
                <th>
                    <%: Resources.Mensagem.dominio %>
                </th>
                <th>
                    <%: Resources.Mensagem.classe %>
                </th>
                <th>
                    <%: Resources.Mensagem.diagnostico %>
                </th>
                <th>
                    <%: Resources.Mensagem.opcoes %>
                </th>
            </tr>
            <% foreach (var item in Model)
               { %>
            <% if (item.IdDiagnostico.Equals(Session["_IdDiagnosticoConsulta"]) &&
                   item.IdDominioDiagnostico.Equals(Session["_IdDominioDiagnosticoConsulta"]) &&
                   item.IdClasseDiagnostico.Equals(Session["_IdClasseDiagnosticoConsulta"]))
               { %>
            <tr class="linhaSelecionada">
                <td>
                    <%: Html.DisplayFor(modelItem => item.DescricaoDominioDiagnostico)%>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.DescricaoClasseDiagnostico)%>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.DescricaoDiagnostico)%>
                </td>
                <td>
                    <%: Html.ActionLink(Resources.Mensagem.selecione, "SelecionarConsultaDiagnostico", "DiagnosticoConsulta",
                        new { idConsultaVariavel = item.IdConsultaVariavel, idDiagnostico = item.IdDiagnostico, idDominio = 
                        item.IdDominioDiagnostico, idClasse = item.IdClasseDiagnostico }, null)%>
                    <% if (!(Session["_Roles"].Equals("tutor")))
                       {
                           if (!(Session["_Roles"].Equals("usuario") && (Session["_IdEstadoConsulta"].Equals(3) || Session["_IdEstadoConsulta"].Equals(4)
                       || Session["_IdEstadoConsulta"].Equals(5) || Session["_IdEstadoConsulta"].Equals(7))))
                           { %>
                    |
                    <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", "DiagnosticoConsulta", new
                    {idConsultaVariavel = item.IdConsultaVariavel, idDiagnostico = item.IdDiagnostico}, new { onclick =("return confirm('Deseja realmente REMOVER este Medicamento?')")})%>
                    <% } %>
                    <% } %>
                </td>
            </tr>
            <% }
               else
               { %>
            <tr>
                <td>
                    <%: Html.DisplayFor(modelItem => item.DescricaoDominioDiagnostico)%>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.DescricaoClasseDiagnostico)%>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.DescricaoDiagnostico)%>
                </td>
                <td>
                    <%: Html.ActionLink(Resources.Mensagem.selecione, "SelecionarConsultaDiagnostico", "DiagnosticoConsulta",
                        new { idConsultaVariavel = item.IdConsultaVariavel, idDiagnostico = item.IdDiagnostico, idDominio = 
                        item.IdDominioDiagnostico, idClasse = item.IdClasseDiagnostico }, null)%>
                    <% if (!(Session["_Roles"].Equals("tutor")))
                       {
                           if (!(Session["_Roles"].Equals("usuario") && (Session["_IdEstadoConsulta"].Equals(3) || Session["_IdEstadoConsulta"].Equals(4)
                       || Session["_IdEstadoConsulta"].Equals(5) || Session["_IdEstadoConsulta"].Equals(7))))
                           { %>
                    |
                    <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", "DiagnosticoConsulta", new { idConsultaVariavel =
                        item.IdConsultaVariavel, idDiagnostico = item.IdDiagnostico }, new { onclick = 
                        ("return confirm('Deseja realmente REMOVER este Medicamento?')") })%>
                        <% } %>
                    <% } %>
                </td>
            </tr>
            <% } %>
            <% } %>
        </table>
    </div>
</div>
<style type="text/css">
    .linhaSelecionada
    {
        background-color: #FFFF00;
        font-weight: bold;
    }
</style>
