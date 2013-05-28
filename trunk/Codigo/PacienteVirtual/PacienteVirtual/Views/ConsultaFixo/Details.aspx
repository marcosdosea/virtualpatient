<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.Data.tb_consulta_fixo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>tb_consulta_fixo</legend>

    <div class="display-label">IdPaciente</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.IdPaciente) %>
    </div>

    <div class="display-label">EhGabarito</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.EhGabarito) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.IdConsutaFixo }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
