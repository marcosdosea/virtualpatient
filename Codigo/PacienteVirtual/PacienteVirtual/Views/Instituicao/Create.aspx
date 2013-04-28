<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.InstituicaoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Instituição
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Instituição</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>Criar Instituição</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeInstituicao) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.NomeInstituicao) %>
            <%: Html.ValidationMessageFor(model => model.NomeInstituicao) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Sigla) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Sigla) %>
            <%: Html.ValidationMessageFor(model => model.Sigla) %>
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
