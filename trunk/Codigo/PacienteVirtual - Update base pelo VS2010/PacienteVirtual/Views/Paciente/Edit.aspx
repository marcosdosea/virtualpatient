<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.PacienteModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Edit
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Edit</h2>
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
        <legend>PacienteE</legend>
        <%: Html.HiddenFor(model => model.IdPaciente) %>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.NomePaciente) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.NomePaciente) %>
            <%: Html.ValidationMessageFor(model => model.NomePaciente) %>
        </div>
        <img src='<%: Url.Action("GetImage", "Paciente", new RouteValueDictionary(new { id = Model.IdPaciente})) %>'
            width="100" height="110" alt="<%: Url.Action("GetImage", "Paciente", new RouteValueDictionary(new { id = Model.IdPaciente})) %>" />
        <input type="file" name="Arquivo" value="Selecione a imagem" onchange="readURL(this);" />
        <%: Html.ValidationMessageFor(model => model.Foto)%>
        <br />
            
        <img class="media" id="PreviewDaImagem" src="" alt="Definir Imagem Padrão" style="width: 250px;
            height: 250px;" />
    <div class="form-actions">
        <input class="btn" type="submit" value="Save" />
    </div>
    </fieldset>
    <% } %>
    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>
</asp:Content>
