<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.Turma.TurmaPessoaModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.ativar_matriculas_turma %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="span9">
        <h2>
            <%: Resources.Mensagem.ativar_matriculas_turma %></h2>
        <% using (Html.BeginForm("Index", "AtivarMatriculasTurma", FormMethod.Post, null))
           { %>
        <%: Html.DropDownList("IdTurma", null, Resources.Mensagem.listar_todos, new { onchange = "this.form.submit();" })%>
        <% } %>
    </div>
    <div class="box-content">
        <table class="table table-bordered table-striped">
            <tr>
                <th>
                    <%: Resources.Mensagem.nome_pessoa %>
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
                    <%: Html.DisplayFor(modelItem => item.NomePessoa) %>
                </td>
                <td>
                    <%: Html.ActionLink(Resources.Mensagem.ativar, "Ativar", new { id = item.IdTurma }, new { onclick = "alert('Matrícula Ativada!')" })%>
                    |
                    <%: Html.ActionLink(Resources.Mensagem.desativar, "Desativar", new { id = item.IdTurma }, new { onclick = "alert('Matrícula Desativada!')" })%>
                </td>
            </tr>
            <% } %>
        </table>
    </div>
</asp:Content>
