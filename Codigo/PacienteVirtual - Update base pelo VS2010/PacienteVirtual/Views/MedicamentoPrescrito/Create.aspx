﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.MedicamentoPrescritoModel>" %>

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
        <legend>MedicamentoPrescritoE</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Fitoterapico) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Fitoterapico) %>
            <%: Html.ValidationMessageFor(model => model.Fitoterapico) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Dosagem) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Dosagem) %>
            <%: Html.ValidationMessageFor(model => model.Dosagem) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Posologia) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Posologia) %>
            <%: Html.ValidationMessageFor(model => model.Posologia) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Prescritor) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Prescritor) %>
            <%: Html.ValidationMessageFor(model => model.Prescritor) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Especialidade) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Especialidade) %>
            <%: Html.ValidationMessageFor(model => model.Especialidade) %>
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