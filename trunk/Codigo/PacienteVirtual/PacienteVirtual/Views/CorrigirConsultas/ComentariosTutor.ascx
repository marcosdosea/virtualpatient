<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.ConsultaVariavelModel>" %>
<% using (Html.BeginForm("ComentariosTutor", "CorrigirConsultas")) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.tutor_comentarios %></legend>
        <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
        <%: Html.HiddenFor(model => model.IdTurma) %>
        <%: Html.HiddenFor(model => model.IdPessoa) %>
        <%: Html.HiddenFor(model => model.IdRelato) %>
        <%: Html.HiddenFor(model => model.IdConsultaFixo) %>
        <%: Html.HiddenFor(model => model.IdEstadoConsulta) %>
        <%: Html.HiddenFor(model => model.DataPreenchimento) %>
        <%: Html.HiddenFor(model => model.ResumoPlanoCuidados) %>
        <%: Html.HiddenFor(model => model.IdRazaoEncontro) %>
        <%: Html.HiddenFor(model => model.NotaAluno) %>
        <div class="row-fluid">
            <div class="span6">
                 <div class="editor-label">
                    <%: Html.LabelFor(model => model.ComentariosTutor) %>
                </div>
                <div class="editor-field">
                    <%: Html.TextAreaFor(model => model.ComentariosTutor, new { style = "width:479px;" })%>
                    <%: Html.ValidationMessageFor(model => model.ComentariosTutor, string.Empty, new { @class = "styleValidation" })%>
                </div>
            </div>
        </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>"/>
    </div>
    </fieldset>
<% } %>
