﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.CursoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>

    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>CursoE</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomeCurso) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.NomeCurso) %>
            <%: Html.ValidationMessageFor(model => model.NomeCurso) %>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.IdInstituicao, "tb_instituicao") %>
        </div>

        <div class="editor-label">

            <% foreach (var color in ViewBag.ListColors)
               { %>
            <li>
                <%: color %>
            </li>
            <% } %>
        </div>
        <%   foreach (var person in ViewBag.Instituicoes1)
             {%>
  
        comboBox.Items.Add(person.NomeInstituicao);<br />

        <% }%>

        <%= Html.DropDownList("IdInstituicao", new SelectList((IEnumerable)ViewBag.Instituicoes1,"IdInstituicao","NomeInstituicao"), "Selecione1")%>
        <br />
        <%: Html.DropDownList("IdInstituicao", (IEnumerable<SelectListItem>)ViewBag.Instituicoes2, "Selecione2")%>


        <%: Html.ValidationMessageFor(model => model.NomeInstituicao) %>

        
        <p>
            <input type="submit" value="Create" />
        </p>
    </fieldset>
    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>