<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.MedicamentoPrescritoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.medicamento_prescrito %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.editar %></h2>

<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.medicamento_prescrito %></legend>
        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
        <%: Html.HiddenFor(model => model.IdMedicamento) %>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.MedicamentoNome) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.MedicamentoNome, new { id = "textbox" })%>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Fitoterapico) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Fitoterapico) %>
            <%: Html.ValidationMessageFor(model => model.Fitoterapico, string.Empty, new { @class = "styleValidation" })%>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Dosagem) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Dosagem) %>
            <%: Html.ValidationMessageFor(model => model.Dosagem, string.Empty, new { @class = "styleValidation" })%>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Posologia) %>
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Posologia, new { @class = "textbox", style = "width:276px;", MaxLength = 100 })%>
            <%: Html.ValidationMessageFor(model => model.Posologia, string.Empty, new { @class = "styleValidation" })%>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Prescritor) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Prescritor) %>
            <%: Html.ValidationMessageFor(model => model.Prescritor, string.Empty, new { @class = "styleValidation" })%>
        </div>

        <div class="editor-label">
            <%: Html.LabelFor(model => model.Especialidade) %>
        </div>
        <div class="editor-field">
            <%: Html.EditorFor(model => model.Especialidade) %>
            <%: Html.ValidationMessageFor(model => model.Especialidade, string.Empty, new { @class = "styleValidation" })%>
        </div>

        <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
    </fieldset>
<% } %>

<div class="btn btn-primary">
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Edit", "Consulta", Model.IdConsultaVariavel, new { @style = "color:White; font-size:small;"})%>
</div>

<script type="text/javascript">
    document.getElementById('textbox').disabled = true;
</script>
</asp:Content>

