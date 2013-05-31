<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.QueixaModel>" %>

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
        <legend>tb_queixa</legend>

        <%: Html.HiddenFor(model => model.IdQueixa) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DescricaoQueixa) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.DescricaoQueixa) %>
            <%: Html.ValidationMessageFor(model => model.DescricaoQueixa) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeSistema) %>
        </div>
        <div class="editor-field">
            <%= Html.DropDownList("IdSistema", Resources.Mensagem.selecione)%>
            <%: Html.ValidationMessageFor(model => model.IdSistema) %>
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
