<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.Cadastro.GrupoIntervencaoModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.grupo_intervencao %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%: Resources.Mensagem.grupo_intervencao %></h2>
    <p>
        <%: Html.ActionLink(Resources.Mensagem.criar, "Create") %>
    </p>
    <div class="box-content">
        <table class="table table-bordered table-striped">
            <tr>
                <th>
                    <%: Resources.Mensagem.grupo_intervencao %>
                </th>
                <th style="width:270px;">
                    <%: Resources.Mensagem.opcoes %>
                </th>
            </tr>
            <% foreach (var item in Model)
               { %>
            <tr>
                <td>
                    <%: Html.DisplayFor(modelItem => item.DescricaoGrupoIntervencao) %>
                </td>
                <td>
                    <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id=item.IdGrupoIntervencao }) %>
                    |
                    <%: Html.ActionLink(Resources.Mensagem.detalhes, "Details", new { id = item.IdGrupoIntervencao })%>
                    |
                    <%: Html.ActionLink(Resources.Mensagem.remover, "Delete", new { id = item.IdGrupoIntervencao })%>
                </td>
            </tr>
            <% } %>
        </table>
    </div>
</asp:Content>
