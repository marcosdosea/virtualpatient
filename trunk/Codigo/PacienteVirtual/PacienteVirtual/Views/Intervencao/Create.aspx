<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.Cadastro.IntervencaoModel>" %>

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
        <legend><%: Resources.Mensagem.intervencao %></legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DescricaoIntervencao) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.DescricaoIntervencao, new { style = "width:350px;", MaxLength = 40  })%>
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
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Index")%>
</div>

</asp:Content>
