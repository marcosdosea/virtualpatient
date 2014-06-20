<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.DiagnosticoConsultaModel>" %>
<%@ Import Namespace = "PacienteVirtual.Helpers" %>

<% using (Html.BeginForm("Create", "DiagnosticoConsulta")) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.diagnostico %></legend>
        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
        <% using (Html.BeginForm("Create", "DiagnosticoConsulta", FormMethod.Post, null))
       { %>
        <div class="row-fluid">
            <div class="span3">
                <div class="editor-label">
                    <%: Html.LabelFor(model => model.DescricaoGrupoDiagnostico) %>
                </div>
            </div>
            <div class="span6">
                <div class="editor-field">
                    <%: Html.DropDownList("IdGrupoDiagnostico", null, Resources.Mensagem.selecione, new { onchange = "this.form.submit();" })%>
                    <%: Html.ValidationMessageFor(model => model.IdGrupoDiagnostico, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
        <% } %>
        <br />
        <div class="row-fluid">
            <div class="span3">
                 <div class="editor-label">
                    <%: Html.LabelFor(model => model.DescricaoDiagnostico)%>
                </div>
            </div>
            <div class="span6">
                <div class="editor-field">
                    <%: Html.DropDownList("IdDiagnostico", null, Resources.Mensagem.selecione)%>
                    <%: Html.ValidationMessageFor(model => model.IdDiagnostico, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span3">
                 <div class="editor-label">
                    <% if (Session["_Risco"].Equals(false))
                       { %>
                        <%: Resources.Mensagem.fatores_relacionados %>
                    <% }else{ %>
                        <%: Resources.Mensagem.fatores_risco %>
                    <% } %>
                </div>
            </div>
            <div class="span7">
                <div class="editor-field">
                    <%: Html.TextAreaFor(model => model.Fatores, new { style = "width:400px;height:200px;" })%>
                    <%: Html.ValidationMessageFor(model => model.Fatores) %>
                </div>
            </div>
        </div>
        <br />
        <% if (Session["_Risco"].Equals(false))
           { %>
        <div class="row-fluid">
            <div class="span3">
                <div class="editor-label">
                    <%: Html.LabelFor(model => model.CaracteristicasDefinidoras) %>
                </div>
            </div>
            <div class="span7">
                <div class="editor-field">
                    <%: Html.TextAreaFor(model => model.CaracteristicasDefinidoras, new { style = "width:400px;height:200px;" })%>
                    <%: Html.ValidationMessageFor(model => model.CaracteristicasDefinidoras) %>
                </div>
            </div>
        </div>
        <br />
        <% }
           else
           { %>
        <div class="row-fluid">
            <div class="span3">
                <div class="editor-label">
                    <%: Html.LabelFor(model => model.CaracteristicasDefinidoras) %>
                </div>
            </div>
            <div class="span7">
                <div class="editor-field">
                    <%= Html.TextBoxFor(model => model.CaracteristicasDefinidoras, new { id = "textbox" })%>
                    <%: Html.ValidationMessageFor(model => model.CaracteristicasDefinidoras) %>
                </div>
            </div>
        </div>
        <br />
        <% } %>

        <div class="row-fluid">
            <div class="span3">
                 <div class="editor-label">
                    <%: Html.LabelFor(model => model.ResultadoEsperado) %>
                </div>
            </div>
            <div class="span7">
                <div class="editor-field">
                    <%: Html.TextAreaFor(model => model.ResultadoEsperado, new { style = "width:400px;height:200px;" })%>
                    <%: Html.ValidationMessageFor(model => model.ResultadoEsperado) %>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span3">
                 <div class="editor-label">
                    <%: Html.LabelFor(model => model.PrescricaoCuidado) %>
                </div>
            </div>
            <div class="span7">
                <div class="editor-field">
                    <%: Html.TextAreaFor(model => model.PrescricaoCuidado, new { style = "width:400px;height:200px;" })%>
                    <%: Html.ValidationMessageFor(model => model.PrescricaoCuidado) %>
                </div>
            </div>
        </div>
        <br />
        <div class="row-fluid">
            <div class="span3">
                 <div class="editor-label">
                    <%: Html.LabelFor(model => model.AvaliacaoResultados) %>
                </div>
            </div>
            <div class="span7">
                <div class="editor-field">
                    <%: Html.TextAreaFor(model => model.AvaliacaoResultados, new { style = "width:400px;height:200px;" })%>
                    <%: Html.ValidationMessageFor(model => model.AvaliacaoResultados) %>
                </div>
            </div>
        </div>

        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.adicionar %>" />
        </div>
    </fieldset>
    <div class="styleValidation">
        <%: Html.QuebraLinhaFor(model => model.ErroDiagnostico) %>
    </div>
<% } %>
<script type="text/javascript">
    document.getElementById('textbox').disabled = true;
</script>
