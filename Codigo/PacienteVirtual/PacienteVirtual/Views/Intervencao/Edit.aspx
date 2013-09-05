<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.Cadastro.IntervencaoModel>" %>

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
        <legend><%: Resources.Mensagem.intervencao %></legend>

        <%: Html.HiddenFor(model => model.IdIntervencao) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DescricaoIntervencao) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.DescricaoIntervencao) %>
            <%: Html.ValidationMessageFor(model => model.DescricaoIntervencao) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DescricaoGrupoIntervencao)%>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdGrupoIntervencao", Resources.Mensagem.selecione)%>
            <%: Html.ValidationMessageFor(model => model.IdGrupoIntervencao)%>
        </div>
        <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" /></div>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Index")%>
</div>

</asp:Content>
