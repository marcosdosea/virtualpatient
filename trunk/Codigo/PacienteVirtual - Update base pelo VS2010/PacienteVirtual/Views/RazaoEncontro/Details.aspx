<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.RazaoEncontroModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>tb_razao_encontro</legend>

    <div class="display-label">DescricaoRazao</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DescricaoRazao) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.IdRazaoEncontro }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
