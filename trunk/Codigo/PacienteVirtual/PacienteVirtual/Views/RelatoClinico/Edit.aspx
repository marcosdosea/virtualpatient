<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.RelatoClinicoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.editar %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%: Resources.Mensagem.editar %></h2>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <% using (Html.BeginForm())
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>
            <%: Resources.Mensagem.relato_clinico %></legend>

        <p style="font-style: italic; color: Red; font-size: small;"><%= Html.Encode(TempData["MensagemErro"])%></p>


        <%: Html.HiddenFor(model => model.IdRelato) %>
        <div class="span5">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.NomePaciente) %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdPaciente", null, new { onchange = "this.form.action = 'Create'; this.form.submit();" })%>
                <%: Html.ValidationMessageFor(model => model.IdPaciente, string.Empty, new { @class = "styleValidation" })%>
            </div>
            <div class="editor-label">
                <%: Html.LabelFor(model => model.AreaAtuacao) %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdAreaAtuacao", Resources.Mensagem.selecione)%>
                <%: Html.ValidationMessageFor(model => model.IdAreaAtuacao, string.Empty, new { @class = "styleValidation" })%>
            </div>
            <div class="editor-label">
                <%: Html.LabelFor(model => model.RelatoTextual) %>
            </div>
            <div class="editor-field  left">
                <%: Html.TextAreaFor(model => model.RelatoTextual, new {@class="span5",@cols = "100", @rows = "18" }) %>
                <%: Html.ValidationMessageFor(model => model.RelatoTextual) %>
            </div>
        </div>
        <div class="span5">
            <div>
                <img class="media" id="PreviewDaImagem" src="<%: Url.Action("GetImage", "Paciente") %>/<%: ViewBag.fotoId %>"
                    alt="Definir Imagem Padrão" style="width: 200px; height: 200px;" />
            </div>
            <br />
            <div class="editor-label">
                <%: Html.LabelFor(model => model.OrdemCronologica) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.OrdemCronologica, new { PlaceHolder = "Ex: 1", onkeypress = "return SomenteNumeroCampo(event);" })%>
                <%: Html.ValidationMessageFor(model => model.OrdemCronologica, string.Empty, new { @class = "styleValidation" })%>
            </div>
            <div class="editor-label">
                <%: Html.LabelFor(model => model.RelatoVideo) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.RelatoVideo) %>
                <%: Html.ValidationMessageFor(model => model.RelatoVideo, string.Empty, new { @class = "styleValidation" })%>
            </div>
            <div class="editor-label">
                <%: Html.LabelFor(model => model.NivelDificuldade) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.NivelDificuldade, new { PlaceHolder = "Ex: 1", onkeypress = "return SomenteNumero(event);" }) %>
                <%: Html.ValidationMessageFor(model => model.NivelDificuldade, string.Empty, new { @class = "styleValidation" })%>
            </div>
            <div class="form-actions">
                <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
            </div>
        </div>
    </fieldset>
    <% } %>
    <% using (Html.BeginForm("Index", "RelatoClinico", FormMethod.Post))
       { %>
    <p>
        <%: Html.ActionLink(Resources.Mensagem.voltar, "Index", new { IdPaciente = Model.IdPaciente }, new { onclick = "this.form.submit();" })%>
    </p>
    <% } %>

    <script type="text/javascript">
        function SomenteNumeroCampo(e) {
            var tecla = (window.event) ? event.keyCode : e.which;
            if ((tecla > 47 && tecla < 58 || tecla == 46)) { return true; }
            else {
                return false;
            }
        }
    </script>
</asp:Content>
