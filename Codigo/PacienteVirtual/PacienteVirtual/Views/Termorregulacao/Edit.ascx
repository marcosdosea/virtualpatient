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
                    <%: Html.TextBoxFor(model => model.Temperatura, new { style = "width:60px;" })%>
                    <%: Html.ValidationMessageFor(model => model.Temperatura) %>
                </div>
                <div class="editor-field">
                    <%: Html.LabelFor(model => model.TemperaturaPele) %>
                    <%: Html.EnumDropDownListFor(model => model.TemperaturaPele, ListaTemperaturaPele.Quente) %>
                    <%: Html.ValidationMessageFor(model => model.TemperaturaPele) %>
                </div>
            </div>
            <div id="checks" class="span12">
                <div class="span3">
                    <%: Html.EditorFor(model => model.Sudorese) %>
                    <%: Resources.Mensagem.sudorese %>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Calafrio) %>
                    <%: Resources.Mensagem.calafrio %>
                </div>
                <div class="span3">
                    <%: Html.EditorFor(model => model.Piloerecao) %>
                    <%: Resources.Mensagem.piloerecao %>
                </div>
            </div>
        </div>

        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
        </div>
    </fieldset>
    <style>
        #checks
        {
            position: relative;
            top: 17px;
        }
    </style>

<% } %>

