<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.AreaAtuacaoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.criar%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.criar %></h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.area_atuacao %></legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.AreaAtuacao) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.AreaAtuacao, new { style = "width:350px;", MaxLength = 50 })%>
            <%: Html.ValidationMessageFor(model => model.AreaAtuacao, string.Empty, new { @class = "styleValidation" })%>
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
