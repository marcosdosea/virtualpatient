<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.QueixaMedicamentoModel>" %>
<% using (Html.BeginForm("Create", "QueixaMedicamento"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend>
        <%: Resources.Mensagem.queixa_medicamento %></legend>
    <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    <div class="row-fluid">
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Queixa) %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdQueixaMedicamento", Resources.Mensagem.selecione)%>
                <%: Html.ValidationMessageFor(model => model.IdQueixaMedicamento) %>
            </div>
        </div>
    </div>
    <p></p>
    <div class="row-fluid">
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.NomeMedicamento) %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdMedicamento", Resources.Mensagem.selecione)%>
                <%: Html.ValidationMessageFor(model => model.IdMedicamento) %>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Dose) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Dose, new { @class = "textbox", style = "width:127px;" })%>
                <%: Html.ValidationMessageFor(model => model.Dose) %>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Desde) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Desde, new { @class = "textbox", style = "width:127px;" })%>
                <%: Html.ValidationMessageFor(model => model.Desde) %>
            </div>
        </div>
    </div>
    <p></p>
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Necessario) %>
            </div>
            <div class="editor-field">
                <%= Html.RadioButtonFor(model => model.Necessario, true)%> <%: Resources.Mensagem.sim %>
                &nbsp &nbsp 
                <%= Html.RadioButtonFor(model => model.Necessario, false)%> <%: Resources.Mensagem.nao %>
                <%: Html.ValidationMessageFor(model => model.Necessario) %>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Efetivo) %>
            </div>
            <div class="editor-field">
                <%= Html.RadioButtonFor(model => model.Efetivo, true)%> <%: Resources.Mensagem.sim %>
                &nbsp &nbsp 
                <%= Html.RadioButtonFor(model => model.Efetivo, false)%> <%: Resources.Mensagem.nao %>
                <%: Html.ValidationMessageFor(model => model.Efetivo) %>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Seguro) %>
            </div>
            <div class="editor-field">
                <%= Html.RadioButtonFor(model => model.Seguro, true)%> <%: Resources.Mensagem.sim %>
                &nbsp &nbsp 
                <%= Html.RadioButtonFor(model => model.Seguro, false)%> <%: Resources.Mensagem.nao %>
                <%: Html.ValidationMessageFor(model => model.Seguro) %>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Cumprimento) %>
            </div>
            <div class="editor-field">
                <%= Html.RadioButtonFor(model => model.Cumprimento, true)%> <%: Resources.Mensagem.sim %>
                &nbsp &nbsp 
                <%= Html.RadioButtonFor(model => model.Cumprimento, false)%> <%: Resources.Mensagem.nao %>
                <%: Html.ValidationMessageFor(model => model.Cumprimento) %>
            </div>
        </div>
    </div>
    <p></p>
    <div class="row-fluid">
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.SuspeitaPRM) %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdSuspeitaPrm", Resources.Mensagem.selecione)%>
                <%: Html.ValidationMessageFor(model => model.IdSuspeitaPRM) %>
            </div>
        </div>
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Resolvido) %>
            </div>
            <div class="editor-field">
                <%= Html.RadioButtonFor(model => model.Resolvido, true)%> <%: Resources.Mensagem.sim %>
                &nbsp &nbsp 
                <%= Html.RadioButtonFor(model => model.Resolvido, false)%> <%: Resources.Mensagem.nao %>
                <%: Html.ValidationMessageFor(model => model.Resolvido) %>
            </div>
        </div>
    </div>
    <p></p>
    <div class="row-fluid">
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DescricaoAcaoQueixa1) %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdAcaoQueixa1", Resources.Mensagem.selecione)%>
                <%: Html.ValidationMessageFor(model => model.IdAcaoQueixa1) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DescricaoAcaoQueixa2) %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdAcaoQueixa2", Resources.Mensagem.selecione)%>
                <%: Html.ValidationMessageFor(model => model.IdAcaoQueixa2) %>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.adicionar %>" />
    </div>
</fieldset>
<% } %>
