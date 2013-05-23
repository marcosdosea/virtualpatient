<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.PacienteModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Create</h2>
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm("Create", "Paciente", FormMethod.Post, new { @enctype = "multipart/form-data" }))
   { %>
    <%: Html.ValidationSummary(true)%>
    <fieldset>
        <legend>Criar Paciente</legend>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Nome)%>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Nome)%>
            <%: Html.ValidationMessageFor(model => model.Nome)%>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Foto)%>
        </div>
        <div class="editor-field">
            <img src="Paciente/Create" width="100" height="100" alt="" />
            <input type="file" name="Arquivo" value="Selecione a imagem" />
            <%: Html.ValidationMessageFor(model => model.Foto)%>
        </div>
        
        
        <!--<div class="editor-field">            
            <% Html.BeginForm("Index", "Index", FormMethod.Post, new { enctype = "multipart/form-data" });  %>    
            Selecione o arquivo:<input type="file" name="upload" />
            <%: Html.ValidationMessageFor(model => model.Foto) %>
        </div> -->



        <p>
            <input type="submit" value="Create" />
        </p>
    </fieldset>
<% } %>

<div>
    <%: Html.ActionLink("Back to List", "Index") %>
</div>

</asp:Content>
