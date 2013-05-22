<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.DisciplinaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
     <%: Resources.Mensagem.criar %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2> <%: Resources.Mensagem.criar %></h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend> <%: Resources.Mensagem.disciplina %></legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeDisciplina) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.NomeDisciplina) %>
            <%: Html.ValidationMessageFor(model => model.NomeDisciplina) %>
        </div>

        <p>
            <input type="submit" value=" <%: Resources.Mensagem.salvar %>" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink( Resources.Mensagem.voltar , "Index") %>
</div>

</asp:Content>
