<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.Data.turma>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>turma</legend>

    <div class="display-label">codigo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.codigo) %>
    </div>

    <div class="display-label">periodo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.periodo) %>
    </div>

    <div class="display-label">tutor</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.tutor.nome) %>
    </div>

    <div class="display-label">nmDisciplina</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.nmDisciplina) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.id }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
