<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<PacienteVirtual.Models.ConsultaVariavelQueixaModel>>" %>
<style type="text/css">
    .botaoMostrar
    {
        color: #2E8AE6;
        cursor: pointer;
    }
</style>
<h3>
    <%: Resources.Mensagem.revisao_sistemas %></h3>
<% if (Session["_PrimeiraTelaConsulta"].Equals(false))
   { %>
<div class="styleValidation">
     <%: Html.Raw(Session["_ErroConsultaVariavelQueixa2"].ToString())%>
</div>
<% } %>

<div id="minhaBarra">
<div class="box-content">
    <table class="table table-bordered table-striped">
        <tr>
            <th>
                <%: Resources.Mensagem.problema_saude %>
            </th>
            <% if (Session["_PrimeiraTelaConsulta"].Equals(false)) { %>
            <th>
                <%: Resources.Mensagem.objetivo_terapeutico %>
            </th>
            <th>
                <%: Resources.Mensagem.descricao_situacao %>
            </th>
            <th>
                <%: Resources.Mensagem.desde %>
            </th>
            <th>
                <%: Resources.Mensagem.tipo %>
            </th>
            <th>
                <%: Resources.Mensagem.prioridade %>
            </th>
            <% } %>
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
            <% if (Session["_PrimeiraTelaConsulta"].Equals(false))
               { %>
            <td>
                <%: Html.DisplayFor(modelItem => item.DescricaoObjetivoTerapeutico)%>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.DescricaoSituacao)%>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Desde)%>
            </td>
            <td>
                <% if (item.Tipo == "S") { %>
                   <%: Html.Label("PRM") %>    
                <% }else{ %>
                   <%: Html.Label(Resources.Mensagem.doenca_agrave) %>
                <% } %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Prioridade)%>
            </td>
            <% } %>
            <td>
                <% if (!(Session["_Roles"].Equals("usuario") && (Session["_IdEstadoConsulta"].Equals(3) || Session["_IdEstadoConsulta"].Equals(4) || Session["_IdEstadoConsulta"].Equals(5) || Session["_IdEstadoConsulta"].Equals(7))))
                   { %>
                <% if (ViewBag.EscondeLinks == true)
                   { %>
                <%: Html.ActionLink(Resources.Mensagem.avaliacao_farmaceutica, "Edit", "ConsultaVariavelQueixa", new { idConsultaVariavel = item.IdConsultaVariavel, idQueixa = item.IdQueixa }, null)%>
                |
                <div class="botaoMostrar">
                    <%: Resources.Mensagem.identificacao_prm%></div>
                    |
                <% } %>
                <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", "ConsultaVariavelQueixa", new { idConsultaVariavel = item.IdConsultaVariavel, idQueixa = item.IdQueixa }, null)%>
                <% } %>
            </td>
        </tr>
        <% } %>
    </table>
</div>
</div>