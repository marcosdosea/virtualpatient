<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.AlergiaExamesFisicosModel>" %>
<% using (Html.BeginForm("AdicionarAlergia", "ExamesFisicos"))
   { %>
<%: Html.ValidationSummary(true) %>
<fieldset>
    <legend><%: Resources.Mensagem.adicionar_alergia %></legend>
    <%: Html.HiddenFor(model => model.IdConsultaVariavel) %>
    <div class="row-fluid">
        <div class="span3">
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Alergia) %>
            </div>
        </div>
        <div class="span6">
            <div class="editor-field">
                <%: Html.DropDownList("IdAlergia", Resources.Mensagem.selecione)%>
                <%: Html.ValidationMessageFor(model => model.IdAlergia) %>
            </div>
        </div>
        <div class="span2">
            <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.adicionar_alergia %>" />
        </div>
    </div>
</fieldset>
<% } %>
