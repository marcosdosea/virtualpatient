<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.Data.tb_paciente_pessoa_turma>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Details</h2>

<fieldset>
    <legend>tb_paciente_pessoa_turma</legend>

    <div class="display-label">tb_consulta_fixo</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.tb_consulta_fixo.IdConsutaFixo) %>
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
<p>
    <%: Html.ActionLink("Edit", "Edit", new { /* id=Model.PrimaryKey */ }) %> |
    <%: Html.ActionLink("Back to List", "Index") %>
</p>

</asp:Content>
