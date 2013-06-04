﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.RelatoClinicoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Create</h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm("Create", "RelatoClinico", FormMethod.Post, new { enctype = "multipart/form-data" }))
   { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>tb_relato_clinico</legend>
       
        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomePaciente) %>
        </div>
        <div class="editor-field"> 
            <%: Html.DropDownList("IdPaciente", String.Empty) %>
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

              <div class="editor-field">
       <input type="file" name="Arquivo" value="Selecione o video" />

        </div>


        <div class="editor-label">
            <%: Html.LabelFor(model => model.NivelDificuldade) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.NivelDificuldade) %>
            <%: Html.ValidationMessageFor(model => model.NivelDificuldade) %>
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
