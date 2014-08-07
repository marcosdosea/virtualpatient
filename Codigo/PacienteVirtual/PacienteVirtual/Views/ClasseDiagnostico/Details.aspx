<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.ClasseDiagnosticoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.detalhes %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.detalhes %></h2>

<fieldset>
    <legend><%: Resources.Mensagem.classe_diagnostico %></legend>

    <div class="display-label"><%: Resources.Mensagem.descricao_dominio_diagnostico %></div>
    <div class="display-label">
        <%: Html.DisplayFor(model => model.DescricaoDominioDiagnostico) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.descricao_classe_diagnostico %></div>
    <div class="display-label">
        <%: Html.DisplayFor(model => model.DescricaoClasseDiagnostico) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id = Model.IdClasseDiagnostico })%> |
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Index")%>
</p>

</asp:Content>
