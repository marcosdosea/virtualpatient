<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.DiagnosticoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.editar %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.editar %></h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.diagnostico %></legend>

        <%: Html.HiddenFor(model => model.IdDiagnostico) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DescricaoDiagnostico) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.DescricaoDiagnostico, new { style = "width:350px;", MaxLength = 40 })%>
            <%: Html.ValidationMessageFor(model => model.DescricaoDiagnostico, string.Empty, new { @class = "styleValidation" })%>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DescricaoGrupoDiagnostico)%>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdGrupoDiagnostico", Resources.Mensagem.selecione)%>
            <%: Html.ValidationMessageFor(model => model.IdGrupoDiagnostico, string.Empty, new { @class = "styleValidation" })%>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span4">
                <%: Html.EditorFor(model => model.Risco) %>
                <%: Resources.Mensagem.risco %>
                <%: Html.ValidationMessageFor(model => model.Risco, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>

        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" /></div>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Index")%>
</div>

</asp:Content>
