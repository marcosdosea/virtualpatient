<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.PacienteModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.deletar %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.deletar %></h2>

<h3><%: Resources.Mensagem.deletar_pergunta %></h3>
<fieldset>
    <legend><%: Resources.Mensagem.paciente %></legend>

    <div class="display-label"><%: Resources.Mensagem.nome %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomePaciente) %>
    </div>
     <img src='<%: Url.Action("GetImage", "Paciente", new RouteValueDictionary(new { id = Model.IdPaciente})) %>'
            width="100" height="110" alt="<%: Url.Action("GetImage", "Paciente", new RouteValueDictionary(new { id = Model.IdPaciente})) %>" />
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="<%: Resources.Mensagem.deletar %>" /> |
        <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
    </p>
<% } %>

</asp:Content>
