<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.Data.turma>" %>

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
        <legend>turma</legend>

        <%: Html.HiddenFor(model => model.id) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.codigo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.codigo) %>
            <%: Html.ValidationMessageFor(model => model.codigo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.periodo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.periodo) %>
            <%: Html.ValidationMessageFor(model => model.periodo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.fktutor, "tutor") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("fktutor", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.fktutor) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.nmDisciplina) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.nmDisciplina) %>
            <%: Html.ValidationMessageFor(model => model.nmDisciplina) %>
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
