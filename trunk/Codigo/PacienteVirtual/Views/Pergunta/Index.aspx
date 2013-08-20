<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.PerguntaModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.pergunta %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2> <%: Resources.Mensagem.pergunta %></h2>

<p>
    <%: Html.ActionLink(Resources.Mensagem.criar, "Create")%>
</p>
<div class="box-content"> <table class="table table-bordered table-striped">
    <tr>
        <th>
             <%: Resources.Mensagem.pergunta %>
        </th>
        <th></th>
    </tr>

<% foreach (var item in Model) { %>
    <tr>
        <td>
            <%: Html.DisplayFor(modelItem => item.Pergunta) %>
        </td>
        <td>
            <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id = item.IdPergunta })%> |
            <%: Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { id = item.IdPergunta })%> |
            <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", new { id=item.IdPergunta }) %>
        </td>
    </tr>
<% } %>

</table></div>

</asp:Content>
