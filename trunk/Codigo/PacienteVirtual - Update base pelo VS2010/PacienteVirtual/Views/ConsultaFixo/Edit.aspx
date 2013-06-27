<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.ConsultaFixoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
       <%: Resources.Mensagem.editar %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>    <%: Resources.Mensagem.editar %></h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>    <%: Resources.Mensagem.consulta_dados_fixos %></legend>

        <%: Html.HiddenFor(model => model.IdConsultaFixo) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdTurma) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.IdTurma) %>
            <%: Html.ValidationMessageFor(model => model.IdTurma) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdPessoa) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.IdPessoa) %>
            <%: Html.ValidationMessageFor(model => model.IdPessoa) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.EstadoPreenchimento) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.EstadoPreenchimento) %>
            <%: Html.ValidationMessageFor(model => model.EstadoPreenchimento) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.EhGabarito) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.EhGabarito) %>
            <%: Html.ValidationMessageFor(model => model.EhGabarito) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DataAtualizacao) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.DataAtualizacao) %>
            <%: Html.ValidationMessageFor(model => model.DataAtualizacao) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ComentariosTutor) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.ComentariosTutor) %>
            <%: Html.ValidationMessageFor(model => model.ComentariosTutor) %>
        </div>

    <div class="form-actions">
        <input class="btn" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
</div>

</asp:Content>
