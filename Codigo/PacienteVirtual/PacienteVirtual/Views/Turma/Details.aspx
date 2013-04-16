<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.TurmaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>TurmaE</legend>

    <div class="display-label">Codigo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Codigo) %>
    </div>

    <div class="display-label">Periodo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Periodo) %>
    </div>

    <div class="display-label">Nome da Disciplina</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomeDisciplina) %>
    </div>

    <div class="display-label">tb_instituicao</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomeInstituicao) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.IdTurma }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
