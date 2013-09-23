<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<PacienteVirtual.Models.Turma.TurmaPessoaModel>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.ativar_tutor_turma %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
    <div class="span9">
        <h2> <%: Resources.Mensagem.ativar_tutor_turma %>
            </h2>
        <% using (Html.BeginForm("Index", "AtivarTutorTurma", FormMethod.Post, null))
           { %>
        <%: Html.DropDownList("IdTurma", null, Resources.Mensagem.listar_todos, new { onchange = "this.form.submit();" })%>
        <% } %>
    </div>
    <div class="box-content">
        <table class="table table-bordered table-striped">
            <tr>
                <th style="width: 519px">
                    <%: Resources.Mensagem.nome_pessoa %>
                </th>
                <th class="input-medium" style="width: 158px">
                    <%: Resources.Mensagem.status %>
                </th>
                <th>
                    <%: Resources.Mensagem.opcoes %>
                </th>
            </tr>
            <% if (Model != null)
                   foreach (var item in Model)
                   { %>
            <tr>
                <td style="width: 519px">
                    <%: Html.DisplayFor(modelItem => item.NomePessoa) %>
                </td>
                <td class="input-medium" style="width: 158px; text-align: center">
                    <%
                       if (item.IdRole != 2)
                       {%>
                    <p style="color: Blue">
                        <%: Resources.Mensagem.ativa %></p>
                    <% }
                       else
                       {
                    %>
                    <p style="color: Red">
                        <%: Resources.Mensagem.desativa %></p>
                    <% } %>
                </td>
                <td>
                    <%: Html.ActionLink(Resources.Mensagem.ativar, "Ativar", new { idTurma = item.IdTurma,  idPessoa = item.IdPessoa}, new { onclick = "alert('Tutor Ativado!')" })%>
                    |
                    <%: Html.ActionLink(Resources.Mensagem.desativar, "Desativar", new { idTurma = item.IdTurma, idPessoa = item.IdPessoa }, new { onclick = "alert('Tutor Desativado!')" })%>
                </td>
            </tr>
            <% } %>
        </table>
    </div>
    </form>
</asp:Content>
