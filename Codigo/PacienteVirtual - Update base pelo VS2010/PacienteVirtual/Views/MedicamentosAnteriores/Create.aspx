﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.MedicamentosAnterioresModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Create</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>MedicamentosAnterioresE</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Indicacao) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Indicacao) %>
            <%: Html.ValidationMessageFor(model => model.Indicacao) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Resposta) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Resposta) %>
            <%: Html.ValidationMessageFor(model => model.Resposta) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Periodo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Periodo) %>
            <%: Html.ValidationMessageFor(model => model.Periodo) %>
        </div>

        <p>
            <input type="submit" value="Create" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>
