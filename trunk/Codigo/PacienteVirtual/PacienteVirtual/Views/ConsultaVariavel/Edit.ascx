<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.ConsultaVariavelModel>" %>
<% using (Html.BeginForm("Edit", "ConsultaVariavel")) { %>
    <%: Html.ValidationSummary(true) %>
    <fieldset>
        <legend><%: Resources.Mensagem.razao_encontro %></legend>
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
        <%: Html.HiddenFor(model => model.AbaAuxiliar, new { Id = "AbaAuxiliar" })%>
        <div class="row-fluid">
        <div class="span6">
            <div class="editor-field" >
                <%: Html.DropDownList("IdRazaoEncontro", null, Resources.Mensagem.selecione, new { style = "width:550px;" })%>
                <%: Html.ValidationMessageFor(model => model.IdRazaoEncontro, string.Empty, new { @class = "styleValidation" })%>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" onclick="$('#AbaAuxiliar').val('2');" type="submit" value="<%: Resources.Mensagem.salvar %>"/>
    </div>
    </fieldset>
<% } %>