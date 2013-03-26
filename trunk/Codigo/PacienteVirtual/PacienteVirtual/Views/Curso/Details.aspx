<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.Data.CursoE>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>CursoE</legend>

    <div class="display-label">NomeCurso</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomeCurso) %>
    </div>

    <div class="display-label">tb_instituicao</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.tb_instituicao.NomeInstituicao) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.IdCurso }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
