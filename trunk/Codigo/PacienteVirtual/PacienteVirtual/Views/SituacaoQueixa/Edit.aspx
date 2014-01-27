<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.SituacaoQueixaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.editar %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%: Resources.Mensagem.editar %></h2>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>
            <%: Resources.Mensagem.estado_situacao %></legend>
        <%: Html.HiddenFor(model => model.IdSituacaoQueixa) %>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.DescricaoSituacao) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.DescricaoSituacao, new { style = "width:350px;", MaxLength = 100 })%>
            <%: Html.ValidationMessageFor(model => model.DescricaoSituacao, string.Empty, new { @class = "styleValidation" })%>
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
