<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.DiagnosticoCaracteristicaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.detalhes %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.detalhes %></h2>

<fieldset>
    <legend><%: Resources.Mensagem.caracteristica_diagnostico %></legend>
    <div class="display-label"><%: Resources.Mensagem.diagnostico %></div>
    <div class="display-label">
        <%: Html.DisplayFor(model => model.DescricaoDiagnostico) %>
    </div>
    
    <div class="display-label"><%: Resources.Mensagem.descricao_caracteristica_diagnostico %></div>
    <div class="display-label">
        <%: Html.DisplayFor(model => model.DescricaoCaracteristicaDiagnostico) %>
    </div>

</fieldset>
<p>

    <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id = Model.IdDiagnosticoCaracteristica })%> |
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Index")%>
</p>

</asp:Content>
