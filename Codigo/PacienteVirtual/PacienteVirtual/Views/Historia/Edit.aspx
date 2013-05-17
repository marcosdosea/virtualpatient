﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.HistoriaModel>" %>

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
        <legend>tb_historia</legend>

        <%: Html.HiddenFor(model => model.IdConsultaFixo) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.HistoriaMedicaPregressa) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.HistoriaMedicaPregressa) %>
            <%: Html.ValidationMessageFor(model => model.HistoriaMedicaPregressa) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.HistoriaFamiliar) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.HistoriaFamiliar) %>
            <%: Html.ValidationMessageFor(model => model.HistoriaFamiliar) %>
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
