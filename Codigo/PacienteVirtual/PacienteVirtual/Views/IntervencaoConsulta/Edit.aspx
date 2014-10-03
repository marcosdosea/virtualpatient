<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.IntervencaoConsultaModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.intervencao %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.editar %></h2>

<% using (Html.BeginForm("Edit", "IntervencaoConsulta")) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.intervencao %></legend>
        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
        <%: Html.HiddenFor(model => model.IdIntervencao) %>
        <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DescricaoIntervencao) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.DescricaoIntervencao, new { id = "textbox" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.Label(Resources.Mensagem.comunicacao) %>
            </div>
        </div>
        <div class="span1">
            <div class="editor-field">
                <%: Html.LabelFor(model => model.Paciente) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Paciente) %>
                <%: Html.ValidationMessageFor(model => model.Paciente, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
        <div class="span1">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Outro) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.Outro) %>
                <%: Html.ValidationMessageFor(model => model.Outro, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>

    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Justificativa) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.Justificativa)%>
                <%: Html.ValidationMessageFor(model => model.Justificativa, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
    </fieldset>
<% } %>

<div class="btn btn-primary">
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Edit2", "Consulta", Model.IdConsultaVariavel, new { @style = "color:White; font-size:small;"})%>
</div>

<script type="text/javascript">
    document.getElementById('textbox').disabled = true;
</script>

</asp:Content>
