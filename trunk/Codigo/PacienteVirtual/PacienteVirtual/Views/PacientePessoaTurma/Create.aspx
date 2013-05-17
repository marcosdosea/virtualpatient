﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.PacientePessoaTurmaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Create</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>tb_paciente_pessoa_turma</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdConsultaFixo, "tb_consulta_fixo") %>
        </div>
        <div class="editor-field">
            <%: Html.DropDownList("IdConsultaFixo", String.Empty) %>
            <%: Html.ValidationMessageFor(model => model.IdConsultaFixo) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdConsultaVariavel, "tb_consulta_variavel") %>
        </div>
        <div class="editor-field">
            <!--%: Html.DropDownList("IdConsultaVariavel", String.Empty) %-->
            <%: Html.ValidationMessageFor(model => model.IdConsultaVariavel) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.GrupoAtividades) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.GrupoAtividades) %>
            <%: Html.ValidationMessageFor(model => model.GrupoAtividades) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.EstadoPreenchimento) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.EstadoPreenchimento) %>
            <%: Html.ValidationMessageFor(model => model.EstadoPreenchimento) %>
        </div>

        <p>
            <input type="submit" value="Create" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>
