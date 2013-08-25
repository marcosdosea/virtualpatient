<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.Turma.SolicitarMatriculaTurmaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.solicitar_matricula_turma %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>
            <%: Resources.Mensagem.solicitar_matricula_turma %></legend>
        <% using (Html.BeginForm("Index", "SolicitarMatriculaTurma", FormMethod.Post, null))
           { %>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeInstituicao) %>
        </div>
        <%: Html.DropDownList("IdInstituicao", null, Resources.Mensagem.selecione, new { onchange = "this.form.submit();" })%>
        <%: Html.ValidationMessageFor(model => model.IdInstituicao) %>
        <!-- %: Html.DropDownList("IdPaciente", null, Resources.Mensagem.selecione, new { @onchange = "this.form.action = Index = 1;" })%-->
        <% } %>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.Codigo) %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdTurma", Resources.Mensagem.selecione)%>
            <%: Html.ValidationMessageFor(model => model.IdTurma) %>
        </div>
        <!-- botao salvar-->
        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value=" <%: Resources.Mensagem.enviar_solicitacao_turma %>" />
        </div>
    </fieldset>
    <% } %>
</asp:Content>
