﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.QueixaMedicamentoModel>>" %>
<%@ Import Namespace = "PacienteVirtual.Helpers" %>

<h3>
    <%: Resources.Mensagem.medicamentos_queixa_suspeita_prm %></h3>

<div class="styleValidation">
     <%: Html.Raw(Session["_ErroQueixaMedicamento"].ToString())%>
</div>
<div id="minhaBarra">
<div class="box-content">
    <table class="table table-bordered table-striped">
        <tr>
            <th>
                <%: Resources.Mensagem.alternativas_intervencao %>
            </th>
            <th>
                <%: Resources.Mensagem.nome_medicamento %>
            </th>
            <th>
                <%: Resources.Mensagem.dose %>
            </th>
            <th>
                <%: Resources.Mensagem.desde %>
            </th>
            <th>
                <%: Resources.Mensagem.necessario %>
            </th>
            <th>
                <%: Resources.Mensagem.efetivo %>
            </th>
            <th>
                <%: Resources.Mensagem.seguro %>
            </th>
            <th>
                <%: Resources.Mensagem.cumprimento %>
            </th>
            <th>
                <%: Resources.Mensagem.classificao_prm %>
            </th>
            <th>
                <%: Resources.Mensagem.intervencao_1 %>
            </th>
            <th>
                <%: Resources.Mensagem.intervencao_2 %>
            </th>
            <th>
                <%: Resources.Mensagem.resolvido %>
            </th>
            <th>
                <%: Resources.Mensagem.opcoes %>
            </th>
        </tr>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: Html.DisplayFor(modelItem => item.Queixa) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.NomeMedicamento) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Dose) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Desde) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Necessario) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Efetivo) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Seguro) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Cumprimento) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.SuspeitaPRM) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.DescricaoAcaoQueixa1) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.DescricaoAcaoQueixa2) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Resolvido) %>
            </td>
            <td>
            <% if (!(Session["_Roles"].Equals("usuario") && (Session["_IdEstadoConsulta"].Equals(3) || Session["_IdEstadoConsulta"].Equals(4) || Session["_IdEstadoConsulta"].Equals(5) || Session["_IdEstadoConsulta"].Equals(7))))
               { %>
                <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", "QueixaMedicamento", new { idConsultaVariavel = item.IdConsultaVariavel, 
                                    idMedicamento = item.IdMedicamento, idQueixa = item.IdQueixaMedicamento }, null)%>
                |
                <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", "QueixaMedicamento", new { idConsultaVariavel = item.IdConsultaVariavel, idMedicamento = item.IdMedicamento, idQueixa = item.IdQueixaMedicamento }, new { onclick = ("return confirm('Deseja realmente REMOVER esta Suspeita?')") })%>
            <% } %>
            </td>
        </tr>
        <% } %>
    </table>
</div>
</div>