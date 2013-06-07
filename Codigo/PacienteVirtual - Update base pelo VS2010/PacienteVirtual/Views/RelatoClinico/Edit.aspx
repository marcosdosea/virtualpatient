<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.RelatoClinicoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.editar %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.editar %></h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.relato_clinico %></legend>

        <%: Html.HiddenFor(model => model.IdRelato) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdPaciente, "tb_paciente") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdPaciente", Resources.Mensagem.selecione)%>
            <%: Html.ValidationMessageFor(model => model.IdPaciente) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.OrdemCronologica) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.OrdemCronologica) %>
            <%: Html.ValidationMessageFor(model => model.OrdemCronologica) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.RelatoTextual) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.RelatoTextual) %>
            <%: Html.ValidationMessageFor(model => model.RelatoTextual) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.NivelDificuldade) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.NivelDificuldade) %>
            <%: Html.ValidationMessageFor(model => model.NivelDificuldade) %>
        </div>

        <p>
            <input type="submit" value="<%: Resources.Mensagem.salvar %>" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
</div>

</asp:Content>
