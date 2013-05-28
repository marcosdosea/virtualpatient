<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.Data.tb_consulta_fixo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Edit</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>tb_consulta_fixo</legend>

        <%: Html.HiddenFor(model => model.IdConsutaFixo) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdPaciente) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.IdPaciente) %>
            <%: Html.ValidationMessageFor(model => model.IdPaciente) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.EhGabarito) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.EhGabarito) %>
            <%: Html.ValidationMessageFor(model => model.EhGabarito) %>
        </div>

        <p>
            <input type="submit" value="Save" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>
