<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.ConsultaFixoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.detalhes%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.detalhes%></h2>

<fieldset>
    <legend><%: Resources.Mensagem.consulta_dados_fixos%></legend>

    <div class="display-label"><%: Resources.Mensagem.paciente_codigo%></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.IdPaciente) %>
    </div>

        <div class="display-label"><%: Resources.Mensagem.paciente%></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.PacienteNome) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.eh_gabarito%></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.EhGabarito) %>
    </div>
</fieldset>

<p>

    <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id=Model.IdConsultaFixo }) %> |
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
</p>

</asp:Content>
