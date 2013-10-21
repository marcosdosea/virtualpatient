<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.Turma.TurmaPessoaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.selecionar_turma %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.selecionar_turma %></h2>

<% using (Html.BeginForm("Create", "SelecionarTurma")) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.selecione %></legend>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeTurma) %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdTurma", null, Resources.Mensagem.selecione, new { style = "width:500px;" })%>
            <%: Html.ValidationMessageFor(model => model.IdTurma) %>
        </div>
        <!-- botao salvar-->
        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.selecionar_turma %>" />
        </div>
    </fieldset>
<% } %>

</asp:Content>
