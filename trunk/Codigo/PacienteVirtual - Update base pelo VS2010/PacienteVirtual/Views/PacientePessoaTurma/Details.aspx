<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.PacientePessoaTurmaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.detalhes %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.detalhes %></h2>

<fieldset>
    <legend><%: Resources.Mensagem.paciente_pessoa_turma %></legend>

    <div class="display-label"><%: Resources.Mensagem.consulta_dados_fixos %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.IdConsultaFixo) %>
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
