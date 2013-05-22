<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.ExperienciaMedicamentosModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.experiencia_medicamentos%>
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.experiencia_medicamentos%></h2>

<p>
    <%: Html.ActionLink(Resources.Mensagem.criar, "Create")%>
</p>
<table>
    <tr>
        <th>
            tb_resposta
        </th>
        <th>
            tb_resposta1
        </th>
        <th>
            tb_resposta2
        </th>
        <th>
            tb_resposta3
        </th>
        <th>
            tb_resposta4
        </th>
        <th>
            tb_resposta5
        </th>
        <th>
        <%: Resources.Mensagem.espera_tratamento_atencao%>
            <!-- AtencaoEsperaTratamento-->
        </th>
        <th>
        <%: Resources.Mensagem.preocupacoes_atencao%>
            <!-- AtencaoPreocupacoes-->
        </th>
        <th>
          <%: Resources.Mensagem.grau_entendimento_atencao%>
           <!--  AtencaoGrauEntendimento-->
        </th>
        <th>
          <%: Resources.Mensagem.cultural_atencao %>
            <!-- AtencaoCultural -->
        </th>
        <th>
         <%: Resources.Mensagem.comportamento_atencao%>
            <!-- AtencaoComportamento-->
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.IdRespostaEsperaTratamento)%>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.IdRespostaPreocupacoes)%>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.IdRespostaGrauEntendimento)%>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.IdRespostaCultural)%>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.IdRespostaComportamento)%>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.IdRespostaIncorporadoPlano)%>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.AtencaoEsperaTratamento) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.AtencaoPreocupacoes) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.AtencaoGrauEntendimento) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.AtencaoCultural) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.AtencaoComportamento) %>
        </td>
        <td>
            <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id=item.IdConsultaFixo }) %> |
            <%: Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { id=item.IdConsultaFixo }) %> |
            <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", new { id=item.IdConsultaFixo }) %>
        </td>
    </tr>
<% } %>

</table>

</asp:Content>
