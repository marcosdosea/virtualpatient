<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.HistoriaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>tb_historia</legend>

    <div class="display-label">HistoriaMedicaPregressa</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.HistoriaMedicaPregressa) %>
    </div>

    <div class="display-label">HistoriaFamiliar</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.HistoriaFamiliar) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.IdConsultaFixo }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
