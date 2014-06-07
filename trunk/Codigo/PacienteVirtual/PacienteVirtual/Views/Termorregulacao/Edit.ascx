<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.TermorregulacaoModel>" %>
<%@ Import Namespace="PacienteVirtual.Helpers" %>
<%@ Import Namespace="PacienteVirtual.Models" %>

<% using (Html.BeginForm("Edit", "Termorregulacao")) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.termorregulacao %></legend>
        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>

        <div class="row-fluid">
            <div class="span12">
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.Temperatura) %>
                    <%: Html.TextBoxFor(model => model.Temperatura, new { style = "width:60px;" })%> °C
                    <%: Html.ValidationMessageFor(model => model.Temperatura, string.Empty, new { @class = "styleValidation" })%>
                </div>
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.TemperaturaPele) %>
                    <%: Html.EnumDropDownListFor(model => model.TemperaturaPele, ListaTemperaturaPele.Quente) %>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <%: Html.ValidationMessageFor(model => model.ErroTemperaturaPele, string.Empty, new { @class = "styleValidation" })%>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span12">
                <%: Html.EditorFor(model => model.Sudorese) %>
                <%: Resources.Mensagem.sudorese %>
                <%: Html.ValidationMessageFor(model => model.Sudorese, string.Empty, new { @class = "styleValidation" })%>
                <%: Html.EditorFor(model => model.Calafrio) %>
                <%: Resources.Mensagem.calafrio %>
                <%: Html.ValidationMessageFor(model => model.Calafrio, string.Empty, new { @class = "styleValidation" })%>
                <%: Html.EditorFor(model => model.Piloerecao) %>
                <%: Resources.Mensagem.piloerecao %>
                <%: Html.ValidationMessageFor(model => model.Piloerecao, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>

        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
        </div>
    </fieldset>

<% } %>

