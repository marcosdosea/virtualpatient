<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.CursoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
   Curso
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Curso</h2>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>Editar Curso</legend>

        <%: Html.HiddenFor(model => model.IdCurso) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeCurso) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.NomeCurso) %>
            <%: Html.ValidationMessageFor(model => model.NomeCurso) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeInstituicao) %>
        </div>
        <div class="editor-field">
            <%= Html.DropDownList("IdInstituicao", "Selecione")%>
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
