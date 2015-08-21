<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.DiagnosticoFatorModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.detalhes %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.detalhes %></h2>

<fieldset>
    <legend><%: Resources.Mensagem.fator_diagnostico %></legend>
    <div class="display-label"><%: Resources.Mensagem.diagnostico %></div>
    <div class="display-label">
        <%: Html.DisplayFor(model => model.DescricaoDiagnostico) %>
    </div>
    
    <div class="display-label"><%: Resources.Mensagem.descricao_fator_diagnostico %></div>
    <div class="display-label">
        <%: Html.DisplayFor(model => model.DescricaoFatorDiagnostico) %>
    </div>

</fieldset>
<p>

    <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id = Model.IdDiagnosticoFator })%> |
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Index")%>
</p>

</asp:Content>
