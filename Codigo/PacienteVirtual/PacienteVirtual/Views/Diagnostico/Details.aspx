<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.DiagnosticoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.detalhes %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.detalhes %></h2>

<fieldset>
    <legend><%: Resources.Mensagem.diagnostico %></legend>

    <div class="display-label"><%: Resources.Mensagem.diagnostico %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Diagnostico) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.descricao_classe_diagnostico %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.DescricaoClasseDiagnostico) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.risco %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Risco) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id = Model.IdDiagnostico })%> |
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Index")%>
</p>

</asp:Content>
