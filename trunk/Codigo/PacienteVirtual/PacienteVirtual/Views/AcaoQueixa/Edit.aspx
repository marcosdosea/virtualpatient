<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.Cadastro.AcaoQueixaModel>" %>

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
            <%: Resources.Mensagem.acao_queixa %></legend>
        <%: Html.HiddenFor(model => model.IdAcaoQueixa) %>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.DescricaoAcao) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.DescricaoAcao, new { style = "width:350px;", MaxLength = 100 })%>
            <%: Html.ValidationMessageFor(model => model.DescricaoAcao) %>
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
