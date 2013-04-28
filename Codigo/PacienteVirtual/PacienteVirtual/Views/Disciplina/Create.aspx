<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.DisciplinaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Disciplina
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Disciplina</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>Criar Disciplina</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeDisciplina) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.NomeDisciplina) %>
            <%: Html.ValidationMessageFor(model => model.NomeDisciplina) %>
        </div>

        <p>
            <input type="submit" value="Criar" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Voltar", "Index") %>
</div>

</asp:Content>
