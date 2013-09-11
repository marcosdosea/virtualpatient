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
        <%: Html.HiddenFor(model => model.Lembretes) %>
        <%: Html.HiddenFor(model => model.ComentariosTutor) %>
        <div class="row-fluid">
        <div class="span6">
            <div class="editor-field">
                <%: Html.DropDownList("IdRazaoEncontro", Resources.Mensagem.selecione)%>
                <%: Html.ValidationMessageFor(model => model.IdRazaoEncontro)%>
            </div>
        </div>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.salvar %>"/>
    </div>
    </fieldset>
<% } %>
