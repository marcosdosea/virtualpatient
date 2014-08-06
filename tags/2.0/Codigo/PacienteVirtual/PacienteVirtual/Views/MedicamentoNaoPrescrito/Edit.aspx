<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.MedicamentoNaoPrescritoModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.medicamento_nao_prescrito %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.editar %></h2>

<% using (Html.BeginForm("Edit", "MedicamentoNaoPrescrito")) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.medicamento_nao_prescrito %></legend>
        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
        <%: Html.HiddenFor(model => model.IdMedicamento) %>
        <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.MedicamentoNome) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.MedicamentoNome, new { id = "textbox" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Fitoterapico) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Fitoterapico) %>
                <%: Html.ValidationMessageFor(model => model.Fitoterapico, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Dosagem) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Dosagem, new { @class = "textbox", style = "width:276px;" })%>
                <%: Html.ValidationMessageFor(model => model.Dosagem, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Posologia) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Posologia, new { @class = "textbox", style = "width:276px;" })%>
                <%: Html.ValidationMessageFor(model => model.Posologia, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
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
