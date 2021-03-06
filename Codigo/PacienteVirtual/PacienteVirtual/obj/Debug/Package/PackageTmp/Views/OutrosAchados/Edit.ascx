﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.ConsultaVariavelModel>" %>

<% using (Html.BeginForm("Edit", "ConsultaVariavel")) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.outros_achados %></legend>
        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
        <%: Html.HiddenFor(model => model.IdTurma) %>
        <%: Html.HiddenFor(model => model.IdPessoa) %>
        <%: Html.HiddenFor(model => model.IdRelato) %>
        <%: Html.HiddenFor(model => model.IdConsultaFixo) %>
        <%: Html.HiddenFor(model => model.IdEstadoConsulta) %>
        <%: Html.HiddenFor(model => model.DataPreenchimento) %>
        <%: Html.HiddenFor(model => model.ResumoPlanoCuidados) %>
        <%: Html.HiddenFor(model => model.ComentariosTutor) %>
        <%: Html.HiddenFor(model => model.NotaAluno) %>
        <%: Html.HiddenFor(model => model.IdRazaoEncontro) %>
        <%: Html.HiddenFor(model => model.DescricaoEstadoConsulta) %>
        <%: Html.HiddenFor(model => model.AbaAuxiliar, new { Id = "AbaAuxiliarOutrosAchados" })%>

        <div class="row-fluid">
            <div class="span6">
                <div class="editor-field" >
                    <%: Html.LabelFor(model => model.DescricaoOutrosAchados) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextAreaFor(model => model.DescricaoOutrosAchados, new { style = "width:579px;height:350px" })%>
                    <%: Html.ValidationMessageFor(model => model.DescricaoOutrosAchados, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>

    <div class="form-actions">
        <input class="btn btn-primary" onclick="$('#AbaAuxiliarOutrosAchados').val('10');" type="submit" value="<%: Resources.Mensagem.salvar %>" />
    </div>
    </fieldset>
<% } %>
