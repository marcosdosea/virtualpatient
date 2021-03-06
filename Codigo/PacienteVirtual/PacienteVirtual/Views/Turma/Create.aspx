﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.TurmaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.criar %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%: Resources.Mensagem.criar %></h2>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.turma %></legend>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Ativa) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Ativa)%>
            <%: Html.ValidationMessageFor(model => model.Ativa, string.Empty, new { @class = "styleValidation" })%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Codigo) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Codigo, new { MaxLength = 20 })%>
            <%: Html.ValidationMessageFor(model => model.Codigo, string.Empty, new { @class = "styleValidation" })%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Periodo) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Periodo, new { MaxLength = 6 })%>
            <%: Html.ValidationMessageFor(model => model.Periodo, string.Empty, new { @class = "styleValidation" })%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeInstituicao) %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdInstituicao", Resources.Mensagem.selecione)%>
            <%: Html.ValidationMessageFor(model => model.IdInstituicao, string.Empty, new { @class = "styleValidation" })%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeDisciplina) %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdDisciplina", Resources.Mensagem.selecione)%>
            <%: Html.ValidationMessageFor(model => model.IdDisciplina, string.Empty, new { @class = "styleValidation" })%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeCurso) %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdCurso", Resources.Mensagem.selecione)%>
            <%: Html.ValidationMessageFor(model => model.IdCurso, string.Empty, new { @class = "styleValidation" })%>
        </div>
        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
        </div>
    </fieldset>
    <% } %>
    <div>
        <%: Html.ActionLink(Resources.Mensagem.voltar, "Index")%>
    </div>
</asp:Content>
