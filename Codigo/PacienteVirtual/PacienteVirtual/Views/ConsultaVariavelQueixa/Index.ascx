<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.ConsultaVariavelQueixaModel>>" %>

<style type="text/css"> 
            .botaoMostrar
            {
                color:#2E8AE6;
                cursor:pointer;
            }
            </style>
            <h3>
    <%: Resources.Mensagem.revisao_sistemas %></h3>
<div class="box-content">
    <table class="table table-bordered table-striped">
        <tr>
            <th>
                <%: Resources.Mensagem.alternativas_intervencao %>
            </th>
            <th>
                <%: Resources.Mensagem.desde %>
            </th>
            <th>
                <%: Resources.Mensagem.tipo %>
            </th>
            <th>
                <%: Resources.Mensagem.objetivo_terapeutico %>
            </th>
            <th>
                <%: Resources.Mensagem.prioridade %>
            </th>
            <th>
                <%: Resources.Mensagem.descricao_situacao %>
            </th>
            <th>
                <%: Resources.Mensagem.opcoes %>
            </th>
        </tr>
        <% if (Model != null)
               foreach (var item in Model)
               { %>
        <tr>
            <td>
                <%: Html.DisplayFor(modelItem => item.DescricaoQueixa) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Desde) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Tipo) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.DescricaoObjetivoTerapeutico) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Prioridade) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.DescricaoSituacao) %>
            </td>
            <td>
                <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", "ConsultaVariavelQueixa", new { idConsultaVariavel = item.IdConsultaVariavel, idQueixa = item.IdQueixa }, null) %>
                |
                <div class="botaoMostrar"><%: Resources.Mensagem.novo_prm %></div>
                |
                <%: Html.ActionLink(Resources.Mensagem.intervencao, "Edit", "ConsultaVariavelQueixa", new { idConsultaVariavel = item.IdConsultaVariavel, idQueixa = item.IdQueixa }, null) %>
            </td>
        </tr>
        <% } %>
    </table>
</div>
