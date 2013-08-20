<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.ConsultaVariavelQueixaModel>" %>

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
        <legend>ConsultaVariavelQueixaE</legend>

        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>

        <%: Html.HiddenFor(model => model.IdQueixa) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdAcaoQueixa, "tb_acao_queixa") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdAcaoQueixa", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.IdAcaoQueixa) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Motivo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Motivo) %>
            <%: Html.ValidationMessageFor(model => model.Motivo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Desde) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Desde) %>
            <%: Html.ValidationMessageFor(model => model.Desde) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Prioridade) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Prioridade) %>
            <%: Html.ValidationMessageFor(model => model.Prioridade) %>
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
