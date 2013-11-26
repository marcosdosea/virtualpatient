﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.CartaModel>>" %>
<div class="box-content">
    <table class="table table-bordered table-striped">
        <tr>
            <th>
                <%: Resources.Mensagem.nome_profissional %>
            </th>
            <th>
                <%: Resources.Mensagem.paciente %>
            </th>
            <th>
                <%: Resources.Mensagem.data_nascimento %>
            </th>
            <th>
                <%: Resources.Mensagem.motivo_referencia_consulta %>
            </th>
            <th>
                <%: Resources.Mensagem.alternativas %>
            </th>
            <th>
                <%: Resources.Mensagem.farmaceutico %>
            </th>
            <th>
                <%: Resources.Mensagem.curso %>
            </th>
            <th>
                <%: Resources.Mensagem.opcoes %>
            </th>
        </tr>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: Html.DisplayFor(modelItem => item.NomeProfissional) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.NomePaciente) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.DataNascimento) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.MotivoReferenciaConsulta) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Alternativas) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Farmaceutico) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.NomeCurso) %>
            </td>
            <td>
                <%: Html.ActionLink(Resources.Mensagem.remover,"Delete", "Carta", new { idConsultaVariavel = item.IdConsultaVariavel, idCarta = item.IdCarta }, null) %>
            </td>
        </tr>
        <% } %>
    </table>
</div>