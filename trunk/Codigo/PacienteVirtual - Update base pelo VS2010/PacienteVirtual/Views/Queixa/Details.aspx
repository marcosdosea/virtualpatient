﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.QueixaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>tb_queixa</legend>

    <div class="display-label">DescricaoQueixa</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DescricaoQueixa) %>
    </div>

    <div class="display-label">IdSistema</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomeSistema) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink("Edit", "Edit", new { id=Model.IdQueixa }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
