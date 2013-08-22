<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.TurmaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.deletar %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2> <%: Resources.Mensagem.deletar %></h2>

    <h3> <%: Resources.Mensagem.deletar_pergunta %></h3>
    <fieldset>
        <legend> <%: Resources.Mensagem.turma %></legend>
        <div class="display-label">  <%: Html.LabelFor(model => model.Ativa) %></div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.Ativa) %>
        </div>
        <div class="display-label">  <%: Html.LabelFor(model => model.Codigo) %></div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.Codigo) %>
        </div>

        <div class="display-label">  <%: Html.LabelFor(model => model.Periodo) %></div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.Periodo) %>
        </div>

        <div class="display-label">  <%: Html.LabelFor(model => model.NomeDisciplina) %></div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.NomeDisciplina) %>
        </div>

        <div class="display-label">  <%: Html.LabelFor(model => model.NomeInstituicao) %></div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.NomeInstituicao) %>
        </div>
        <div class="display-label">  <%: Html.LabelFor(model => model.NomeCurso) %></div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.NomeCurso) %>
        </div>
    </fieldset>
    <% using (Html.BeginForm())
       { %>
        <input type="submit" value="<%: Resources.Mensagem.deletar %>" />
        <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
    <% } %>
</asp:Content>
