<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.HistoricoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
<%: Resources.Mensagem.criar%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.criar%></h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.historico%></legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdPessoa) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.IdPessoa) %>
            <%: Html.ValidationMessageFor(model => model.IdPessoa) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdTurma) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.IdTurma) %>
            <%: Html.ValidationMessageFor(model => model.IdTurma) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdPaciente) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.IdPaciente) %>
            <%: Html.ValidationMessageFor(model => model.IdPaciente) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdTutor) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.IdTutor) %>
            <%: Html.ValidationMessageFor(model => model.IdTutor) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdRelato) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.IdRelato) %>
            <%: Html.ValidationMessageFor(model => model.IdRelato) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DataEnvio) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.DataEnvio) %>
            <%: Html.ValidationMessageFor(model => model.DataEnvio) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.DataResposta) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.DataResposta) %>
            <%: Html.ValidationMessageFor(model => model.DataResposta) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Estado) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Estado) %>
            <%: Html.ValidationMessageFor(model => model.Estado) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.ComentarioTutor) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.ComentarioTutor) %>
            <%: Html.ValidationMessageFor(model => model.ComentarioTutor) %>
        </div>

    <div class="form-actions">
        <input class="btn" type="submit" value="<%: Resources.Mensagem.salvar%>" />
    </div>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
</div>

</asp:Content>
