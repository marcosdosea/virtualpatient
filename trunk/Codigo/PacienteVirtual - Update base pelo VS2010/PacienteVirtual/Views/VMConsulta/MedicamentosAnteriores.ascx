<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<PacienteVirtual.Models.MedicamentosAnterioresModel>" %>
<div class="box-content">
    <table class="table table-bordered table-striped">
        <tr>
            <th>
                <%: Resources.Mensagem.indicacao %>
            </th>
            <th>
                <%: Resources.Mensagem.resposta %>
            </th>
            <th>
                <%: Resources.Mensagem.periodo %>
            </th>
            <th>
            </th>
        </tr>
        <% foreach (var item in ViewBag.MedicamentosAnteriores as List<PacienteVirtual.Models.MedicamentosAnterioresModel>)
           { %>
        <tr>
            <td>
                <%: Html.DisplayFor(items => item.Indicacao)%>
            </td>
            <td>
                <%: Html.DisplayFor(items => item.Resposta)%>
            </td>
            <td>
                <%: Html.DisplayFor(items => item.Periodo)%>
            </td>
            <td>
                <% using (Html.BeginForm())
                   { %>
                <%: Html.ActionLink(Resources.Mensagem.remover, "RemoverMedicamentosAnteriores", new { idConsultaV = item.IdConsultaVariavel, idMedicamento = item.IdMedicamento })%>
                <% } %>
            </td>
        </tr>
        <% } %>
    </table>
</div>
<% using (Html.BeginForm())
   { %>
<%: Html.ValidationSummary(true) %>
    <div class="editor-label">
        <%: Html.LabelFor(model => model.IdMedicamento) %>
    </div>
    <div class="editor-field">
        <%: Html.DropDownList("IdMedicamento", Resources.Mensagem.selecione)%>
        <%: Html.ValidationMessageFor(model => model.IdMedicamento) %>
    </div>
    <div class="editor-label">
        <%: Html.LabelFor(model => model.Indicacao) %>
    </div>
    <div class="editor-field">
        <%: Html.EditorFor(model => model.Indicacao) %>
        <%: Html.ValidationMessageFor(model => model.Indicacao) %>
    </div>
    <div class="editor-label">
        <%: Html.LabelFor(model => model.Resposta) %>
    </div>
    <div class="editor-field">
        <%: Html.EditorFor(model => model.Resposta) %>
        <%: Html.ValidationMessageFor(model => model.Resposta) %>
    </div>
    <div class="editor-label">
        <%: Html.LabelFor(model => model.Periodo) %>
    </div>
    <div class="editor-field">
        <%: Html.EditorFor(model => model.Periodo) %>
        <%: Html.ValidationMessageFor(model => model.Periodo) %>
    </div>
    <div class="form-actions">
        <input class="btn btn-primary" type="submit" value="<%: Resources.Mensagem.adicionar %>" />
    </div>
<% } %>
