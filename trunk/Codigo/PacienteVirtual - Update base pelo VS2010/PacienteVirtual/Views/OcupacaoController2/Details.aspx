<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.Data.OcupacaoE>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>OcupacaoE</legend>

    <div class="display-label">Descricao</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Descricao) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.IdOcupacao }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
