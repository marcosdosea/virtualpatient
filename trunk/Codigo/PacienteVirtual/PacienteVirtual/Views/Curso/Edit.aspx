﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.CursoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.editar %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2> <%: Resources.Mensagem.editar %></h2>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.curso %></legend>

        <%: Html.HiddenFor(model => model.IdCurso) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeCurso) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.NomeCurso) %>
            <%: Html.ValidationMessageFor(model => model.NomeCurso) %>
        </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value=" <%: Resources.Mensagem.salvar %>" />
    </div>
    </fieldset>
    <% } %>

    <div>
        <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
    </div>

</asp:Content>
