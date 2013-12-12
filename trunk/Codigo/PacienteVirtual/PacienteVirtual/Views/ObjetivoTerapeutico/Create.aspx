<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.ObjetivoTerapeuticoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.criar%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.criar %></h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.objetivo_terapeutico %></legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DescricaoObjetivoTerapeutico) %>
        </div>
        <div class="editor-field">
            <%: Html.TextAreaFor(model => model.DescricaoObjetivoTerapeutico, new { style = "width:350px;", MaxLength = 150 })%>
            <%: Html.ValidationMessageFor(model => model.DescricaoObjetivoTerapeutico) %>
        </div>
        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
        </div>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
</div>

</asp:Content>
