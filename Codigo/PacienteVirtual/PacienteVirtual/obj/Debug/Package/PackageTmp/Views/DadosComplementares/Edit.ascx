<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.ConsultaVariavelModel>" %>

<% using (Html.BeginForm("Edit", "ConsultaVariavel"))
   { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.dados_complementares %></legend>
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
        <%: Html.HiddenFor(model => model.DescricaoOutrosAchados) %>
        <%: Html.HiddenFor(model => model.DescricaoEstadoConsulta) %>
        <%: Html.HiddenFor(model => model.AbaAuxiliar, new { Id = "AbaAuxiliar" })%>

        <div class="row-fluid">
            <div class="span6">
                <div class="editor-field" >
                    <%: Html.LabelFor(model => model.DescricaoDadosComplementares) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextAreaFor(model => model.DescricaoDadosComplementares, new { style = "width:579px;height:220px" })%>
                    <%: Html.ValidationMessageFor(model => model.DescricaoDadosComplementares, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span6">
                <div class="editor-field" >
                    <%: Html.LabelFor(model => model.InfoFornecidas) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextAreaFor(model => model.InfoFornecidas, new { style = "width:579px;height:220px" })%>
                    <%: Html.ValidationMessageFor(model => model.InfoFornecidas, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>

    <div class="form-actions">
        <input class="btn btn-primary" onclick="$('#AbaAuxiliar').val('9');" type="submit"  value="<%: Resources.Mensagem.salvar %>"/>
    </div>

    </fieldset>
<% } %>