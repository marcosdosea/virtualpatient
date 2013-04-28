<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.InstituicaoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Instituição
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Instituição</h2>

    <h3>Você tem certeza que deseja excluir esta Instituição?</h3>
    <fieldset>
        <legend>Remover Instiuição</legend>

        <div class="display-label"><%: Html.LabelFor(model => model.NomeInstituicao) %></div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.NomeInstituicao) %>
        </div>

        <div class="display-label"><%: Html.LabelFor(model => model.Sigla) %></div>
        <div class="display-field">
            <%: Html.DisplayFor(model => model.Sigla) %>
        </div>
        <p>
            <input type="submit" value="Delete" />
        </p>
    </fieldset>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ActionLink("Voltar", "Index") %>
    <% } %>
</asp:Content>
