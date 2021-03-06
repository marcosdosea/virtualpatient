﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PacienteVirtual.Models.DiarioPessoalModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: Resources.Mensagem.diario_pessoal %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2><%: Resources.Mensagem.editar %></h2>

<% using (Html.BeginForm()) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.diario_pessoal %></legend>

        <%: Html.HiddenFor(model => model.IdConsultaFixo) %>
        <%: Html.HiddenFor(model => model.IdMedicamento) %>
        <%: Html.HiddenFor(model => model.Periodo) %>
        <%: Html.HiddenFor(model => model.Horario) %>

        <div class="row-fluid">
            <div class="span2">
                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Medicamento) %>
                </div>
            </div>
            <div class="span6">
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.Medicamento, new { id = "textbox", style = "width:312px;" })%>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span2">
                <div class="editor-label">
                    <%: Html.LabelFor(model => model.Dose) %>
                </div>
            </div>
            <div class="span6">
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.Dose, new { style = "width:312px;" })%>
                </div>
            </div>
        </div>
        <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Quantidade)%>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Quantidade, new { @class = "textbox", style = "width:312px;" })%>
                <%: Html.ValidationMessageFor(model => model.Quantidade, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Periodo)%>
            </div>
        </div>
        <div class="span9">
            <div class="editor-field" >
                <%: Html.TextBoxFor(model => model.Periodo ,new { id = "textbox2", style = "width:312px;" })%>    
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <%: Html.Label(Resources.Mensagem.horario_observacao)%>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Horario, new { id = "textbox3", style = "width:70px;" })%>
                <!--span class="add-on"><i class="icon-time"></i></span -->
                <%: Html.ValidationMessageFor(model => model.Horario, string.Empty, new { @class = "styleValidation" })%>
                hrs (Ex: 07:00)
            </div>
        </div>
    </div>
    <div class="row-fluid">
            <div class="span2">
                <div class="editor-label">
                    <%: Html.LabelFor(model => model.HorarioComplemento) %>
                </div>
            </div>
            <div class="span6">
                <div class="editor-field">
                    <%: Html.TextBoxFor(model => model.HorarioComplemento, new { style = "width:312px;" })%>
                </div>
            </div>
        </div>
    <div class="row-fluid">
        <div class="span2">
            <div class="editor-label">
                <!--%: Html.LabelFor(model => model.NomeBebida) % -->
                <%: Resources.Mensagem.tipo_bebida %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.DropDownList("IdBebida",null, Resources.Mensagem.selecione, new { style = "width:320px;" })%>
                <%: Html.ValidationMessageFor(model => model.IdBebida, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>

        <div class="form-actions">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>" />
        </div>
    </fieldset>
<% } %>

<div class="btn btn-primary">
    <%: Html.ActionLink(Resources.Mensagem.voltar, "Edit2", "Consulta", Model.IdConsultaFixo, new { @style = "color:White; font-size:small;"})%>
</div>
<script type="text/javascript">
    document.getElementById('textbox').disabled = true;
    document.getElementById('textbox2').disabled = true;
    document.getElementById('textbox3').disabled = true;
</script>
</asp:Content>
