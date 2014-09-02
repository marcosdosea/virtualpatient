﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.PrescricaoEnfermagemModel>>" %>
<div id="minhaBarra">
    <div class="box-content">
        <table class="table table-bordered">
            <tr>
                <th>
                    <%: Resources.Mensagem.prescricao_enfermagem %>
                </th>
                <th>
                    <%: Resources.Mensagem.horarios %>
                </th>
                <th>
                </th>
                <th>
                    <%: Resources.Mensagem.opcoes %>
                </th>
            </tr>
            <% foreach (var item in Model)
               { %>
            <% if (item.Realizada.Equals(true))
               { %>
            <tr class="linhaRealizada">
                <td>
                    <%: Html.DisplayFor(modelItem => item.DescricaoPrescricao)%>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.Horario)%>
                </td>
                <td>
                    <%: Html.ActionLink(Resources.Mensagem.realizado, "MarcarComoNaoRealizado", "PrescricaoEnfermagem",
                                new { idPrescricaoEnfermagem = item.IdPrescricaoEnfermagem }, null)%>
                </td>
                <td>
                    <% if (!(Session["_Roles"].Equals("usuario") && (Session["_IdEstadoConsulta"].Equals(3) ||
                           Session["_IdEstadoConsulta"].Equals(4) || Session["_IdEstadoConsulta"].Equals(5) ||
                           Session["_IdEstadoConsulta"].Equals(7))))
                       { %>
                    <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", "PrescricaoEnfermagem", new { idPrescricaoEnfermagem =
                        item.IdPrescricaoEnfermagem }, null)%>
                    <% } %>
                </td>
            </tr>
            <% }
               else
               { %>
               <tr class="linhaNaoRealizada">
                <td>
                    <%: Html.DisplayFor(modelItem => item.DescricaoPrescricao)%>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.Horario)%>
                </td>
                <td>
                    <%: Html.ActionLink(Resources.Mensagem.nao_realizado, "MarcarComoRealizado", "PrescricaoEnfermagem",
                                new { idPrescricaoEnfermagem = item.IdPrescricaoEnfermagem }, null)%>
                </td>
                <td>
                    <% if (!(Session["_Roles"].Equals("usuario") && (Session["_IdEstadoConsulta"].Equals(3) ||
                           Session["_IdEstadoConsulta"].Equals(4) || Session["_IdEstadoConsulta"].Equals(5) ||
                           Session["_IdEstadoConsulta"].Equals(7))))
                       { %>
                    <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", "PrescricaoEnfermagem", new { idPrescricaoEnfermagem =
                        item.IdPrescricaoEnfermagem }, null)%>
                    <% } %>
                </td>
            </tr>
            <% } %>
            <% } %>
        </table>
    </div>
</div>


<style type="text/css">
    .linhaRealizada
    {
        background-color: #00FF00;
    }
    
    .linhaNaoRealizada
    {
        background-color: #FF00FF;
    } 
</style>