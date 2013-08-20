<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.MedicamentoPrescritoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
<%: Resources.Mensagem.deletar %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.deletar %></h2>

<h3><%: Resources.Mensagem.deletar_pergunta %></h3>
<fieldset>
    <legend>MedicamentoPrescritoE</legend>

    <div class="display-label">Fitoterapico</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Fitoterapico) %>
    </div>

    <div class="display-label">Dosagem</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Dosagem) %>
    </div>

    <div class="display-label">Posologia</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Posologia) %>
    </div>

    <div class="display-label">Prescritor</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Prescritor) %>
    </div>

    <div class="display-label">Especialidade</div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Especialidade) %>
    </div>
</fieldset>
<% using (Html.BeginForm()) { %>
    <p>
        <%: Resources.Mensagem.deletar %> |
        <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
    </p>
<% } %>

</asp:Content>
