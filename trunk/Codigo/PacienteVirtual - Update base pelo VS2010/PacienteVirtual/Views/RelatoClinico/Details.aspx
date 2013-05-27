<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.RelatoClinicoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>tb_relato_clinico</legend>

    <div class="display-label">tb_paciente</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomePaciente) %>
    </div>

    <div class="display-label">OrdemCronologia</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.OrdemCronologica) %>
    </div>

    <div class="display-label">RelatoTextual</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.RelatoTextual) %>
    </div>

    <div class="display-label">NivelDificuldade</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NivelDificuldade) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.IdRelato }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
