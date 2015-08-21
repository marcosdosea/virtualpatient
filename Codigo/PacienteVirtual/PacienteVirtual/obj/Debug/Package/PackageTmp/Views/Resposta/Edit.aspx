<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.RespostaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.editar %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%: Resources.Mensagem.editar %></h2>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>
            <%: Resources.Mensagem.resposta %></legend>
        <%: Html.HiddenFor(model => model.IdResposta) %>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Pergunta)%>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdPergunta", Resources.Mensagem.selecione) %>
            <%: Html.ValidationMessageFor(model => model.IdPergunta, string.Empty, new { @class = "styleValidation" })%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Resposta) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Resposta, new { style = "width:850px;"})%>
            <%: Html.ValidationMessageFor(model => model.Resposta, string.Empty, new { @class = "styleValidation" })%>
        </div>
        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="  <%: Resources.Mensagem.salvar %>" />
        </div>
    </fieldset>
    <% } %>
    <div>
        <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
    </div>
</asp:Content>
