<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.CursoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.curso%>
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
        <legend>Criar Novo Curso</legend>
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
        <!--div-- class="editor-label">
            <!--%: Html.LabelFor(model => model.NomeInstituicao) %-->
        <!--/div-->
        <div class="editor-field">
            <%: Html.DropDownList("IdInstituicao", Resources.Mensagem.selecione)%>
            <%: Html.ValidationMessageFor(model => model.IdInstituicao)%>
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
