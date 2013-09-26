<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.Cadastro.SuspeitaPrmModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.suspeita_prm %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%: Resources.Mensagem.suspeita_prm %></h2>
    <p>
        <%: Html.ActionLink(Resources.Mensagem.criar, "Create") %>
    </p>
    <div class="box-content"> <table class="table table-bordered table-striped">
        <tr>
            <th>
                <%: Resources.Mensagem.descricao %>
            </th>
            <th style="width: 290px;">
                <%: Resources.Mensagem.opcoes %>
            </th>
        </tr>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: Html.DisplayFor(modelItem => item.Descricao) %>
            </td>
            <td>
                <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id=item.IdSuspeitaPrm }) %>
                |
                <%: Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { id = item.IdSuspeitaPrm })%>
                |
                <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", new { id = item.IdSuspeitaPrm })%>
            </td>
        </tr>
        <% } %>
    </table></div>
</asp:Content>
