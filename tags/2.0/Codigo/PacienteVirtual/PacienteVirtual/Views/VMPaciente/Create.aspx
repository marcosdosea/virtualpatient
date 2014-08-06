<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.ViewModel.VMPaciente>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Create
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Create</h2>
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
    <% using (Html.BeginForm("Create", "VMPaciente", FormMethod.Post, new { enctype = "multipart/form-data" }))
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>

        <% int i = 0;  %>

        <legend>VMPaciente</legend>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.paciente.NomePaciente) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.paciente.NomePaciente) %>
            <%: Html.ValidationMessageFor(model => model.paciente.NomePaciente)%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.paciente.Foto)%>
        </div>
        <div class="editor-field">
            <img class="media" id="PreviewDaImagem" src="" alt="Definir Imagem Padrão" style="width: 250px;
                height: 250px;" />
            <input type="file" name="Arquivo" value="Selecione a imagem" onchange="readURL(this);" />
            <%: Html.ValidationMessageFor(model => model.paciente.Foto)%>
        </div>
        <br />
        <div class="progress progress-info progress-striped">
            <div class="bar" style="width: 100%">
            </div>
        </div>
        <br />
        <div class="editor-label">
            <%: Html.LabelFor(model => model.relatosClinico[i].OrdemCronologica) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.relatosClinico[i].OrdemCronologica)%>
            <%: Html.ValidationMessageFor(model => model.relatosClinico[i].OrdemCronologica)%>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.relatosClinico[i].RelatoTextual)%>
        </div>
        <div class="control-group">
            <label class="control-label">
                Observação</label>
            <div id="obs" class="controls">
                <%:  Html.TextAreaFor(model => model.relatosClinico[i].RelatoTextual)%>
            </div>
            <div class="editor-field">
                <%: Html.ValidationMessageFor(model => model.relatosClinico[i].RelatoTextual)%>
            </div>
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.relatosClinico[i].RelatoVideo) %>
        </div>
        relato de Vídeo ainda não fuciona
        <div class="editor-field">
            <input type="file" name="Arquivo" value="Selecione o video" />
        </div>
        <div class="editor-label">
            <%: Html.LabelFor(model => model.relatosClinico[i].NivelDificuldade)%>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.relatosClinico[i].NivelDificuldade)%>
            <%: Html.ValidationMessageFor(model => model.relatosClinico[i].NivelDificuldade)%>
        </div>
        <p>
            <input type="submit" value="<%: Resources.Mensagem.salvar %>" />
        </p>
    </fieldset>
    <% } %>
    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>
</asp:Content>
