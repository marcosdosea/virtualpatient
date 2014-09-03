<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.DiagnosticoCaracteristicaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.criar %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.criar %></h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.caracteristica_diagnostico %></legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DescricaoDiagnostico)%>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdDiagnostico", Resources.Mensagem.selecione) %>
            <%: Html.ValidationMessageFor(model => model.IdDiagnostico, string.Empty, new { @class = "styleValidation" })%>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DescricaoCaracteristicaDiagnostico) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.DescricaoCaracteristicaDiagnostico, new { style = "width:700px;", MaxLength = 200 })%>
            <%: Html.ValidationMessageFor(model => model.DescricaoCaracteristicaDiagnostico, string.Empty, new { @class = "styleValidation" })%>
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
