﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.PacienteModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.criar %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.criar %></h2>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm("Create", "Paciente", FormMethod.Post, new { enctype = "multipart/form-data" }))
   { %>
    <%: Html.ValidationSummary(true)%>
    <fieldset>
        <legend><%: Resources.Mensagem.paciente %></legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomePaciente)%>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.NomePaciente)%>
            <%: Html.ValidationMessageFor(model => model.NomePaciente)%>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Foto)%>
        </div>

        <div class="editor-field">

            <input type="file" name="Arquivo" value="Selecione a imagem" />
            <%: Html.ValidationMessageFor(model => model.Foto)%>
        </div>
        <p>
            <input type="submit" value="<%: Resources.Mensagem.salvar %>" />
        </p>
        <div class="progress progress-info progress-striped">
<div class="bar" style="width: 100%"></div>
</div>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink(Resources.Mensagem.voltar , "Index") %>
</div>

</asp:Content>
