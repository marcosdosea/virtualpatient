<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.RelatoClinicoModel>" %>

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
        <div class="span5">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.NomePaciente) %>
            </div>
            <div class="editor-field">
                <!--%: Html.DropDownList("IdPaciente", null, Resources.Mensagem.selecione, new { @onchange = "Create = (model => model);" })%-->
                <%: Html.DropDownList("IdPaciente", null, Resources.Mensagem.selecione, new { onchange = "this.form.action = 'Create'; this.form.submit();" })%>
                <%: Html.ValidationMessageFor(model => model.IdPaciente) %>
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
            <div class="editor-label">
                <%: Html.LabelFor(model => model.OrdemCronologica) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.OrdemCronologica) %>
                <%: Html.ValidationMessageFor(model => model.OrdemCronologica) %>
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
                <input type="submit" value="<%: Resources.Mensagem.salvar %>" />
            </p>
        </div>
    </fieldset>
    <% } %>
    <div>
        <%: Html.ActionLink(Resources.Mensagem.voltar, "Index") %>
    </div>
</asp:Content>
