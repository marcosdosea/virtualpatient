<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.DiarioPessoalModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.detalhes %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.detalhes %></h2>

<fieldset>
    <legend>tb_diario_pessoal</legend>

    <div class="display-label"><%: Resources.Mensagem.periodo %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Periodo) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.horario %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Horario) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.quantidade %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.Quantidade) %>
    </div>

    <div class="display-label"><%: Resources.Mensagem.tipo_bebida %></div>
    <div class="display-field">
        <%: Html.DisplayFor(model => model.TipoBebida) %>
    </div>
</fieldset>
<p>
    <%: Html.ActionLink(Resources.Mensagem.editar, "Edit", new { /* id=Model.PrimaryKey */ }) %> |
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
</p>

</asp:Content>
