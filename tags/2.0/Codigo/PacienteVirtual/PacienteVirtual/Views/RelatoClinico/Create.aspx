<%@ Page Title="" Language="C#" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.RelatoClinicoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.criar %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%: Resources.Mensagem.criar %></h2>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
    <script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>"
        type="text/javascript"></script>
    <% using (Html.BeginForm("Create", "RelatoClinico", FormMethod.Post, new { enctype = "multipart/form-data" }))
       { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend>
            <%: Resources.Mensagem.relato_clinico %></legend>

        <p style="font-style: italic; color: Red; font-size: small;"><%= Html.Encode(TempData["MensagemErro"])%></p>

        <div class="span5">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.NomePaciente) %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdPaciente", null, Resources.Mensagem.selecione, new { onchange = "this.form.action = 'Create'; this.form.submit();" })%>
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
                <%: Html.ValidationMessageFor(model => model.RelatoTextual, string.Empty, new { @class = "styleValidation" })%>
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
                <%: Html.EditorFor(model => model.OrdemCronologica) %>
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
                <%: Html.EditorFor(model => model.NivelDificuldade) %>
                <%: Html.ValidationMessageFor(model => model.NivelDificuldade, string.Empty, new { @class = "styleValidation" })%>
            </div>
            <div class="form-actions">
                <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
            </div>
        </div>
    </fieldset>
    <% } %>
    <div>
        <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
    </div>
</asp:Content>
