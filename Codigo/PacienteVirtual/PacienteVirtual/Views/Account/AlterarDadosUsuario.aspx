<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.AlterarDadosUsuarioModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.alterar_dados_usuario %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.alterar_dados_usuario %></h2>

 <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.alterar_dados_usuario %></legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.UserName) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.UserName) %>
            <%: Html.ValidationMessageFor(model => model.UserName) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Email) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Email) %>
            <%: Html.ValidationMessageFor(model => model.Email) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Nome) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Nome) %>
            <%: Html.ValidationMessageFor(model => model.Nome) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Cpf) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Cpf) %>
            <%: Html.ValidationMessageFor(model => model.Cpf) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Fone) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Fone) %>
            <%: Html.ValidationMessageFor(model => model.Fone) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Matricula) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Matricula) %>
            <%: Html.ValidationMessageFor(model => model.Matricula) %>
        </div>

        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value=" <%: Resources.Mensagem.salvar %>" />
        </div>
    </fieldset>
<% } %>

</asp:Content>
