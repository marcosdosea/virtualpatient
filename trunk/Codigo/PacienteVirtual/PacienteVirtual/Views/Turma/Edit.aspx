<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.TurmaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.editar %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%: Resources.Mensagem.editar %></h2>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.turma %></legend>

        <%: Html.HiddenFor(model => model.IdTurma) %>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Ativa) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Ativa) %>
            <%: Html.ValidationMessageFor(model => model.Ativa) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Codigo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Codigo) %>
            <%: Html.ValidationMessageFor(model => model.Codigo) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Periodo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Periodo) %>
            <%: Html.ValidationMessageFor(model => model.Periodo) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeInstituicao) %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdInstituicao", Resources.Mensagem.selecione) %>
            <%: Html.ValidationMessageFor(model => model.IdInstituicao) %>
        </div>
        <div class="editor-label">
               <%: Html.LabelFor(model => model.NomeDisciplina) %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdDisciplina", Resources.Mensagem.selecione) %>
            <%: Html.ValidationMessageFor(model => model.IdDisciplina) %>
        </div>
        <div class="editor-label">
               <%: Html.LabelFor(model => model.NomeCurso) %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdCurso", Resources.Mensagem.selecione) %>
            <%: Html.ValidationMessageFor(model => model.IdCurso) %>
        </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
</div>

</asp:Content>
