<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.MedicamentoNaoPrescritoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>MedicamentoNaoPrescritoE</legend>

    <div class="display-label">Fitoterapico</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Fitoterapico) %>
    </div>

    <div class="display-label">Dosagem</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Dosagem) %>
    </div>

    <div class="display-label">Posologia</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Posologia) %>
    </div>
</fieldset>
<p>
    <%: Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
