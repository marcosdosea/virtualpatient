<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.TurmaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Turma
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Turma</h2>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>Editar Turma</legend>

        <%: Html.HiddenFor(model => model.IdTurma) %>

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
               <%: Html.LabelFor(model => model.NomeDisciplina, "Disciplinas") %>
        </div>
        <div class="editor-field">
            <!--%= Html.DropDownList("IdDisciplina", new SelectList((IEnumerable)ViewBag.Disciplinas,"IdDisciplina","NomeDisciplina"), "Selecione")%-->
            <%: Html.DropDownList("IdDisciplina", "Selecione") %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdInstituicao, "Instituições") %>
        </div>
        <div class="editor-field">
            <!--%= Html.DropDownList("IdInstituicao", new SelectList((IEnumerable)ViewBag.Instituicoes,"IdInstituicao","NomeInstituicao"), "Selecione")%-->
            <%: Html.DropDownList("IdInstituicao", "Selecione") %>
            <%: Html.ValidationMessageFor(model => model.IdInstituicao) %>
        </div>

        <p>
            <input type="submit" value="Salvar" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Voltar", "Index") %>
</div>

</asp:Content>
