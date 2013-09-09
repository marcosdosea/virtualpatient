﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.PacienteModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.editar %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%: Resources.Mensagem.editar %></h2>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <script type="text/javascript">
        //Lê Url do diretorio selecionado 
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#PreviewDaImagem').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
    <% using (Html.BeginForm("Edit", "Paciente", FormMethod.Post, new { enctype = "multipart/form-data" }))
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>
            <%: Resources.Mensagem.paciente %></legend>
        <%: Html.HiddenFor(model => model.IdPaciente) %>
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
            <img class="media" id="PreviewDaImagem" src="<%: Url.Action("GetImage", "Paciente") %>/<%: ViewBag.fotoId %>"
                alt="Definir Imagem Padrão" style="width: 250px; height: 250px;" />
            <p>
                <input type="file" name="Arquivo" value="Selecione a imagem" onchange="readURL(this);" /></p>
            <%: Html.ValidationMessageFor(model => model.Foto)%>
        </div>
        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
        </div>
        <div class="progress progress-info progress-striped active ">
            <div class="bar" style="width: 100%">
            </div>
        </div>
    </fieldset>
    <% } %>
    <div>
        <%: Html.ActionLink(Resources.Mensagem.voltar, "Index")%>
    </div>
</asp:Content>