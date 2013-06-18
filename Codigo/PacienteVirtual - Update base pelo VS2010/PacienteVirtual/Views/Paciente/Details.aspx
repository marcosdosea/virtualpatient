<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.PacienteModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.detalhes %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.detalhes %></h2>

<fieldset>
    <legend><%: Resources.Mensagem.paciente %></legend>

    <div class="display-label"><%: Resources.Mensagem.nome %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomePaciente) %>
    </div>
     <img src='<%: Url.Action("GetImage", "Paciente", new RouteValueDictionary(new { id = Model.IdPaciente})) %>'
            width="100" height="110" alt="<%: Url.Action("GetImage", "Paciente", new RouteValueDictionary(new { id = Model.IdPaciente})) %>" />
</fieldset>
<p>

    <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { id=Model.IdPaciente }) %> |
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
</p>

</asp:Content>
