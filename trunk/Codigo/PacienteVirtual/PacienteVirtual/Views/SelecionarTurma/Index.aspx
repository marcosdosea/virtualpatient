<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.Turma.TurmaPessoaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Selecionarturma
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>selecionarturma</h2>

<% using (Html.BeginForm("Create", "SelecionarTurma")) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>selecionarturma</legend>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeTurma) %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdTurma", Resources.Mensagem.selecione)%>
            <%: Html.ValidationMessageFor(model => model.IdTurma) %>
        </div>
        <!-- botao salvar-->
        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="selecionar turma" />
        </div>
    </fieldset>
<% } %>

</asp:Content>
