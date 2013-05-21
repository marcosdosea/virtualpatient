<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.PacientePessoaTurmaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Delete
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Delete</h2>

<h3>Are you sure you want to delete this?</h3>
<fieldset>
    <legend>tb_paciente_pessoa_turma</legend>

    <div class="display-label">tb_consulta_fixo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.tb_consulta_fixo.IdConsultaFixo) %>
    </div>

    <div class="display-label">tb_consulta_variavel</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.tb_consulta_variavel.Lembretes) %>
    </div>

    <div class="display-label">GrupoAtividades</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.GrupoAtividades) %>
    </div>

    <div class="display-label">EstadoPreenchimento</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.EstadoPreenchimento) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="Delete" /> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>
<% } %>

</asp:Content>
