<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.HistoriaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
   <%: Resources.Mensagem.detalhes%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2> <%: Resources.Mensagem.detalhes%></h2>

<fieldset>
    <legend> <%: Resources.Mensagem.historia%></legend>

    <div class="display-label"> <%: Resources.Mensagem.historia_medicamento_pregressa%></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.HistoriaMedicaPregressa) %>
    </div>

    <div class="display-label"> <%: Resources.Mensagem.historia_familiar %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.HistoriaFamiliar) %>
    </div>
</fieldset>
<p>

    <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id = Model.IdConsultaFixo })%> |
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Index")%>
</p>

</asp:Content>
