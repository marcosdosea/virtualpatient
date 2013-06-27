<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.TurmaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.criar %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%: Resources.Mensagem.criar %></h2>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>
            <%: Resources.Mensagem.turma %></legend>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Codigo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Codigo) %>
            <%: Html.ValidationMessageFor(model => model.Codigo) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Periodo) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Periodo) %>
            <%: Html.ValidationMessageFor(model => model.Periodo) %>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdInstituicao, "Instituições") %>
        </div>
        <%: Html.DropDownList("IdInstituicao", Resources.Mensagem.selecione)%>
        <!--%= Html.DropDownList("IdInstituicao", new SelectList((IEnumerable)ViewBag.Instituicoes,"IdInstituicao","NomeInstituicao"), "Selecione")%-->
        <br />
        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeDisciplina, "Disciplinas") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdDisciplina", Resources.Mensagem.selecione)%>
            <!--%= Html.DropDownList("IdDisciplina", new SelectList((IEnumerable)ViewBag.Disciplinas,"IdDisciplina","NomeDisciplina"), "Selecione")%-->
            <%: Html.ValidationMessageFor(model => model.IdInstituicao) %>
        </div>
        <div class="form-actions">
        <div class="form-actions">
            <input class="btn" type="submit" class="btn" value="<%: Resources.Mensagem.salvar %>" />
        </div>
        </div>
    </fieldset>
    <% } %>
    <div>
        <%: Html.ActionLink("Voltar", "Index") %>
    </div>
</asp:Content>
