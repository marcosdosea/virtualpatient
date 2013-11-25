﻿
<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.DemograficosAntropometricosModel>" %>
<% Html.BeginForm("Edit", "DemograficosAntropometicos");%>

<% using (Html.BeginForm())
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend>
        <%: Resources.Mensagem.demografico_antropometricos %></legend>
    <%: Html.HiddenFor(model => model.IdConsultaFixo) %>
    <div class="row-fluid">
        <div class="span4">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Nome) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Nome, new { @class = "textbox", style = "width:579px;" })%>
                <%: Html.ValidationMessageFor(model => model.Nome) %>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span4">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.MedicosAtendem)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.MedicosAtendem, new { @class = "textbox", style = "width:579px;" })%>
                <%: Html.ValidationMessageFor(model => model.MedicosAtendem)%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span4">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.MoradiaFamilia)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.MoradiaFamilia, new { @class = "textbox", style = "width:579px;" })%>
                <%: Html.ValidationMessageFor(model => model.MoradiaFamilia)%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span4">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.OndeAdquireMedicamentos)%>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.OndeAdquireMedicamentos, new { @class = "textbox", style = "width:579px;" })%>
                <%: Html.ValidationMessageFor(model => model.OndeAdquireMedicamentos)%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Genero) %>
            </div>
            <div class="editor-field">
                <!--%: Html.DropDownList("Valor", new SelectList(ViewBag.Sexo))% -->
                <!--%: Html.TextBoxFor(model => model.Genero)%-->
                <%= Html.RadioButtonFor(model => model.Genero, "M" ) %>
                <%: Resources.Mensagem.masculino %>
                &nbsp &nbsp
                <%= Html.RadioButtonFor(model => model.Genero, "F")%>
                <%: Resources.Mensagem.feminino %>
                <%: Html.ValidationMessageFor(model => model.Genero) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.DataNascimento) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.DataNascimento, new {  @Value = (String.Format("{0:dd/MM/yyyy}", Model.DataNascimento)), type = "text", id = "calendario" , style = "width:176px;"}) %>
                <%: Html.ValidationMessageFor(model => model.DataNascimento)%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.EscolaridadeNivel) %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdEscolaridade", Resources.Mensagem.selecione)%>
                <%: Html.ValidationMessageFor(model => model.IdEscolaridade)%>
            </div>
        </div>
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.OcupacaoDescricao) %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdOcupacao", Resources.Mensagem.selecione)%>
                <%: Html.ValidationMessageFor(model => model.IdOcupacao)%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span6">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.PlanoSaudeNome) %>
            </div>
            <div class="editor-field">
                <%: Html.DropDownList("IdPlanoSaude", Resources.Mensagem.selecione)%>
                <%: Html.ValidationMessageFor(model => model.IdPlanoSaude) %>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
</fieldset>
<% } %>
<% Html.EndForm();%>