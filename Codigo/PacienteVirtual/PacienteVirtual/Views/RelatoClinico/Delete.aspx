<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.RelatoClinicoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
   <%: Resources.Mensagem.deletar %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.deletar %></h2>

<h3><%: Resources.Mensagem.deletar_pergunta %></h3>
<fieldset>
    <legend><%: Resources.Mensagem.relato_clinico %></legend>

    <div class="display-label"><%: Resources.Mensagem.paciente %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NomePaciente) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.ordem_cronologica %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.OrdemCronologica) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.relato_textual %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.RelatoTextual) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.nivel_dificuldade %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.NivelDificuldade) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <input type="submit" value="<%: Resources.Mensagem.deletar %>" /> |
        <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
    </p>
<% } %>

</asp:Content>
