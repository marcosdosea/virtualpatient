<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.HistoriaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
     <%: Resources.Mensagem.criar%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
         <%: Resources.Mensagem.criar%></h2>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend> <%: Resources.Mensagem.historia%></legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdConsultaFixo) %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdConsultaFixo", Resources.Mensagem.selecione)%>
            <%: Html.ValidationMessageFor(model => model.IdConsultaFixo) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.HistoriaMedicaPregressa) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.HistoriaMedicaPregressa) %>
            <%: Html.ValidationMessageFor(model => model.HistoriaMedicaPregressa) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.HistoriaFamiliar) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.HistoriaFamiliar) %>
            <%: Html.ValidationMessageFor(model => model.HistoriaFamiliar) %>
        </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar%>" />
    </div>
    </fieldset>
    <% } %>
    <div>
        <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
    </div>
</asp:Content>
