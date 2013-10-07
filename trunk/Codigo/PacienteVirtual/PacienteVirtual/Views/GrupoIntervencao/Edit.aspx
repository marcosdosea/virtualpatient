<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.Cadastro.GrupoIntervencaoModel>" %>

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
        <legend><%: Resources.Mensagem.grupo_intervencao %></legend>

        <%: Html.HiddenFor(model => model.IdGrupoIntervencao) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DescricaoGrupoIntervencao) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.DescricaoGrupoIntervencao, new { style = "width:350px;", MaxLength = 40 })%>
            <%: Html.ValidationMessageFor(model => model.DescricaoGrupoIntervencao) %>
        </div>
        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
        </div>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Index")%>
</div>

</asp:Content>
